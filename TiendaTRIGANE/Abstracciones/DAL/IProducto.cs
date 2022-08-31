using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IProducto : ICreatable<Entities.IProducto>,
        IUpdateable<Entities.IProducto>,
        IDeletable<Entities.IProducto>,
        IReadable<Entities.IProducto>
    {
        Task<IList<Entities.IProducto>> GetAll(Entities.ICategoria categoria);

        Task<IList<Entities.IProducto>> GetAllInWarehouses();

        Task<IList<Entities.IProducto>> GetAllInShelves();

        Task<IList<Entities.ICambioProducto>> GetAllChanges(Entities.IProducto producto);
    }
}
