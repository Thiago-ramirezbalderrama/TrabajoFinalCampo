using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IEmpleado : IReadable<Entities.IEmpleado>, IDeletable<Entities.IEmpleado>
    {
        Task Create(Entities.IEmpleado empleado, string Clave);

        Task Update(Entities.IEmpleado empleado1, Entities.IEmpleado empleado2);

        Task CambiarIdiomaPreferido(Entities.IEmpleado empleado);

        Task CambiarClave(string ClaveActual, string ClaveNueva);

        Task IniciarSesion(int DNI, string Clave);

        Task ActualizarPermisosUsuario();

        Task<int> GetCount();
    }
}
