using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IInformeReabastecimiento : ICreatable<Entities.IInformeReabastecimiento>,
        IUpdateable<Entities.IInformeReabastecimiento>, IReadable<Entities.IInformeReabastecimiento>, IDeletable<Entities.IInformeReabastecimiento>
    {
        Task<Entities.IInformeReabastecimiento> GetUltimoPorEmpleadoSolicitante(Entities.IEmpleado empleado);

        Task CreateDetalleSolicitud(Entities.IInformeReabastecimiento informeReabastecimiento, Entities.IDetalle detalleInformeEntrega);

        Task CreateDetalleEntrega(Entities.IInformeReabastecimiento informeReabastecimiento, Entities.IDetalle detalleInformeEntrega);
    }
}
