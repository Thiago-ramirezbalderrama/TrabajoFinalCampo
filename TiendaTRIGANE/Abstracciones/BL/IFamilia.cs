using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IFamilia
    {
        Task AsignarFamiliaARol(Entities.IRol rol, Entities.IFamilia familia);
        Task RemoverFamiliaDeRol(Entities.IRol rol, Entities.IFamilia familia);
        Task AsignarPermisoAFamilia(Entities.IPermiso permiso, Entities.IFamilia familia);
        Task RemoverPermisoDeFamilia(Entities.IPermiso permiso, Entities.IFamilia familia);
        Task AsignarFamiliaAFamilia(Entities.IFamilia familiaMadre, Entities.IFamilia familiaHija);
        Task RemoverFamiliaDeFamilia(Entities.IFamilia familiaMadre, Entities.IFamilia familiaHija);

    }
}
