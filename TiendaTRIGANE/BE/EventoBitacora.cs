using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class EventoBitacora : EntidadPersistente, Abstracciones.Entities.IEventoBitacora
    {
        public EventoBitacora()
        {
        }

        public DateTime Fecha { get; set; }
        public Abstracciones.Entities.IEmpleado Empleado { get; set; }
        public string Severidad { get; set; }
        public string Actividad { get; set; }
        public string TipoEntidad { get; set; }
        public string InfoAsociada { get; set; }

    }
}
