using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IProveedor : ICreatable<Entities.IProveedor>,
        IUpdateable<Entities.IProveedor>,
        IReadable<Entities.IProveedor>,
        IDeletable<Entities.IProveedor>
    {
        Task<IList<Entities.IProveedor>> GetAll(Entities.ICategoria categoria);
    }
}
