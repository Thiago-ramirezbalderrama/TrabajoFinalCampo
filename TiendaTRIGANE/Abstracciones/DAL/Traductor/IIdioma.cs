using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.DAL.Traductor
{
    public interface IIdioma : ICreatable<Entities.Traductor.IIdioma>,
        IReadable<Entities.Traductor.IIdioma>,
        IUpdateable<Entities.Traductor.IIdioma>
    {
        Task<IList<Entities.Traductor.IIdioma>> GetAllHabilitados();

        Task<Entities.Traductor.IIdioma> GetDefault();
    }
}
