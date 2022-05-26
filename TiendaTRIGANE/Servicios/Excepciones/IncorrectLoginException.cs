using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class IncorrectLoginException : CustomTranslatableException
    {
        public IncorrectLoginException() : base("incorrect_login")
        {
        }
    }
}
