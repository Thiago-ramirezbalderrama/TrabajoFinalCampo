using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BE
{
    public class PermisoCompuesto : Permiso
    {

        public PermisoCompuesto(Abstracciones.Entities.Traductor.IPalabra descripcion)
        {
            Descripcion = descripcion;
            _hijos = new List<IPermiso>();
        }

        private readonly List<IPermiso> _hijos;

        public override string NombrePermiso { get; set; }
        public override bool esCompuesto { get { return true; } }
        public override IList<IPermiso> Hijos { get { return _hijos; } }
        public override Abstracciones.Entities.Traductor.IPalabra Descripcion { get; set; }

        public override void AgregarHijo(IPermiso permiso)
        {
            _hijos.Add(permiso);
        }

    }
}
