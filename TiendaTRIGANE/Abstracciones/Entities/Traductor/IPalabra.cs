using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities.Traductor
{
    public interface IPalabra : IEquatable<IPalabra>
    {
        string NombrePalabra { get; set; }
    }
}
