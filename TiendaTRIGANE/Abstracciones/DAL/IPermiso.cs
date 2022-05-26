using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IPermiso
    {
        Task<Entities.IPermiso> GetAll(string NombrePermisoPadre);

        Task<Entities.IPermiso> GetAllByRole(Entities.IRol rol, string NombrePermisoPadre);

        Task AsignarPermiso(Entities.IRol rol, Entities.IPermiso permiso);

        Task RemoverPermiso(Entities.IRol rol, Entities.IPermiso permiso);
    }
}
