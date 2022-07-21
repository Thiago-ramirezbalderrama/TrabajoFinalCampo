using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TiendaTRIGANE
{
    internal class EmptyFieldException : Exception
    {
        public EmptyFieldException(string fieldName)
        {
            throw new Exception($"{fieldName}: {Program.LenguajeAdmin.Traducir("field_cannot_be_empty")}");
        }
    }
}
