using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class OnlySysAdminsCanManageSysAdmins : CustomTranslatableException
    {
        public OnlySysAdminsCanManageSysAdmins() : base("only_sysadmins_can_manage_sysadmins")
        {
        }
    }
}
