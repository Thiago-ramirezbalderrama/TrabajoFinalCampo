using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface IRol : IEntidadPersistente
    {

        string Nombre { get; set; }
        bool AdministradorSistema { get; set; }

    }
}
