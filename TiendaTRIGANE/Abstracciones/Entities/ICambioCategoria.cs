using System;

namespace Abstracciones.Entities
{
    public interface ICambioCategoria : IEntidadPersistente, IEquatable<ICambioCategoria>
    {
        IEmpleado EmpleadoCambio { get; set; }
        Traductor.IPalabra TipoCambio { get; set; }
        ICategoria EstadoCategoria { get; set; }
        DateTime FechaCambio { get; set; }
    }
}
