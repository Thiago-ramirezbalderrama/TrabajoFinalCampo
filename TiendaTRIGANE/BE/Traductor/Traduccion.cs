using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Traduccion : Abstracciones.Entities.Traductor.ITraduccion
    {
        public Traduccion(Abstracciones.Entities.Traductor.IIdioma idioma, Abstracciones.Entities.Traductor.IPalabra palabra)
        {
            Idioma = idioma;
            Palabra = palabra;
        }

        public Abstracciones.Entities.Traductor.IIdioma Idioma { get; set; }
        public Abstracciones.Entities.Traductor.IPalabra Palabra { get; set; }
        public string Texto { get; set; }

        public bool Equals(Abstracciones.Entities.Traductor.ITraduccion traduccion)
        {
            if (traduccion == null || !base.Equals(traduccion)) return false;

            return Idioma == traduccion.Idioma &&
                Palabra == traduccion.Palabra &&
                Texto == traduccion.Texto;
        }
    }
}
