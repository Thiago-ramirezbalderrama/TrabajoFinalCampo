using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            producto.CantidadAlmacenes = 0;
            producto.CantidadGondolas = 0;
            producto.AdvertenciaBajoStock = 0;
            await _productoData.Create(producto);
        }

        public async Task Delete(Abstracciones.Entities.IProducto producto)
        {
            Servicios.PermisosAdmin.CheckPermission("productsDELETE");
            if (producto.CantidadAlmacenes + producto.CantidadGondolas > 0)
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

        public async Task ReponerGondolas(Abstracciones.Entities.IProducto producto, int cantidadRepuesta)
        {
            Servicios.PermisosAdmin.CheckPermission("productsREPLENISH");
            int cantidadAnterior = producto.CantidadGondolas;
            producto.CantidadGondolas += cantidadRepuesta;
            producto.CantidadAlmacenes -= cantidadRepuesta;
            if (producto.CantidadAlmacenes <= 0)
            {
                producto.CantidadAlmacenes = 0;
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
