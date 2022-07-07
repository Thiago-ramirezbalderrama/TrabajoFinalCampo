using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Permiso : Abstracciones.BL.IPermiso
    {

        private readonly Abstracciones.DAL.IPermiso _permisoData;

        public Permiso(Abstracciones.DAL.IPermiso permisoData = null)
        {
            _permisoData = permisoData ?? new DAL.Permiso();
        }

        public async Task<Abstracciones.Entities.IPermiso> GetAllByRole(Abstracciones.Entities.IRol rol)
        {
            return await _permisoData.GetAllByRole(rol, "base");
        }

        public async Task<Abstracciones.Entities.IPermiso> GetAll(string nombrePermisoPadre)
        {
            Servicios.PermisosAdmin.CheckPermission("permissions");
            return await _permisoData.GetAll(nombrePermisoPadre);
        }

        public async Task AsignarPermiso(Abstracciones.Entities.IRol rol, Abstracciones.Entities.IPermiso permiso)
        {
            Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _permisoData.AsignarPermiso(rol, permiso);
            //await _bitacora.LogInformation("assign_permission", "permission", $"\"{rol.Nombre}\": {permiso.Descripcion.NombrePalabra}");
        }

        public async Task RemoverPermiso(Abstracciones.Entities.IRol rol, Abstracciones.Entities.IPermiso permiso)
        {
            Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _permisoData.RemoverPermiso(rol, permiso);
            //await _bitacora.LogInformation("remove_permission", "permission", $"\"{rol.Nombre}\": {permiso.Descripcion.NombrePalabra}");
        }

    }
}
