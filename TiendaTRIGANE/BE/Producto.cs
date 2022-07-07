using Abstracciones.Entities;

namespace BE
{
    public class Producto : EntidadPersistente, IProducto
    {

        public Producto(ICategoria categoria)
        {
            Categoria = categoria;
        }

        public string Nombre { get; set; }
        public double PrecioUnitario { get; set; }
        public ICategoria Categoria { get; set; }
        public int CantidadAlmacenes { get; set; }
        public int CantidadGondolas { get; set; }
        public int AdvertenciaBajoStock { get; set; }
        public bool Equals(IProducto producto)
        {
            if (producto == null) return false;

            return Nombre == producto.Nombre &&
                PrecioUnitario == producto.PrecioUnitario &&
                Categoria.Equals(Categoria) &&
                CantidadAlmacenes == producto.CantidadAlmacenes &&
                CantidadGondolas == producto.CantidadGondolas &&
                AdvertenciaBajoStock == producto.AdvertenciaBajoStock;
        }

    }
}
