using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface ICategoria : IEquatable<ICategoria>, IEntidadPersistente
    {
        string Nombre { get; set; }
        byte PorcentajeDescuento { get; set; }
    }
}
