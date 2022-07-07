using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface ICategoria : ICreatable<Entities.ICategoria>,
        IReadable<Entities.ICategoria>,
        IUpdateable<Entities.ICategoria>,
        IDeletable<Entities.ICategoria>
    {
        Task UpdateDiscount(Entities.ICategoria categoria);
        Task<IList<Entities.ICambioCategoria>> GetAllChanges(Entities.ICategoria categoria);
    }
}
