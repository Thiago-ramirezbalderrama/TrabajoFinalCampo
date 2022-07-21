using System;
using System.Collections.Generic;

namespace Abstracciones.Entities
{
    public interface IInformeReabastecimiento : IEntidadPersistente, IEquatable<IInformeReabastecimiento>
    {
        IProveedor Proveedor { get; set; }
        IEmpleado EmpleadoSolicitante { get; set; }
        IEmpleado EmpleadoReceptor { get; set; }
        DateTime FechaSolicitud { get; set; }
        DateTime FechaEntregaAcordada { get; set; }
        DateTime FechaEntregaReal { get; set; }
        string ComentarioSolicitud { get; set; }
        string ComentarioEntrega { get; set; }
        bool SolicitudTerminada { get; set; }
        bool EntregaAceptada { get; set; }
        IReadOnlyCollection<IDetalle> DetallesSolicitud { get; }
        IReadOnlyCollection<IDetalle> DetallesEntrega { get; }

        void AgregarDetalleSolicitud(IDetalle detalle);

        void AgregarDetalleEntrega(IDetalle detalle);
    }
}
