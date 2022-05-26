using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface IPermiso : IEquatable<IPermiso>
    {
        string NombrePermiso { get; set; }
        bool esCompuesto { get; }
        IList<IPermiso> Hijos { get; }

        Traductor.IPalabra Descripcion { get; set; }

        void AgregarHijo(IPermiso permiso);
    }
}
