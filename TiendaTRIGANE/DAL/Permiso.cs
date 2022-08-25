using System.Collections.Generic;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Permiso : Abstracciones.DAL.IPermiso
    {

        private readonly Abstracciones.DAL.IAccesoDB _db;
        private readonly Abstracciones.DAL.IBitacoraDAL _bitacora;

        public Permiso(Abstracciones.DAL.IAccesoDB db = null, Abstracciones.DAL.IBitacoraDAL bitacora = null)
        {
            _db = db ?? new ConexionDAL();
            _bitacora = bitacora ?? new BitacoraDAL();
        }



        private async Task<Abstracciones.Entities.IPermiso> GetByRole(int idRol, string NombrePermiso)
        {
            try
            {
                var permisos = new List<BE.Permiso>();
                DataTable tabla;

                if (NombrePermiso != null)
                {
                    SqlParameter[] parameters = {
                    new SqlParameter("@idRol", idRol),
                    new SqlParameter("@NombrePermiso", NombrePermiso)
                };
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET_BYROLE", parameters);
                }
                else
                {
                    SqlParameter[] parameters = { new SqlParameter("@idRol", idRol) };
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET_BYROLE", parameters);
                }

                foreach (DataRow registro in tabla.Rows)
                {
                    var descripcion = new BE.Palabra
                    {
                        NombrePalabra = registro["NombrePalabra"].ToString()
                    };
                    BE.Permiso permiso;
                    if (bool.Parse(registro["esCompuesto"].ToString()))
                    {
                        permiso = new BE.PermisoCompuesto(descripcion)
                        {
                            NombrePermiso = registro["NombrePermiso"].ToString()
                        };
                    }
                    else
                    {
                        permiso = new BE.PermisoUnico(descripcion)
                        {
                            NombrePermiso = registro["NombrePermiso"].ToString()
                        };
                    }
                    permisos.Add(permiso);
                }

                if (permisos.Count > 0)
                {
                    return permisos[0];
                }

                return null;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "permission", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<Abstracciones.Entities.IPermiso> Get(string NombrePermiso)
        {
            try
            {
                var permisos = new List<BE.Permiso>();
                DataTable tabla;

                if (NombrePermiso != null)
                {
                    SqlParameter[] parameters = { new SqlParameter("@NombrePermiso", NombrePermiso) };
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET", parameters);
                }
                else
                {
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET", null);
                }

                foreach (DataRow registro in tabla.Rows)
                {
                    if (bool.Parse(registro["esCompuesto"].ToString()))
                    {
                        var descripcion = new BE.Palabra
                        {
                            NombrePalabra = registro["NombrePalabra"].ToString()
                        };
                        BE.Permiso permiso = new BE.PermisoCompuesto(descripcion)
                        {
                            NombrePermiso = registro["NombrePermiso"].ToString()
                        };
                        permisos.Add(permiso);
                    }
                    else
                    {
                        var descripcion = new BE.Palabra
                        {
                            NombrePalabra = registro["NombrePalabra"].ToString()
                        };
                        BE.Permiso permiso = new BE.PermisoUnico(descripcion)
                        {
                            NombrePermiso = registro["NombrePermiso"].ToString()
                        };
                        permisos.Add(permiso);
                    }
                }
                if (permisos.Count > 0)
                {
                    return permisos[0];
                }

                return null;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "permission", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<Abstracciones.Entities.IPermiso> GetAll(string NombrePermisoPadre)
        {
            try
            {
                var permisoBase = await Get(NombrePermisoPadre);
                DataTable tabla;
                if (NombrePermisoPadre != null)
                {
                    SqlParameter[] parameters = { new SqlParameter("@NombrePermisoPadre", NombrePermisoPadre) };
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET_HIJOS", parameters);
                }
                else
                {
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET_HIJOS", null);
                }

                foreach (DataRow registro in tabla.Rows)
                {
                    var permiso = await Get(registro["NombrePermisoHijo"].ToString());
                    if (permiso == null) continue;

                    if (permiso.esCompuesto)
                    {
                        var p = await GetAll(permiso.NombrePermiso);
                        permisoBase.AgregarHijo(p);
                    }
                    else
                    {
                        permisoBase.AgregarHijo(permiso);
                    }
                }

                return permisoBase;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "permission", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<Abstracciones.Entities.IPermiso> GetAllByRole(Abstracciones.Entities.IRol rol, string NombrePermisoPadre)
        {
            try
            {
                var permisoBase = await GetByRole(rol.ID, NombrePermisoPadre);
                DataTable tabla;

                if (NombrePermisoPadre != null)
                {
                    SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID),
                    new SqlParameter("@NombrePermisoPadre", NombrePermisoPadre)
                };
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET_HIJOS_BYROLE", parameters);
                }
                else
                {
                    SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID)
                };
                    tabla = await _db.ReadStoredProcedure("PERMISO_GET_HIJOS_BYROLE", parameters);
                }

                foreach (DataRow registro in tabla.Rows)
                {
                    var permiso = await GetByRole(rol.ID, registro["NombrePermisoHijo"].ToString());
                    if (permiso == null) continue;

                    if (permiso.esCompuesto)
                    {
                        var p = await GetAllByRole(rol, permiso.NombrePermiso);
                        permisoBase.AgregarHijo(p);
                    }
                    else
                    {
                        permisoBase.AgregarHijo(permiso);
                    }
                }

                return permisoBase;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "permission", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task AsignarPermiso(Abstracciones.Entities.IRol rol, Abstracciones.Entities.IPermiso permiso)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID),
                    new SqlParameter("NombrePermiso", permiso.NombrePermiso)
                };
                await _db.WriteStoredProcedure("PERMISO_ASIGNAR", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "permission", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task RemoverPermiso(Abstracciones.Entities.IRol rol, Abstracciones.Entities.IPermiso permiso)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID),
                    new SqlParameter("NombrePermiso", permiso.NombrePermiso)
                };
                await _db.WriteStoredProcedure("PERMISO_REMOVER", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "permission", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }


    }
}
