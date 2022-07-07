using System.Collections.Generic;
using Abstracciones.Entities;

namespace BE
{
    public class PermisoUnico : Permiso
    {

        public PermisoUnico(Abstracciones.Entities.Traductor.IPalabra descripcion)
        {
            Descripcion = descripcion;
        }

        public override string NombrePermiso { get; set; }
        public override bool esCompuesto { get { return false; } }
        public override IList<IPermiso> Hijos { get { return null; } }

        public override Abstracciones.Entities.Traductor.IPalabra Descripcion { get; set; }

        public override void AgregarHijo(IPermiso permiso)
        {
        }

    }
}
