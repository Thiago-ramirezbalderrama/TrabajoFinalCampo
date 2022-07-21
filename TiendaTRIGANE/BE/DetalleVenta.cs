using Abstracciones.Entities;

namespace BE
{
    public class DetalleVenta : Detalle, IDetalleVenta
    {
        public DetalleVenta(IProducto producto) : base(producto)
        {
        }

        public double Importe { get; set; }

        public bool Equals(IDetalleVenta detalleVenta)
        {
            if (detalleVenta == null || !base.Equals(detalleVenta)) return false;

            return Importe == detalleVenta.Importe;
        }
    }
}
