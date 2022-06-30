using System;

namespace Abstracciones.Entities
{
    public interface IProducto : IEntidadPersistente, IEquatable<IProducto>
    {
        string Nombre { get; set; }
        double PrecioUnitario { get; set; }

        ICategoria Categoria { get; set; }
        int CantidadAlmacenes { get; set; }
        int CantidadGondolas { get; set; }
        int AdvertenciaBajoStock { get; set; }
    }
}
