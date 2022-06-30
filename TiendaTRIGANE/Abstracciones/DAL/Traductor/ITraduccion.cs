using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.DAL.Traductor
{
    public interface ITraduccion : IUpdateable<Entities.Traductor.ITraduccion>
    {
        Task<Dictionary<string, Entities.Traductor.ITraduccion>> GetAll(Entities.Traductor.IIdioma idioma);

        Task<IList<Entities.Traductor.ITraduccion>> GetAllFromAllLanguages();
    }
}
