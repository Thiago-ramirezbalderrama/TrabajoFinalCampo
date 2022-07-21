using System;

namespace Abstracciones.Entities
{
    public interface IDetalle : IEquatable<IDetalle>
    {
        IProducto Producto { get; set; }
        int Cantidad { get; set; }
    }
}
