using Abstracciones.Entities;

namespace BE
{
    public class Detalle : IDetalle
    {
        public Detalle(IProducto producto)
        {
            Producto = producto;
        }

        public IProducto Producto { get; set; }
        public int Cantidad { get; set; }

        public bool Equals(IDetalle detalle)
        {
            if (detalle == null || !base.Equals(detalle)) return false;

            return Producto == detalle.Producto &&
                Cantidad == detalle.Cantidad;
        }
    }
}
