using Abstracciones.Entities;

namespace BE
{
    public class Producto : EntidadPersistente, IProducto
    {

        public Producto()
        {
        }

        public Producto(ICategoria categoria)
        {
            Categoria = categoria;
        }

        public string Nombre { get; set; }
        public double PrecioUnitario { get; set; }
        public ICategoria Categoria { get; set; }
        public int CantidadDepositos { get; set; }
        public int CantidadExhibidores { get; set; }
        public int AdvertenciaBajoStock { get; set; }
        public bool Equals(IProducto producto)
        {
            if (producto == null) return false;

            return Nombre == producto.Nombre &&
                PrecioUnitario == producto.PrecioUnitario &&
                Categoria.Equals(Categoria) &&
                CantidadDepositos == producto.CantidadDepositos &&
                CantidadExhibidores == producto.CantidadExhibidores &&
                AdvertenciaBajoStock == producto.AdvertenciaBajoStock;
        }

    }
}
