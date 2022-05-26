using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class DatabaseUnknownErrorException : CustomTranslatableException
    {
        public DatabaseUnknownErrorException() : base("database_unknown_error_occurred")
        {
        }
    }
}
