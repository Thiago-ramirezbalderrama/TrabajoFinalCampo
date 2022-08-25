using System;

namespace Abstracciones.Entities
{
    public interface IEventoBitacora : IEntidadPersistente
    {

        IEmpleado Empleado { get; set; }
        DateTime Fecha { get; set; }
        Traductor.IPalabra Severidad { get; set; }
        Traductor.IPalabra Actividad { get; set; }
        Traductor.IPalabra TipoEntidad { get; set; }
        string InfoAsociada { get; set; }

    }
}
