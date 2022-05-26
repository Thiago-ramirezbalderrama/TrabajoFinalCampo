using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class NotAllowedException : CustomTranslatableException
    {
        public NotAllowedException(string permiso) : base("action_not_allowed")
        {
            Permiso = permiso;
        }

        public string Permiso { get; }
    }
}
