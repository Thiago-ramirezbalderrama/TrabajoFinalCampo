using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.BL.Traductor
{
    public interface IIdioma : ICreatable<Entities.Traductor.IIdioma>,
        IReadable<Entities.Traductor.IIdioma>
    {
        Task<IList<Entities.Traductor.IIdioma>> GetAllHabilitados();

        Task<Entities.Traductor.IIdioma> GetDefault();

        Task MostrarPorDefecto(Entities.Traductor.IIdioma idioma);

        Task UpdateHabilitado(Entities.Traductor.IIdioma idioma);
    }
}
