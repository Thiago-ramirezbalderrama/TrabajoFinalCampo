using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BE
{
    public class Idioma : EntidadPersistente, Abstracciones.Entities.Traductor.IIdioma
    {
        public string Nombre { get; set; }
        public bool MostrarPorDefecto { get; set; }
        public bool Habilitado { get; set; }

        public bool Equals(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            if (idioma == null || !base.Equals(idioma)) return false;

            return Nombre == idioma.Nombre &&
                MostrarPorDefecto == idioma.MostrarPorDefecto &&
                Habilitado == idioma.Habilitado;
        }
    }
}
