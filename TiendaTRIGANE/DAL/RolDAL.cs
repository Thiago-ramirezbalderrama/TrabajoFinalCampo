using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class RolDAL : Abstracciones.DAL.IRol
    {

        private readonly Abstracciones.DAL.IAccesoDB _db;

        public RolDAL(Abstracciones.DAL.IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        public async Task Create(Abstracciones.Entities.IRol rol)
        {
            try
            {
                rol.EstadoActivo = true;
                SqlParameter[] parameters = {
                    new SqlParameter("@Nombre", rol.Nombre),
                    new SqlParameter("@AdministradorDelSistema", rol.AdministradorSistema),
                    new SqlParameter("@Activo", rol.EstadoActivo),
                };
                await _db.WriteStoredProcedure("ROL_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(Abstracciones.Entities.IRol rol)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idRol", rol.ID),
                    new SqlParameter("@Nombre", rol.Nombre),
                    new SqlParameter("@AdministradorDelSistema", rol.AdministradorSistema)
                };

                await _db.WriteStoredProcedure("ROL_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Delete(Abstracciones.Entities.IRol rol)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@idRol", rol.ID) };
                await _db.WriteStoredProcedure("ROL_DELETE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.IRol>> GetAll()
        {
            try
            {
                IList<Abstracciones.Entities.IRol> roles = new List<Abstracciones.Entities.IRol>();
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

    }
}
