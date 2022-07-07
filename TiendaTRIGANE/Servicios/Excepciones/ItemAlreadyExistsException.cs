using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class ItemAlreadyExistsException : CustomTranslatableException
    {
        public ItemAlreadyExistsException() : base("item_alreadyexists")
        {
        }
    }
}
