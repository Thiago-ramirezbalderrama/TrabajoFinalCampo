using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class ConnectionToDataBaseException : CustomTranslatableException
    {
        public ConnectionToDataBaseException() : base("Error conecting to DB")
        {
        }
    }
}
