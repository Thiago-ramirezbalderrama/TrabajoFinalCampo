using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios.Excepciones
{
    public class CannotDeleteSysAdminRoleException : CustomTranslatableException
    {
        public CannotDeleteSysAdminRoleException() : base("cannot_delete_the_sysadmin_role")
        {
        }
    }
}
