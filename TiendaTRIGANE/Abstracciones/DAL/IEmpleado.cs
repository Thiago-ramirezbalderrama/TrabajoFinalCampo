using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IEmpleado : ICreatable<Entities.IEmpleado>, IUpdateable<Entities.IEmpleado>,
        IReadable<Entities.IEmpleado>,
        IDeletable<Entities.IEmpleado>
    {
        Task<Entities.IEmpleado> GetWithLoginInfo(int DNI);

        Task CambiarClave(Entities.IEmpleado empleado);

        Task<int> GetCount();

        Task<int> GetCountGerentes();
    }
}
