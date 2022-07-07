using System;
using Abstracciones.Entities;

namespace BE
{
    public class CambioCategoria : EntidadPersistente, ICambioCategoria
    {
        public Abstracciones.Entities.Traductor.IPalabra TipoCambio { get; set; }
        public DateTime FechaCambio { get; set; }
        public ICategoria EstadoCategoria { get; set; }
        public IEmpleado EmpleadoCambio { get; set; }

        public bool Equals(ICambioCategoria cambio)
        {
            if (cambio == null || !base.Equals(cambio)) return false;

            return EmpleadoCambio.Equals(cambio.EmpleadoCambio) &&
                TipoCambio.Equals(cambio.TipoCambio) &&
                EstadoCategoria.Equals(cambio.EstadoCategoria);
        }
    }
}
