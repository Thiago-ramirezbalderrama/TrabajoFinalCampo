using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class CurrentPasswordNotCorrectException : CustomTranslatableException
    {
        public CurrentPasswordNotCorrectException() : base("current_password_not_correct")
        {
        }
    }
}
