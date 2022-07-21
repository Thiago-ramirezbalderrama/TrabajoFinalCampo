using Abstracciones.Entities;

namespace BE
{
    public class Proveedor : Persona, IProveedor
    {
        public Proveedor(ICategoria categoria)
        {
            Categoria = categoria;
        }

        public ICategoria Categoria { get; set; }

        public bool Equals(IProveedor proveedor)
        {
            if (proveedor == null || !base.Equals(proveedor)) return false;

            return Categoria == proveedor.Categoria;
        }
    }
}
