using Abstracciones.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Rol : Abstracciones.BL.IRol
    {
        private readonly Abstracciones.DAL.IRol _rolData;
        private readonly Abstracciones.DAL.IEmpleado _empleadosData;

        public Rol(Abstracciones.DAL.IRol rolData = null,
            Abstracciones.DAL.IEmpleado empleadosData = null)
        {
            _rolData = rolData ?? new DAL.RolDAL();
            _empleadosData = empleadosData ?? new DAL.EmpleadoDAL();
        }

        public async Task Create(Abstracciones.Entities.IRol rol)
        {
            Servicios.PermisosAdmin.CheckPermission("roleCREATE");
            rol.AdministradorSistema = false;
            await _rolData.Create(rol);
        }

        public async Task Delete(Abstracciones.Entities.IRol rol)
        {
            Servicios.PermisosAdmin.CheckPermission("roleDELETE");
            if (rol.AdministradorSistema)
            {
                throw new Servicios.Excepciones.CannotDeleteSysAdminRoleException();
            }

            foreach (var empleado in (await _empleadosData.GetAll()))
            {
                if (empleado.Rol.Equals(rol))
                {
                    throw new Excepciones.TheresStillEmployeesWithThisRoleException();
                }
            }

            await _rolData.Delete(rol);
        }

        public async Task Update(Abstracciones.Entities.IRol rol)
        {
            Servicios.PermisosAdmin.CheckPermission("roleUPDATE");
            rol.AdministradorSistema = false;
            await _rolData.Update(rol);
        }

        public async Task<IList<Abstracciones.Entities.IRol>> GetAll()
        {
            //Permite conseguir el rol administrativo (administrador del sistema) en el caso de que no se
            //haya iniciado sesion, es decir, en la pantalla del primer empleado (FrmPrimerEmpleado.cs)
            if (Servicios.SesionAdmin.GetInstance != null)
            {
                Servicios.PermisosAdmin.CheckPermission("roleREAD");
            }
            return await _rolData.GetAll();
        }
    }
}
