using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface IEntidadPersistente : IEquatable<IEntidadPersistente>
    {
        int ID { get; set; }
        byte[] DVH { get; set; }
        bool EstadoActivo { get; set; }
    }
}
