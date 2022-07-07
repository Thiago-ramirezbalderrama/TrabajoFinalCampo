using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Empleado : Abstracciones.BL.IEmpleado
    {

        private readonly Abstracciones.DAL.IEmpleado _empleadoData;
        private readonly Abstracciones.BL.IPermiso _permisoBl;

        public Empleado(Abstracciones.DAL.IEmpleado empleadoData = null,
            Abstracciones.BL.IPermiso permisoBl = null)
        {
            _permisoBl = permisoBl ?? new Permiso();
            _empleadoData = empleadoData ?? new DAL.EmpleadoDAL();
        }


        public async Task Create(Abstracciones.Entities.IEmpleado empleado, string clave)
        {
            //Permite crear un empleado en el caso de que no se haya iniciado sesion, es decir, en la pantalla del primer empleado
            //(FrmPrimerEmpleado.cs)
            if (Servicios.SesionAdmin.GetInstance != null)
            {
                Servicios.PermisosAdmin.CheckPermission("employeesCREATE");
                if (empleado.Rol.AdministradorSistema && !Servicios.SesionAdmin.GetInstance.Empleado.Rol.AdministradorSistema)
                {
                    throw new Servicios.Excepciones.OnlySysAdminsCanManageSysAdmins();
                }
            }

            var pwd = Servicios.EncriptadoAdmin.CreateNewHash(Encoding.UTF8.GetBytes(clave));
            empleado.Password = pwd[0];
            empleado.Password_Salt = pwd[1];
            await _empleadoData.Create(empleado);
            //await _bitacora.LogInformation("successful_addition", "employee", empleado.Presentacion);
        }



        public async Task Delete(Abstracciones.Entities.IEmpleado empleado)
        {
            Servicios.PermisosAdmin.CheckPermission("employeesDELETE");
            if (empleado.Rol.AdministradorSistema && !Servicios.SesionAdmin.GetInstance.Empleado.Rol.AdministradorSistema)
            {
                throw new Servicios.Excepciones.OnlySysAdminsCanManageSysAdmins();
            }
            await _empleadoData.Delete(empleado);
        }

        public async Task Update(Abstracciones.Entities.IEmpleado empleado1, Abstracciones.Entities.IEmpleado empleado2)
        {
            Servicios.PermisosAdmin.CheckPermission("employeesUPDATE");
            if (empleado1.Rol.AdministradorSistema != empleado2.Rol.AdministradorSistema && !Servicios.SesionAdmin.GetInstance.Empleado.Rol.AdministradorSistema)
            {
                throw new Servicios.Excepciones.OnlySysAdminsCanManageSysAdmins();
            }
            var cantAdmins = 0;
            var empleados = await GetAll();
            foreach (var emp in empleados)
            {
                if (emp.Rol.AdministradorSistema)
                {
                    cantAdmins++;
                }
            }
            if (empleado1.Rol.AdministradorSistema && !empleado2.Rol.AdministradorSistema && cantAdmins == 1)
            {
                throw new Servicios.Excepciones.OnlySysAdminsCanManageSysAdmins();
            }
            await _empleadoData.Update(empleado2);
        }

        public async Task CambiarIdiomaPreferido(Abstracciones.Entities.IEmpleado empleado)
        {
            await _empleadoData.Update(empleado);
        }

        public async Task<IList<Abstracciones.Entities.IEmpleado>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("employeesREAD");
            return await _empleadoData.GetAll();
        }

        public async Task CambiarClave(string claveActual, string claveNueva)
        {
            var empleado = Servicios.SesionAdmin.GetInstance.Empleado;
            var currentPasswordMatches = Servicios.EncriptadoAdmin.CompareHashes(Encoding.UTF8.GetBytes(claveActual), empleado.Password_Salt, empleado.Password);

            if (!currentPasswordMatches) throw new Servicios.Excepciones.CurrentPasswordNotCorrectException();

            var newpwd = Servicios.EncriptadoAdmin.CreateNewHash(Encoding.UTF8.GetBytes(claveNueva));
            Servicios.SesionAdmin.GetInstance.Empleado.Password = newpwd[0];
            Servicios.SesionAdmin.GetInstance.Empleado.Password_Salt = newpwd[1];
            await _empleadoData.CambiarClave(Servicios.SesionAdmin.GetInstance.Empleado);
        }

        public async Task IniciarSesion(int dni, string clave)
        {
            var empleado = await _empleadoData.GetWithLoginInfo(dni);
            if (empleado == null)
            {
                throw new Servicios.Excepciones.IncorrectLoginException();
            }

            var pwdsMatch = Servicios.EncriptadoAdmin.CompareHashes(Encoding.UTF8.GetBytes(clave), empleado.Password_Salt, empleado.Password);
            if (!pwdsMatch)
            {
                throw new Servicios.Excepciones.IncorrectLoginException();
            }

            Servicios.SesionAdmin.IniciarSesion(empleado);
            await ActualizarPermisosUsuario();
        }

        public async Task ActualizarPermisosUsuario()
        {
            Servicios.PermisosAdmin.Permisos = await _permisoBl.GetAllByRole(Servicios.SesionAdmin.GetInstance.Empleado.Rol);
        }

        public async Task<int> GetCount()
        {
            return await _empleadoData.GetCount();
        }

    }
}
