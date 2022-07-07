using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class CannotDisableOnlyEnabledLanguageException : CustomTranslatableException
    {
        public CannotDisableOnlyEnabledLanguageException() : base("cannot_disable_the_only_enabled_language")
        {
        }
    }
}
