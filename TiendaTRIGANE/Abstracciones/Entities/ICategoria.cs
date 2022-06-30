using System;

namespace Abstracciones.Entities
{
    public interface ICategoria : IEquatable<ICategoria>, IEntidadPersistente
    {
        string Nombre { get; set; }
        byte PorcentajeDescuento { get; set; }
        bool Perecedera { get; set; }
    }
}
