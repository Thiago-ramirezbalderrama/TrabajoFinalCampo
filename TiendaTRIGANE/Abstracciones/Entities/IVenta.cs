using System;
using System.Collections.Generic;

namespace Abstracciones.Entities
{
    public interface IVenta : IEntidadPersistente, IEquatable<IVenta>
    {
        DateTime Fecha { get; set; }
        bool Efectuada { get; set; }
        double Importe { get; }
        IEmpleado EmpleadoVendedor { get; set; }
        IEmpleado EmpleadoCancelacion { get; set; }

        IReadOnlyCollection<IDetalleVenta> Detalles { get; }

        void AgregarDetalle(IDetalleVenta detalle);
    }
}
