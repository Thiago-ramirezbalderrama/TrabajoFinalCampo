    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities
{
    public interface ICambioProducto: IEntidadPersistente, IEquatable<ICambioProducto>
    {
        IEmpleado EmpleadoCambio { get; set; }
        Traductor.IPalabra TipoCambio { get; set; }
        IProducto EstadoProducto { get; set; }
        DateTime FechaCambio { get; set; }
    }
}
