using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IFamilia
    {
        Task<Entities.IFamilia> getAll(string nombreFamiliaMadre);
        Task CrearFamilia(Entities.IFamilia familia);
        Task EliminarFamilia(Entities.IFamilia familia);
        Task AsignarPermisoAFamilia(Entities.IPermiso permiso, Entities.IFamilia familia);

        Task RemoverPermisoDeFamilia(Entities.IPermiso permiso, Entities.IFamilia familia);

        Task AsignarFamiliaARol(Entities.IRol rol, Entities.IFamilia familia);

        Task RemoverFamiliaDeRol(Entities.IRol rol, Entities.IFamilia familia);

        Task AsignarFamiliaAFamilia(Entities.IFamilia familiaMadre, Entities.IFamilia familiaHija);

        Task RemoverFamiliaDeFamilia(Entities.IFamilia familiaMadre, Entities.IFamilia familiaHija);
    }
}
