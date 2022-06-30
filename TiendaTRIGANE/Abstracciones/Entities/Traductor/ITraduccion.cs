using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities.Traductor
{
    public interface ITraduccion
    {
        IIdioma Idioma { get; set; }
        IPalabra Palabra { get; set; }
        string Texto { get; set; }
    }
}
