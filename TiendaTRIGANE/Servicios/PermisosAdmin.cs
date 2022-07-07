using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public static class PermisosAdmin
    {

        public static Abstracciones.Entities.IPermiso Permisos { get; set; }

        private static bool Existe(Abstracciones.Entities.IPermiso p, string NombreNecesario)
        {
            var existe = false;
            if (p.NombrePermiso.Equals(NombreNecesario))
                existe = true;
            else
            {
                if (p.Hijos == null) return false;
                foreach (var item in p.Hijos)
                {
                    existe = Existe(item, NombreNecesario);
                    if (existe) return true;
                }
            }
            return existe;
        }

        public static void CheckPermission(string permission)
        {
            if (!Existe(Permisos, permission))
            {
                throw new Excepciones.NotAllowedException(permission);
            }
        }

    }
}
