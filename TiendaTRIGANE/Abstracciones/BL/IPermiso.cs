using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IPermiso
    {

        Task<Entities.IPermiso> GetAllByRole(Entities.IRol rol);

        Task<Entities.IPermiso> GetAll(string NombrePermisoPadre);

        Task AsignarPermiso(Entities.IRol rol, Entities.IPermiso permiso);

        Task RemoverPermiso(Entities.IRol rol, Entities.IPermiso permiso);

    }
}
