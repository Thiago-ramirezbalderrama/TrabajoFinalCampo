using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DAL
{
    public class Proveedor : Abstracciones.DAL.IProveedor
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;
        private readonly Abstracciones.DAL.IBitacoraDAL _bitacora;

        public Proveedor(Abstracciones.DAL.IAccesoDB db = null, Abstracciones.DAL.IBitacoraDAL bitacora = null)
        {
            _db = db ?? new ConexionDAL();
            _bitacora = bitacora ?? new BitacoraDAL();
        }

        public async Task Create(Abstracciones.Entities.IProveedor proveedor)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@Nombre", proveedor.Nombre),
                    new SqlParameter("@Apellido", proveedor.Apellido),
                    new SqlParameter("@idCategoria",proveedor.Categoria.ID),
                    new SqlParameter("@DNI", proveedor.DNI),
                    new SqlParameter("@FechaNacimiento", proveedor.FechaNacimiento),
                    new SqlParameter("@Email", proveedor.Email)
                };
                await _db.WriteStoredProcedure("PROVEEDOR_CREATE", parameters);
            }
            catch (SqlException ex) when (ex.Errors.Count > 0 && ex.Errors[0].Number == 2627)
            {
                throw new Servicios.Excepciones.ItemAlreadyExistsException();
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "supplier", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Delete(Abstracciones.Entities.IProveedor proveedor)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@DNI_Proveedor", proveedor.DNI) };
                await _db.WriteStoredProcedure("PROVEEDOR_DELETE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "supplier", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(Abstracciones.Entities.IProveedor proveedor)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@Nombre", proveedor.Nombre),
                    new SqlParameter("@Apellido", proveedor.Apellido),
                    new SqlParameter("@idCategoria", proveedor.Categoria.ID),
                    new SqlParameter("@DNI", proveedor.DNI),
                    new SqlParameter("@Email", proveedor.Email),
                    new SqlParameter("@FechaNacimiento", proveedor.FechaNacimiento)
                };

                await _db.WriteStoredProcedure("PROVEEDOR_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "supplier", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.IProveedor>> GetAll()
        {
            try
            {
                IList<Abstracciones.Entities.IProveedor> proveedores = new List<Abstracciones.Entities.IProveedor>();
                var tabla = await _db.ReadStoredProcedure("PROVEEDOR_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var categoria = new BE.Categoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        Nombre = registro["Categoria_Nombre"].ToString()
                    };
                    var proveedor = new BE.Proveedor(categoria)
                    {
                        DNI = int.Parse(registro["DNI"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        Apellido = registro["Apellido"].ToString(),
                        Email = registro["Email"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["FechaNacimiento"].ToString())
                    };
                    proveedores.Add(proveedor);
                }

                return proveedores;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "supplier", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.IProveedor>> GetAll(Abstracciones.Entities.ICategoria categoria)
        {
            try
            {
                IList<Abstracciones.Entities.IProveedor> proveedores = new List<Abstracciones.Entities.IProveedor>();
                SqlParameter[] parameters = {
                 new SqlParameter("@idCategoria", categoria.ID)
                };
                var tabla = await _db.ReadStoredProcedure("PROVEEDOR_GET_ALL_BYCATEGORY", parameters);

                foreach (DataRow registro in tabla.Rows)
                {
                    var proveedor = new BE.Proveedor(categoria)
                    {
                        DNI = int.Parse(registro["DNI"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        Apellido = registro["Apellido"].ToString(),
                        Email = registro["Email"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["FechaNacimiento"].ToString())
                    };
                    proveedores.Add(proveedor);
                }
                return proveedores;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "supplier", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
