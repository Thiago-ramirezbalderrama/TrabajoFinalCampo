using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BE
{
    public class Venta : EntidadPersistente, IVenta
    {
        public Venta(IEmpleado empleadoVendedor)
        {
            EmpleadoVendedor = empleadoVendedor;
            _detalles = new List<IDetalleVenta>();
        }

        public DateTime Fecha { get; set; }
        public bool Efectuada { get; set; }

        public double Importe
        {
            get => _detalles.Sum(detalle => detalle.Importe);
        }

        public IEmpleado EmpleadoVendedor { get; set; }
        public IEmpleado EmpleadoCancelacion { get; set; }

        private List<IDetalleVenta> _detalles { get; }
        public IReadOnlyCollection<IDetalleVenta> Detalles { get => _detalles; }

        public void AgregarDetalle(IDetalleVenta detalle)
        {
            _detalles.Add(detalle);
        }

        public bool Equals(IVenta venta)
        {
            if (venta == null || !base.Equals(venta)) return false;

            return Fecha == venta.Fecha &&
                Efectuada == venta.Efectuada &&
                EmpleadoVendedor.Equals(EmpleadoVendedor) &&
                EmpleadoCancelacion.Equals(venta.EmpleadoCancelacion) &&
                _detalles == venta.Detalles;
        }
    }
}
