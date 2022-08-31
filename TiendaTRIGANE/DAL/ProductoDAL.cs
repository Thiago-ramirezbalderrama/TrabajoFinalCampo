using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Abstracciones.Entities;

namespace DAL
{
    public class Producto : Abstracciones.DAL.IProducto
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;
        private readonly Abstracciones.DAL.IDigitosVerificadoresVerticales _dvv;
        private readonly Abstracciones.DAL.IBitacoraDAL _bitacora;
        private Abstracciones.DAL.ICategoria _categoriaDAL;

        public Producto(Abstracciones.DAL.IAccesoDB db = null, Abstracciones.DAL.IDigitosVerificadoresVerticales dvv = null, Abstracciones.DAL.IBitacoraDAL bitacora = null, Abstracciones.DAL.ICategoria categoriaDAL = null)
        {
            _db = db ?? new ConexionDAL();
            _dvv = dvv ?? new DigitosVerificadoresVerticales();
            _bitacora = bitacora ?? new BitacoraDAL();
            _categoriaDAL = categoriaDAL ?? new Categoria();
        }

        public async Task Create(IProducto producto)
        {
            try
            {
                var productos = await TraerRegistros();
                producto.ID = productos.Count > 0 ? productos.Last().ID + 1 : 1; //no es identidad para poder calcular el dvh correctamente
                producto.EstadoActivo = true;
                producto.DVH = Servicios.EncriptadoAdmin.CalcularDVH(producto);
                var idReturnValue = new SqlParameter("@idProducto", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                SqlParameter[] parameters = {
                    new SqlParameter("@idProducto", producto.ID),
                    new SqlParameter("@Nombre", producto.Nombre),
                    new SqlParameter("@PrecioUnitario", producto.PrecioUnitario),
                    new SqlParameter("@idCategoria", producto.Categoria.ID),
                    new SqlParameter("@CantidadDepositos", producto.CantidadDepositos),
                    new SqlParameter("@CantidadExhibidores", producto.CantidadExhibidores),
                    new SqlParameter("@AdvertenciaBajoStock", producto.AdvertenciaBajoStock),
                    new SqlParameter("@Activo", producto.EstadoActivo),
                    new SqlParameter("@dv", producto.DVH)
                };
                await _db.WriteStoredProcedure("PRODUCTO_CREATE", parameters);
                await ActualizarDVV();
                producto.ID = int.Parse(idReturnValue.Value.ToString());

                var tipoCambio = new BE.Palabra
                {
                    NombrePalabra = "addition"
                };
                await CreateSnapshot(producto, tipoCambio);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Delete(IProducto producto)
        {
            try
            {
                producto.EstadoActivo = false;
                await Update(producto); // el metodo Update() se encarga de actualizar el digito verificador vertical

                Abstracciones.Entities.Traductor.IPalabra tipoCambio = new BE.Palabra
                {
                    NombrePalabra = "deletion"
                };
                await CreateSnapshot(producto, tipoCambio);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
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
                new SqlParameter("@CantidadExhibidores", producto.CantidadExhibidores),
                new SqlParameter("@CantidadDepositos", producto.CantidadDepositos),
                new SqlParameter("@AdvertenciaBajoStock", producto.AdvertenciaBajoStock),
                new SqlParameter("@Activo", producto.EstadoActivo),
                new SqlParameter("@dv", Servicios.EncriptadoAdmin.CalcularDVH(producto))
            };

                await _db.WriteStoredProcedure("PRODUCTO_UPDATE", parameters);
                await ActualizarDVV();
                var tipoCambio = new BE.Palabra
                {
                    NombrePalabra = "updation"
                };
                await CreateSnapshot(producto, tipoCambio);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task CreateSnapshot(IProducto producto, Abstracciones.Entities.Traductor.IPalabra tipoCambio)
        {
            try
            {
                SqlParameter[] parametersProductoCreateSnapshot =
                {
                    new SqlParameter("@idProducto" ,producto.ID),
                    new SqlParameter("@Nombre", producto.Nombre),
                    new SqlParameter("@PrecioUnitario", producto.PrecioUnitario),
                    new SqlParameter("@idCategoria", producto.Categoria.ID),
                    new SqlParameter("@AdvertenciaBajoStock", producto.AdvertenciaBajoStock),
                    new SqlParameter("@DNIEmpleadoCambio", Servicios.SesionAdmin.GetInstance.Empleado.DNI),
                    new SqlParameter("@TipoCambio", tipoCambio.NombrePalabra),
                    new SqlParameter("@FechaCambio", DateTime.Now)
                };
                await _db.WriteStoredProcedure("PRODUCTO_CREATE_CHANGE", parametersProductoCreateSnapshot);
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

                var resultadoVerificacion = Servicios.EncriptadoAdmin.VerificarDVV(
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
            return (await GetAll()).Where(producto => producto.CantidadDepositos > 0).ToList();
        }

        public async Task<IList<IProducto>> GetAllInShelves()
        {
            return (await GetAll()).Where(producto => producto.CantidadExhibidores > 0).ToList();
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
                    ICategoria categoria = new BE.Categoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        Nombre = registro["Categoria_Nombre"].ToString()
                    };

                    var producto = new BE.Producto(categoria)
                    {
                        ID = int.Parse(registro["idProducto"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        PrecioUnitario = double.Parse(registro["PrecioUnitario"].ToString()),
                        CantidadDepositos = int.Parse(registro["CantidadDepositos"].ToString()),
                        CantidadExhibidores = int.Parse(registro["CantidadExhibidores"].ToString()),
                        AdvertenciaBajoStock = int.Parse(registro["AdvertenciaBajoStock"].ToString()),
                        EstadoActivo = (bool)registro["Activo"],
                        DVH = (byte[])registro["dv"]
                    };

                    if (!Servicios.EncriptadoAdmin.VerificarDVH(producto))
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
                await _dvv.Update(new BE.DVV("productos", Servicios.EncriptadoAdmin.CalcularDVV(objetos)));
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("dvh", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        
        public async Task<IList<ICambioProducto>> GetAllChanges(IProducto producto)
        {
            var categorias = _categoriaDAL.GetAll();
            await Task.WhenAll(
                    categorias
                );
            var category = getCategoryById((List<ICategoria>)await categorias, producto);
            try
            {
                IList<ICambioProducto> cambios = new List<ICambioProducto>();
                SqlParameter[] parameters = {
                    new SqlParameter("@idProducto", producto.ID)
                };
                var tabla = await _db.ReadStoredProcedure("PRODUCTO_GET_ALL_CHANGES", parameters);

                foreach (DataRow registro in tabla.Rows)
                {
                    var Producto = new BE.Producto(category)
                    {
                        ID = int.Parse(registro["idProducto"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        PrecioUnitario = double.Parse(registro["PrecioUnitario"].ToString()),
                        AdvertenciaBajoStock = int.Parse(registro["AdvertenciaBajoStock"].ToString()),
                        Categoria = category
                    };

                    var RolEmpleadoCambio = new BE.Rol
                    {
                        ID = int.Parse(registro["Empleado_Cambio_Rol_idRol"].ToString()),
                        Nombre = registro["Empleado_Cambio_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["Empleado_Cambio_Rol_AdministradorDelSistema"].ToString())
                    };

                    var EmpleadoCambio = new BE.Empleado(RolEmpleadoCambio)
                    {
                        DNI = int.Parse(registro["Empleado_Cambio_DNI"].ToString()),
                        Nombre = registro["Empleado_Cambio_Nombre"].ToString(),
                        Apellido = registro["Empleado_Cambio_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Empleado_Cambio_FechaNacimiento"].ToString()),
                        Email = registro["Empleado_Cambio_Email"].ToString()
                    };

                    var historialCambios = new BE.CambioProducto
                    {
                        ID = int.Parse(registro["idProducto"].ToString()),
                        EstadoProducto = Producto,
                        EmpleadoCambio = EmpleadoCambio,
                        TipoCambio = new BE.Palabra
                        {
                            NombrePalabra = registro["TipoCambio"].ToString()
                        },
                        FechaCambio = DateTime.Parse(registro["FechaCambio"].ToString())
                    };
                    cambios.Add(historialCambios);
                }
                return cambios;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "product", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }


        private BE.Categoria getCategoryById(IList<ICategoria> listaCategorias, IProducto producto)
        {
            foreach(BE.Categoria category in listaCategorias)
            {
                if(category.ID == producto.Categoria.ID)
                {
                    return category;
                }
            }
            return new BE.Categoria();
        }
    }
}
