using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IProducto : ICreatable<Entities.IProducto>,
        IReadable<Entities.IProducto>,
        IUpdateable<Entities.IProducto>,
        IDeletable<Entities.IProducto>
    {
        Task ReponerExhibidores(Entities.IProducto producto, int cantidadRepuesta);
        Task UpdateLowStockWarning(Entities.IProducto producto, int nuevaCantidad);
        Task<IList<Entities.IProducto>> GetAll(Entities.ICategoria categoria);

        Task<IList<Entities.IProducto>> GetAllInWarehouses();

        Task<IList<Entities.IProducto>> GetAllInShelves();
    }
}
