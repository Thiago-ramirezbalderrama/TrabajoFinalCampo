using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface IBackup : IEntidadPersistente
    {
        DateTime Fecha { get; set; }
        IEmpleado Empleado { get; set; }
    }
}
