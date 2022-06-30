using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.BL.Traductor
{
    public interface ITraduccion : IUpdateable<Entities.Traductor.ITraduccion>
    {
        Task<Dictionary<string, Entities.Traductor.ITraduccion>> GetAll(Entities.Traductor.IIdioma idioma);

        Task<IList<Entities.Traductor.ITraduccion>> GetAllFromLanguages();
    }
}
