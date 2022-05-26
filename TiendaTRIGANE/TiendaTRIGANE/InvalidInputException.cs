using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaTRIGANE
{
    internal class InvalidInputException : Exception
    {
        public InvalidInputException(string fieldName)
        {
            throw new Exception($"{fieldName}: {/*Program.LanguageManager.Traducir*/("invalid_input")}");
        }
    }
}
