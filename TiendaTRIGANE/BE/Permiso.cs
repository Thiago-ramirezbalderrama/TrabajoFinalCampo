using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BE
{
    public abstract class Permiso : IPermiso
    {

        public abstract string NombrePermiso { get; set; }
        public abstract bool esCompuesto { get; }
        public abstract IList<IPermiso> Hijos { get; }

        public abstract Abstracciones.Entities.Traductor.IPalabra Descripcion { get; set; }

        public abstract void AgregarHijo(IPermiso permiso);

        public bool Equals(IPermiso permiso)
        {
            if (permiso == null) return false;

            return NombrePermiso == permiso.NombrePermiso &&
                esCompuesto == permiso.esCompuesto &&
                Hijos == permiso.Hijos &&
                Descripcion == permiso.Descripcion;
        }
    }
}
