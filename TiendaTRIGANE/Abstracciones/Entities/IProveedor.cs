using System;

namespace Abstracciones.Entities
{
    public interface IProveedor : IPersona, IEquatable<IProveedor>
    {
        ICategoria Categoria { get; set; }
    }
}
