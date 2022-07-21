using System;

namespace Abstracciones.Entities
{
    public interface IDetalleVenta : IDetalle, IEquatable<IDetalleVenta>
    {
        double Importe { get; set; }
    }
}
