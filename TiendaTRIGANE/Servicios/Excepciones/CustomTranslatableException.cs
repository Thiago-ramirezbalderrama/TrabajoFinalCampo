using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class CustomTranslatableException : Exception
    {
        public CustomTranslatableException(string palabra)
        {
            Palabra = palabra;
        }

        public string Palabra { get; }
    }
}
