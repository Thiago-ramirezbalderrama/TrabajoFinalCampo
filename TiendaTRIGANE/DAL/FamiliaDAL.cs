using System.Threading.Tasks;
using System.Data.SqlClient;
using Abstracciones.Entities;
using System.Collections.Generic;
using System.Data;

namespace DAL
{
    public class FamiliaDAL : Abstracciones.DAL.IFamilia
    {

        private readonly Abstracciones.DAL.IAccesoDB _db;

        public FamiliaDAL(Abstracciones.DAL.IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        public async Task CrearFamilia(IFamilia familia)
        {
            try
            {
                SqlParameter[] parameters =
                {
                    new SqlParameter("@nombre", familia.NombreFamilia)
                };
                await _db.WriteStoredProcedure("FAMILIA_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task EliminarFamilia(IFamilia familia)
        {
            try
            {
                SqlParameter[] parameters =
                {
                    new SqlParameter("@idFamilia", familia.ID),
                    new SqlParameter("@nombre", familia.NombreFamilia)
                };
                await _db.WriteStoredProcedure("FAMILIA_DELETE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task AsignarFamiliaARol(IRol rol, IFamilia familia)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID),
                    new SqlParameter("@idFamilia", familia.ID)
                };
                await _db.WriteStoredProcedure("FAMILIA_ASIGNAR_A_ROL", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task RemoverFamiliaDeRol(IRol rol, IFamilia familia)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID),
                    new SqlParameter("@idFamilia", familia.ID)
                };
                await _db.WriteStoredProcedure("FAMILIA_REMOVER_DE_ROL", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task AsignarPermisoAFamilia(IPermiso permiso, IFamilia familia)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@NombrePermiso", permiso.NombrePermiso),
                    new SqlParameter("@idFamilia", familia.ID)
                };
                await _db.WriteStoredProcedure("PERMISO_ASIGNAR_A_FAMILIA", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task RemoverPermisoDeFamilia(IPermiso permiso, IFamilia familia)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@NombrePermiso", permiso.NombrePermiso),
                    new SqlParameter("@idFamilia", familia.ID)
                };
                await _db.WriteStoredProcedure("PERMISO_REMOVER_DE_FAMILIA", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task AsignarFamiliaAFamilia(IFamilia familiaMadre, IFamilia familiaHija)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idFamiliaMadre", familiaMadre.ID),
                    new SqlParameter("@idFamiliaHija", familiaHija.ID)
                };
                await _db.WriteStoredProcedure("FAMILIA_ASIGNAR_A_FAMILIA", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task RemoverFamiliaDeFamilia(IFamilia familiaMadre, IFamilia familiaHija)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idFamiliaMadre", familiaMadre.ID),
                    new SqlParameter("@idFamiliaHija", familiaHija.ID)
                };
                await _db.WriteStoredProcedure("FAMILIA_REMOVER_DE_FAMILIA", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<Abstracciones.Entities.IFamilia> Get(string nombreFamilia)
        {
            try
            {
                var familias = new List<BE.Familia>();
                DataTable tabla;

                if (nombreFamilia != null)
                {
                    SqlParameter[] parameters = { new SqlParameter("@NombreFamilia", nombreFamilia) };
                    tabla = await _db.ReadStoredProcedure("FAMILIA_GET", parameters);
                }
                else
                {
                    tabla = await _db.ReadStoredProcedure("FAMILIA_GET", null);
                }

                foreach (DataRow registro in tabla.Rows)
                {
                    var descripcion = new BE.Palabra
                    {
                        NombrePalabra = registro["NombrePalabra"].ToString()
                    };
                    BE.Familia familia = new BE.Familia()
                    {
                        NombreFamilia = registro["NombreFamilia"].ToString()
                    };
                    familias.Add(familia);
                }
                if (familias.Count > 0)
                {
                    return familias[0];
                }

                return null;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<Abstracciones.Entities.IFamilia> getAll(string nombreFamiliaMadre)
        {
            try
            {
                var familiaBase = await Get(nombreFamiliaMadre);
                DataTable tabla;
                if (nombreFamiliaMadre != null)
                {
                    SqlParameter[] parameters = { new SqlParameter("@NombreFamiliaMadre", nombreFamiliaMadre) };
                    tabla = await _db.ReadStoredProcedure("FAMILIA_GET_HIJOS", parameters);
                }
                else
                {
                    tabla = await _db.ReadStoredProcedure("FAMILIA_GET_HIJOS", null);
                }

                foreach (DataRow registro in tabla.Rows)
                {
                    var familia = await Get(registro["NombreFamiliaHija"].ToString());
                    if (familia == null) continue;

                    if (await esFamiliaCompuesta(familia.ID))
                    {
                        var p = await getAll(familia.NombreFamilia);
                        familiaBase.AgregarFamiliaHija(p);
                    }
                    else
                    {
                        familiaBase.AgregarFamiliaHija(familia);
                    }
                }
                return familiaBase;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<bool> esFamiliaCompuesta(int idFamilia)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idFamilia", idFamilia),
                };
                DataTable tabla = await _db.ReadStoredProcedure("FAMILIA_VERIFICAR_HIJO", parameters);
                foreach (DataRow registro in tabla.Rows)
                {
                    if (registro["esFamilia"].ToString() == "1")
                    {
                        return true;
                    }
                    return false;
                }
                return false;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }


        /*public async Task<IList<IFamilia>> getFamiliaPermisos()
        {
            try
            {
                var roles = GetAllRoles();
                IList<IFamilia> familias = new List<IFamilia>();
                SqlParameter[] parameters = {
                };
                DataTable tabla = await _db.ReadStoredProcedure("GET_ALL_FAMILY_SONS", parameters);
                foreach (DataRow row in tabla.Rows)
                {
                    if (roles.Result.Contains((IRol)row["NOMBRE"]))
                    {
                        
                        familia.NombreFamilia = row["NOMBRE"].ToString();
                        familia.AgregarPermiso((IPermiso)row["NombrePermiso"]);
                    }
                    else
                    {
                        
                    }
                    nombre = row["NOMBRE"].ToString();
                    
                    familia.NombreFamilia = nombre;
                    if(row["NOMBRE"].ToString() != nombre)
                    {
                        var familiaNueva = new BE.Familia();
                        familiaNueva.NombreFamilia = nombre;
                        familiaNueva.AgregarPermiso((IPermiso)row["NombrePermiso"]);

                    }
                    else
                    {
                        familia.AgregarPermiso((IPermiso)row["NombrePermiso"]);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }


        private async Task<IList<IRol>> GetAllRoles()
        {
            try
            {
                IList<IRol> roles = new List<IRol>();
                var tabla = await _db.ReadStoredProcedure("ROL_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var rol = new BE.Rol
                    {
                        ID = int.Parse(registro["idRol"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["AdministradorDelSistema"].ToString())
                    };
                    roles.Add(rol);
                }
                return roles;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }


        private async Task<IList<IFamilia>> GetAllFamilias()   // me traigo todas las familias que existen
        {
            try
            {
                IList<IFamilia> familias = new List<IFamilia>();
                var tabla = await _db.ReadStoredProcedure("FAMILIA_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var familia = new BE.Familia
                    {
                        NombreFamilia = registro["NOMBRE"].ToString()
                    };
                    familias.Add(familia);
                }
                return familias;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }*/


    }
}
