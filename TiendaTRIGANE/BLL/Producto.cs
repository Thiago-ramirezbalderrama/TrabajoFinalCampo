using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BLL
{
    public class Producto : Abstracciones.BL.IProducto
    {
        private readonly Abstracciones.DAL.IProducto _productoData;
        private readonly Abstracciones.BL.IBitacora _bitacora;
        public Producto(Abstracciones.DAL.IProducto productoData = null, Abstracciones.BL.IBitacora bitacora = null)
        {
            _productoData = productoData ?? new DAL.Producto();
            _bitacora = bitacora ?? new BLL.Bitacora();
        }

        public async Task Create(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsCREATE");
            producto.CantidadDepositos = 0;
            producto.CantidadExhibidores = 0;
            producto.AdvertenciaBajoStock = 0;
            await _productoData.Create(producto);
            await _bitacora.LogInformation("successful_addition", "product", producto.Nombre);
        }

        public async Task Delete(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsDELETE");
            if (producto.CantidadDepositos + producto.CantidadExhibidores > 0)
            {
                throw new Excepciones.TheresStillProductsLeftToSellException();
            }

            await _productoData.Delete(producto);
            await _bitacora.LogInformation("successful_deletion", "product", producto.Nombre);
        }

        public async Task Update(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsUPDATE");
            await _productoData.Update(producto);
            await _bitacora.LogInformation("successful_update", "product", producto.Nombre);
        }

        public async Task UpdateLowStockWarning(Abstracciones.Entities.IProducto producto, int nuevaCantidad)
        {
            Servicios.PermisosAdmin.CheckPermission("productsUPDATE");
            int cantidadAnterior = producto.AdvertenciaBajoStock;
            producto.AdvertenciaBajoStock = nuevaCantidad;
            await _productoData.Update(producto);
            await _bitacora.LogInformation("low_stock_warning_updated", "product", $"{producto.Nombre}: {cantidadAnterior} -> {producto.AdvertenciaBajoStock}");
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
            await _bitacora.LogInformation("restocked_shelves", "product", $"{producto.Nombre}: {cantidadRepuesta} ({cantidadAnterior} -> {producto.CantidadExhibidores})");
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAll();
            if (productos.Count == 0)
            {
                await _bitacora.LogWarning("there_are_no_products", "products", "");
            }

            return productos;
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAll(Abstracciones.Entities.ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAll(categoria);
            if (productos.Count == 0)
            {
                await _bitacora.LogWarning("there_are_no_products_from_this_category", "products", categoria.Nombre);
            }

            return productos;
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAllInWarehouses()
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAllInWarehouses();
            if (productos.Count == 0)
            {
                await _bitacora.LogWarning("there_are_no_products_in_warehouses", "products", "");
            }

            return productos;
        }

        public async Task<IList<Abstracciones.Entities.IProducto>> GetAllInShelves()
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            var productos = await _productoData.GetAllInShelves();
            if (productos.Count == 0)
            {
                await _bitacora.LogWarning("there_are_no_products_in_shelves", "products", "");
            }

            return productos;
        }

        public async Task<IList<ICambioProducto>> GetAllChanges(IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsREAD");
            return await _productoData.GetAllChanges(producto);
        }
    }
}
