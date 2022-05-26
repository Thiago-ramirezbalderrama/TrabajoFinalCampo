using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface IEventoBitacora : IEntidadPersistente
    {

        IEmpleado Empleado { get; set; }
        DateTime Fecha { get; set; }
        string InfoAsociada { get; set; }

    }
}
