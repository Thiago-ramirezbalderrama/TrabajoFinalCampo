using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface ICategoria : ICreatable<Entities.ICategoria>,
        IUpdateable<Entities.ICategoria>,
        IReadable<Entities.ICategoria>,
        IDeletable<Entities.ICategoria>
    {
        Task<IList<Entities.ICambioCategoria>> GetAllChanges(Entities.ICategoria categoria);
    }
}
