using System.Threading.Tasks;

namespace BLL
{
    public class Familia : Abstracciones.BL.IFamilia
    {

        private readonly Abstracciones.DAL.IFamilia _familiaData;

        public Familia(Abstracciones.DAL.IFamilia familiaData = null)
        {
            _familiaData = familiaData ?? new DAL.FamiliaDAL();
        }

        public async Task<Abstracciones.Entities.IFamilia> getAll(string nombreFamiliaMadre)
        {
            //Servicios.PermisosAdmin.CheckPermission("");
            return await _familiaData.getAll(nombreFamiliaMadre);
        }

        public async Task CrearFamilia(Abstracciones.Entities.IFamilia familia)
        {
            //Servicios.PermisosAdmin.CheckPermission("");
            await _familiaData.CrearFamilia(familia);
        }

        public async Task EliminarFamilia(Abstracciones.Entities.IFamilia familia)
        {
            //Servicios.PermisosAdmin.CheckPermission("");
            await _familiaData.EliminarFamilia(familia);
        }


        public async Task AsignarFamiliaARol(Abstracciones.Entities.IRol rol, Abstracciones.Entities.IFamilia familia)
        {
            //Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _familiaData.AsignarFamiliaARol(rol, familia);
        }

        public async Task RemoverFamiliaDeRol(Abstracciones.Entities.IRol rol, Abstracciones.Entities.IFamilia familia)
        {
            //Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _familiaData.RemoverFamiliaDeRol(rol, familia);
        }

        public async Task AsignarPermisoAFamilia(Abstracciones.Entities.IPermiso permiso, Abstracciones.Entities.IFamilia familia)
        {
            //Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _familiaData.AsignarPermisoAFamilia(permiso, familia);
        }


        public async Task RemoverPermisoDeFamilia(Abstracciones.Entities.IPermiso permiso, Abstracciones.Entities.IFamilia familia)
        {
            //Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _familiaData.RemoverPermisoDeFamilia(permiso, familia);
        }


        public async Task AsignarFamiliaAFamilia(Abstracciones.Entities.IFamilia familiaMadre, Abstracciones.Entities.IFamilia familiaHija)
        {
            //Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _familiaData.AsignarFamiliaAFamilia(familiaMadre, familiaHija);
        }


        public async Task RemoverFamiliaDeFamilia(Abstracciones.Entities.IFamilia familiaMadre, Abstracciones.Entities.IFamilia familiaHija)
        {
            //Servicios.PermisosAdmin.CheckPermission("permissionsCHANGE");
            await _familiaData.RemoverFamiliaDeFamilia(familiaMadre, familiaHija);
        }

    }
}
