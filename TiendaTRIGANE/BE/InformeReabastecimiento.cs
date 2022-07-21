using System;
using System.Collections.Generic;
using Abstracciones.Entities;

namespace BE
{
    public class InformeReabastecimiento : EntidadPersistente, IInformeReabastecimiento
    {
        public InformeReabastecimiento(IProveedor proveedor, IEmpleado empleadoSolicitante)
        {
            Proveedor = proveedor;
            EmpleadoSolicitante = empleadoSolicitante;
            _detallesSolicitud = new List<IDetalle>();
            _detallesEntrega = new List<IDetalle>();
        }

        public IProveedor Proveedor { get; set; }
        public IEmpleado EmpleadoSolicitante { get; set; }
        public IEmpleado EmpleadoReceptor { get; set; }
        public DateTime FechaSolicitud { get; set; }
        public DateTime FechaEntregaAcordada { get; set; }
        public DateTime FechaEntregaReal { get; set; }
        public string ComentarioSolicitud { get; set; }
        public string ComentarioEntrega { get; set; }
        public bool SolicitudTerminada { get; set; }
        public bool EntregaAceptada { get; set; }

        private readonly List<IDetalle> _detallesSolicitud;
        public IReadOnlyCollection<IDetalle> DetallesSolicitud { get => _detallesSolicitud; }
        private readonly List<IDetalle> _detallesEntrega;
        public IReadOnlyCollection<IDetalle> DetallesEntrega { get => _detallesEntrega; }
        public void AgregarDetalleSolicitud(IDetalle detalle)
        {
            _detallesSolicitud.Add(detalle);
        }

        public void AgregarDetalleEntrega(IDetalle detalle)
        {
            _detallesEntrega.Add(detalle);
        }

        public bool Equals(IInformeReabastecimiento informe)
        {
            if (informe == null || !base.Equals(informe)) return false;

            return Proveedor == informe.Proveedor &&
                EmpleadoSolicitante == informe.EmpleadoSolicitante &&
                EmpleadoReceptor == informe.EmpleadoReceptor &&
                FechaSolicitud == informe.FechaSolicitud &&
                FechaEntregaAcordada == informe.FechaEntregaAcordada &&
                FechaEntregaReal == informe.FechaEntregaReal &&
                _detallesSolicitud == informe.DetallesSolicitud &&
                _detallesEntrega == informe.DetallesEntrega;
        }
    }
}
