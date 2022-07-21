using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IVenta : ICreatable<Entities.IVenta>, IUpdateable<Entities.IVenta>, IReadable<Entities.IVenta>
    {
        Task<Entities.IVenta> GetUltimoPorVendedor(Entities.IEmpleado empleado);

        Task CreateDetalle(Entities.IVenta venta, Entities.IDetalleVenta detalleVenta);
    }
}
