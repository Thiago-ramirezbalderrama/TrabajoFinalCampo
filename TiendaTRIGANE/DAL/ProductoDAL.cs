using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ProductoDAL : Abstractions.Data.IProducto
    {

        private readonly Abstractions.Data.IAccesoDB _db;
        private readonly Abstractions.Data.IDigitosVerificadoresVerticales _dvv;
        private readonly Abstractions.Data.IBitacora _bitacora;

        public Producto(Abstractions.Data.IAccesoDB db = null, Abstractions.Data.IDigitosVerificadoresVerticales dvv = null, Abstractions.Data.IBitacora bitacora = null)
        {
            _db = db ?? new AccesoSqlServer();
            _dvv = dvv ?? new DigitosVerificadoresVerticales();
            _bitacora = bitacora ?? new Bitacora();
        }

        public async Task Create(IProducto producto)
        {
            try
            {
                var productos = await TraerRegistros();
                producto.ID = productos.Count > 0 ? productos.Last().ID + 1 : 1; //no es identidad para poder calcular el dvh correctamente
                producto.EstadoActivo = true;
                producto.DVH = Service.EncryptionManager.CalcularDVH(producto);

                SqlParameter[] parameters = {
                    new SqlParameter("@idProducto", producto.ID),
                    new SqlParameter("@Nombre", producto.Nombre),
                    new SqlParameter("@PrecioUnitario", producto.PrecioUnitario),
                    new SqlParameter("@idCategoria", producto.Categoria.ID),
                    new SqlParameter("@CantidadAlmacenes", producto.CantidadAlmacenes),
                    new SqlParameter("@CantidadGondolas", producto.CantidadGondolas),
                    new SqlParameter("@AdvertenciaBajoStock", producto.AdvertenciaBajoStock),
                    new SqlParameter("@Activo", producto.EstadoActivo),
                    new SqlParameter("@dv", producto.DVH)
                };
                await _db.WriteStoredProcedure("PRODUCTO_CREATE", parameters);
                await ActualizarDVV();
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Delete(IProducto producto)
        {
            producto.EstadoActivo = false;
            await Update(producto); // el metodo Update() se encarga de actualizar el digito verificador vertical
        }

        public async Task Update(IProducto producto)
        {
            try
            {
                SqlParameter[] parameters = {
                new SqlParameter("@idProducto", producto.ID),
                new SqlParameter("@Nombre", producto.Nombre),
                new SqlParameter("@PrecioUnitario", producto.PrecioUnitario),
                new SqlParameter("@idCategoria", producto.Categoria.ID),
                new SqlParameter("@CantidadGondolas", producto.CantidadGondolas),
                new SqlParameter("@CantidadAlmacenes", producto.CantidadAlmacenes),
                new SqlParameter("@AdvertenciaBajoStock", producto.AdvertenciaBajoStock),
                new SqlParameter("@Activo", producto.EstadoActivo),
                new SqlParameter("@dv", Service.EncryptionManager.CalcularDVH(producto))
            };

                await _db.WriteStoredProcedure("PRODUCTO_UPDATE", parameters);
                await ActualizarDVV();
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<IProducto>> GetAll()
        {
            try
            {
                var productos = await TraerRegistros();

                var resultadoVerificacion = Service.EncryptionManager.VerificarDVV(
                    productos.Cast<IEntidadPersistente>().ToList(),
                    (await _dvv.Get("productos")).DV
                );

                if (!resultadoVerificacion)
                {
                    await _bitacora.LogError("integrity_check_failed_unauthorized_addition_or_deletion_shortversion", "dvv", "products");
                    throw new Servicios.Excepciones.UnauthorizedInsertionOrDeletionException();
                }
                return productos.Where(producto => producto.EstadoActivo).ToList();
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<IProducto>> GetAll(ICategoria categoria)
        {
            return (await GetAll()).Where(producto => producto.Categoria.ID == categoria.ID).ToList();
        }

        public async Task<IList<IProducto>> GetAllInWarehouses()
        {
            return (await GetAll()).Where(producto => producto.CantidadAlmacenes > 0).ToList();
        }

        public async Task<IList<IProducto>> GetAllInShelves()
        {
            return (await GetAll()).Where(producto => producto.CantidadGondolas > 0).ToList();
        }

        private async Task<IList<IProducto>> TraerRegistros()
        {
            try
            {
                IList<IProducto> productos = new List<IProducto>();
                var tabla = await _db.ReadStoredProcedure("PRODUCTO_GET_ALL", null);
                var correctRowIntegrity = true;
                foreach (DataRow registro in tabla.Rows)
                {
                    ICategoria categoria = new Entities.Categoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        Nombre = registro["Categoria_Nombre"].ToString(),
                        Perecedera = bool.Parse(registro["Categoria_Perecedera"].ToString()),
                        PorcentajeDescuento = byte.Parse(registro["Categoria_PorcentajeDescuento"].ToString())
                    };

                    var producto = new Entities.Producto(categoria)
                    {
                        ID = int.Parse(registro["idProducto"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        PrecioUnitario = double.Parse(registro["PrecioUnitario"].ToString()),
                        CantidadAlmacenes = int.Parse(registro["CantidadAlmacenes"].ToString()),
                        CantidadGondolas = int.Parse(registro["CantidadGondolas"].ToString()),
                        AdvertenciaBajoStock = int.Parse(registro["AdvertenciaBajoStock"].ToString()),
                        EstadoActivo = (bool)registro["Activo"],
                        DVH = (byte[])registro["dv"]
                    };

                    if (!Service.EncryptionManager.VerificarDVH(producto))
                    {
                        await _bitacora.LogError("integrity_check_failed_unauthorized_update_shortversion", "dvv", producto.Nombre);
                        correctRowIntegrity = false;
                    }

                    productos.Add(producto);
                }
                if (!correctRowIntegrity)
                {
                    throw new Servicios.Excepciones.UnauthorizedUpdateException();
                }
                return productos;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task ActualizarDVV()
        {
            try
            {
                IList<IEntidadPersistente> objetos = (await TraerRegistros()).Cast<IEntidadPersistente>().ToList();
                await _dvv.Update(new Entities.DVV("productos", Service.EncryptionManager.CalcularDVV(objetos)));
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("dvh", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

    }
}
