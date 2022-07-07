using Abstracciones.Entities

namespace BE
{
    public class Categoria : EntidadPersistente, ICategoria
    {
        public string Nombre { get; set; }
        public byte PorcentajeDescuento { get; set; }
        public bool Perecedera { get; set; }
        public bool Equals(ICategoria categoria)
        {
            if (categoria == null || !base.Equals(categoria)) return false;

            return Nombre == categoria.Nombre &&
                PorcentajeDescuento == categoria.PorcentajeDescuento &&
                Perecedera == categoria.Perecedera;
        }
    }
}
