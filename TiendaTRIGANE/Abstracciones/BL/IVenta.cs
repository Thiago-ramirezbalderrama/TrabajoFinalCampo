using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IVenta : IReadable<Entities.IVenta>
    {
        Task Realizar(Entities.IVenta venta, IList<Entities.IDetalleVenta> detalles);

        Task Cancelar(Entities.IVenta venta);

        double CalcularImportePorProducto(Entities.IProducto producto, int Cantidad);

        double CalcularImporteTotal(IList<Entities.IDetalleVenta> detalles);
    }
}
