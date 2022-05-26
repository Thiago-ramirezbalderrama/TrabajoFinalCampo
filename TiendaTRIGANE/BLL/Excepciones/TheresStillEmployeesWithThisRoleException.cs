using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Excepciones
{
    public class TheresStillEmployeesWithThisRoleException : Servicios.Excepciones.CustomTranslatableException
    {
        public TheresStillEmployeesWithThisRoleException() : base("theres_still_employees_with_this_role")
        {

        }
    }
}
