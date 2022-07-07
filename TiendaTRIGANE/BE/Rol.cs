using Abstracciones.Entities;

namespace BE
{
    public class Rol : EntidadPersistente, IRol
    {

        public string Nombre { get; set; }
        public bool AdministradorSistema { get; set; }

        public bool validacion(Rol rol)
        {
            if(rol == null || !base.Equals(rol))
                return false;

            return Nombre == rol.Nombre &&
                AdministradorSistema == rol.AdministradorSistema;
        }

    }
}
