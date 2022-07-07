using System;

namespace Abstracciones.Entities
{
    public interface IPersona : IEquatable<IPersona>
    {

        int DNI { get; set; }
        string Nombre { get; set; }
        string Apellido { get; set; }
        string Presentacion { get; }
        string Telefono { get; set; }
        string Email { get; set; }
        DateTime FechaNacimiento { get; set; }

    }
}
