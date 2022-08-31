using Abstracciones.Entities;
using System;

namespace BE
{
    public class CambioProducto : EntidadPersistente, ICambioProducto
    {
        public Abstracciones.Entities.Traductor.IPalabra TipoCambio { get; set; }
        public DateTime FechaCambio { get; set; }
        public IProducto EstadoProducto { get; set; }
        public IEmpleado EmpleadoCambio { get; set; }

        public bool Equals(ICambioProducto cambio)
        {
            if (cambio == null || !base.Equals(cambio)) return false;

            return EmpleadoCambio.Equals(cambio.EmpleadoCambio) &&
                TipoCambio.Equals(cambio.TipoCambio) &&
                EstadoProducto.Equals(cambio.EstadoProducto);
        }
    }
}
