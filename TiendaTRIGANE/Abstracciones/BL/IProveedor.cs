using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IProveedor : ICreatable<Entities.IProveedor>,
        IReadable<Entities.IProveedor>,
        IUpdateable<Entities.IProveedor>,
        IDeletable<Entities.IProveedor>
    {
        Task<IList<Entities.IProveedor>> GetAll(Entities.ICategoria categoria);
    }
}
