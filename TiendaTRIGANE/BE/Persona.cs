using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BE
{
    public class Persona : IPersona
    {

        public int DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Presentacion { get => $"(DNI {DNI}) {Nombre} {Apellido}";}
        public string Telefono { get; set; }
        public string Email { get; set; }
        public DateTime FechaNacimiento { get; set; }

        public bool Equals(IPersona persona)
        {
            if (persona == null)return false;

            return DNI == persona.DNI &&
                Nombre == persona.Nombre &&
                Apellido == persona.Apellido &&
                Telefono == persona.Telefono &&
                Email == persona.Email &&
                FechaNacimiento == persona.FechaNacimiento;
                
        }

    }
}
