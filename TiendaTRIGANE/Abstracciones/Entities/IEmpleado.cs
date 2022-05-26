namespace Abstracciones.Entities
{
    public interface IEmpleado : IPersona
    {
        IRol Rol { get; set; }
        byte[] Password { get; set; }
        byte[] Password_Salt { get; set; }
    }
}
