using Abstracciones;
using Abstracciones.Entities;

namespace BE
{
    public class Empleado : Persona , IEmpleado
    {
        public Empleado(IRol rol)
        {
            Rol = rol;
        }

        public IRol Rol { get; set; }
        public byte[] Password { get; set; }
        public byte[] Password_Salt { get; set; }
        public Abstracciones.Entities.Traductor.IIdioma Idioma { get; set; }


        public bool Equals(IEmpleado empleado)
        {
            if (empleado == null || !base.Equals(empleado)) return false;

            return Rol == empleado.Rol;
        }
    }
}
