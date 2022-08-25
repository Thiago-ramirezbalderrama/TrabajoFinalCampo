using System;

namespace BE
{
    public class EventoBitacora : EntidadPersistente, Abstracciones.Entities.IEventoBitacora
    {
        public EventoBitacora()
        {
        }

        public DateTime Fecha { get; set; }
        public Abstracciones.Entities.IEmpleado Empleado { get; set; }
        public Abstracciones.Entities.Traductor.IPalabra Severidad { get; set; }
        public Abstracciones.Entities.Traductor.IPalabra Actividad { get; set; }
        public Abstracciones.Entities.Traductor.IPalabra TipoEntidad { get; set; }
        public string InfoAsociada { get; set; }

        public bool Equals(Abstracciones.Entities.IEventoBitacora evento)
        {
            if (evento == null || !base.Equals(evento)) return false;

            return Fecha == evento.Fecha &&
                Empleado.Equals(evento.Empleado) &&
                Severidad.Equals(evento.Severidad) &&
                Actividad.Equals(evento.Actividad) &&
                TipoEntidad.Equals(evento.TipoEntidad) &&
                InfoAsociada == evento.InfoAsociada;
        }

    }
}
