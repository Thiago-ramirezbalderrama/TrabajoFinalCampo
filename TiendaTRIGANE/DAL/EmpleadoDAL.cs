using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Abstracciones.DAL;

namespace DAL
{
    public class EmpleadoDAL : IEmpleado
    {

        private readonly IAccesoDB _db;

        public EmpleadoDAL(IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }


        public async Task Create(Abstracciones.Entities.IEmpleado empleado)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@Nombre", empleado.Nombre),
                    new SqlParameter("@Apellido", empleado.Apellido),
                    new SqlParameter("@DNI", empleado.DNI),
                    new SqlParameter("@FechaNacimiento", empleado.FechaNacimiento),
                    new SqlParameter("@Email", empleado.Email),
                    new SqlParameter("@idRol", empleado.Rol.ID),
                    new SqlParameter("@password", empleado.Password),
                    new SqlParameter("@salt", empleado.Password_Salt) };
                await _db.WriteStoredProcedure("EMPLEADO_CREATE", parameters);
            }
            catch (SqlException ex) when (ex.Errors.Count > 0 && ex.Errors[0].Number == 2627)
            {
                throw new Servicios.Excepciones.ItemAlreadyExistsException();
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }



        public async Task Delete(Abstracciones.Entities.IEmpleado empleado)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@DNI", empleado.DNI) };
                await _db.WriteStoredProcedure("EMPLEADO_DELETE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }




        public async Task Update(Abstracciones.Entities.IEmpleado empleado)
        {
            try
            {
                SqlParameter[] parameters = {
                new SqlParameter("@Nombre", empleado.Nombre),
                new SqlParameter("@Apellido", empleado.Apellido),
                new SqlParameter("@DNI", empleado.DNI),
                new SqlParameter("@FechaNacimiento", empleado.FechaNacimiento),
                new SqlParameter("@Email", empleado.Email),
                new SqlParameter("@idRol", empleado.Rol.ID),
                new SqlParameter("@idIdioma", empleado.Idioma?.ID)
            };

                await _db.WriteStoredProcedure("EMPLEADO_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }




        public async Task<IList<Abstracciones.Entities.IEmpleado>> GetAll()
        {
            try
            {
                IList<Abstracciones.Entities.IEmpleado> empleados = new List<Abstracciones.Entities.IEmpleado>();
                var tabla = await _db.ReadStoredProcedure("EMPLEADO_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var rol = new BE.Rol
                    {
                        ID = int.Parse(registro["idRol"].ToString()),
                        Nombre = registro["Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["Rol_AdministradorDelSistema"].ToString())
                    };
                    var empleado = new BE.Empleado(rol)
                    {
                        DNI = int.Parse(registro["DNI"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        Apellido = registro["Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["FechaNacimiento"].ToString()),
                        Email = registro["Email"].ToString() 
                    };
                    if (!registro.IsNull("idIdioma"))
                    {
                        empleado.Idioma = new BE.Idioma
                        {
                            ID = int.Parse(registro["idIdioma"].ToString()),
                            Nombre = registro["Idioma_Nombre"].ToString(),
                            MostrarPorDefecto = bool.Parse(registro["Idioma_Default"].ToString()),
                            Habilitado = bool.Parse(registro["Idioma_Habilitado"].ToString())
                        };
                    }
                    empleados.Add(empleado);
                }

                return empleados;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<Abstracciones.Entities.IEmpleado> GetWithLoginInfo(int DNI)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@DNI", DNI)
                };
                var tabla = await _db.ReadStoredProcedure("EMPLEADO_GET_WITHLOGININFO", parameters);

                DataRow registro;
                if (0 < tabla.Rows.Count) registro = tabla.Rows[0];
                else return null;

                Abstracciones.Entities.IRol rol = new BE.Rol
                {
                    ID = int.Parse(registro["idRol"].ToString()),
                    Nombre = registro["Rol_Nombre"].ToString(),
                    AdministradorSistema = bool.Parse(registro["Rol_AdministradorDelSistema"].ToString())
                };
                Abstracciones.Entities.IEmpleado empleado = new BE.Empleado(rol)
                {
                    DNI = int.Parse(registro["DNI"].ToString()),
                    Nombre = registro["Nombre"].ToString(),
                    Apellido = registro["Apellido"].ToString(),
                    FechaNacimiento = DateTime.Parse(registro["FechaNacimiento"].ToString()),
                    Email = registro["Email"].ToString(),
                    Password = (byte[])registro["password"],
                    Password_Salt = (byte[])registro["salt"]
                };
                if (!registro.IsNull("idIdioma"))
                {
                    empleado.Idioma = new BE.Idioma
                    {
                        ID = int.Parse(registro["idIdioma"].ToString()),
                        Nombre = registro["Idioma_Nombre"].ToString(),
                        MostrarPorDefecto = bool.Parse(registro["Idioma_Default"].ToString()),
                        Habilitado = bool.Parse(registro["Idioma_Habilitado"].ToString())
                    };
                }

                return empleado;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task CambiarClave(Abstracciones.Entities.IEmpleado empleado)
        {
            try
            {
                SqlParameter[] parameters = {
                new SqlParameter("@DNI", empleado.DNI),
                new SqlParameter("@NewPwd", empleado.Password),
                new SqlParameter("@salt", empleado.Password_Salt)
            };
                await _db.WriteStoredProcedure("EMPLEADO_RESET_PWD", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<int> GetCount()
        {
            try
            {
                return int.Parse((await _db.ReadScalarValue("EMPLEADO_GET_COUNT", null)).ToString());
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }


        public async Task<int> GetCountGerentes()
        {
            try
            {
                return int.Parse((await _db.ReadScalarValue("EMPLEADO_GERENTE_GET_COUNT", null)).ToString());
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }



    }
}
