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

        public Producto(Abstracciones.DAL.IAccesoDB db = null, Abstracciones.DAL.IDigitosVerificadoresVerticales dvv = null)
        {
            _db = db ?? new ConexionDAL();
            _dvv = dvv ?? new DigitosVerificadoresVerticales();
        }

        public async Task Create(IProducto producto)
        {
            try
            {
                var productos = await TraerRegistros();
                producto.ID = productos.Count > 0 ? productos.Last().ID + 1 : 1; //no es identidad para poder calcular el dvh correctamente
                producto.EstadoActivo = true;
                producto.DVH = Servicios.EncriptadoAdmin.CalcularDVH(producto);

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
            }
            catch (SqlException ex)
            {
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
                new SqlParameter("@CantidadExhibidores", producto.CantidadExhibidores),
                new SqlParameter("@CantidadDepositos", producto.CantidadDepositos),
                new SqlParameter("@AdvertenciaBajoStock", producto.AdvertenciaBajoStock),
                new SqlParameter("@Activo", producto.EstadoActivo),
                new SqlParameter("@dv", Servicios.EncriptadoAdmin.CalcularDVH(producto))
            };

                await _db.WriteStoredProcedure("PRODUCTO_UPDATE", parameters);
                await ActualizarDVV();
            }
            catch (SqlException ex)
            {
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

                /*if (!resultadoVerificacion)
                {
                    throw new Servicios.Excepciones.UnauthorizedInsertionOrDeletionException();
                }*/
                return productos.Where(producto => producto.EstadoActivo).ToList();
            }
            catch (SqlException ex)
            {
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
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
