using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BLL
{
    public class Producto : Abstracciones.BL.IProducto
    {
        private readonly Abstracciones.DAL.IProducto _productoData;

        public Producto(Abstracciones.DAL.IProducto productoData = null)
        {
            _productoData = productoData ?? new DAL.Producto();
        }

        public async Task Create(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsCREATE");
            producto.CantidadDepositos = 0;
            producto.CantidadExhibidores = 0;
            producto.AdvertenciaBajoStock = 0;
            await _productoData.Create(producto);
        }

        public async Task Delete(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsDELETE");
            if (producto.CantidadDepositos + producto.CantidadExhibidores > 0)
            {
                throw new Excepciones.TheresStillProductsLeftToSellException();
            }

            await _productoData.Delete(producto);
        }

        public async Task Update(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsUPDATE");
            await _productoData.Update(producto);
        }

        public async Task UpdateLowStockWarning(Abstracciones.Entities.IProducto producto, int nuevaCantidad)
        {
            Servicios.PermisosAdmin.CheckPermission("productsUPDATE");
            int cantidadAnterior = producto.AdvertenciaBajoStock;
            producto.AdvertenciaBajoStock = nuevaCantidad;
            await _productoData.Update(producto);
        }

        public async Task ReponerExhibidores(Abstracciones.Entities.IProducto producto, int cantidadRepuesta)
        {
            Servicios.PermisosAdmin.CheckPermission("productsREPLENISH");
            int cantidadAnterior = producto.CantidadExhibidores;
            producto.CantidadExhibidores += cantidadRepuesta;
            producto.CantidadDepositos -= cantidadRepuesta;
            if (producto.CantidadDepositos <= 0)
            {
                producto.CantidadDepositos = 0;
            }
            await _productoData.Update(producto);
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAll();

            return productos;
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAll(Abstracciones.Entities.ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAll(categoria);

            return productos;
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAllInWarehouses()
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAllInWarehouses();

            return productos;
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAllInShelves()
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAllInShelves();

            return productos;
        }
    }
}
