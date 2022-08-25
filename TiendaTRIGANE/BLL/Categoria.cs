using System.Collections.Generic;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BLL
{
    public class Categoria : Abstracciones.BL.ICategoria
    {
        private readonly Abstracciones.DAL.ICategoria _categoriasData;
        private readonly Abstracciones.DAL.IProducto _productosData;
        private readonly Abstracciones.DAL.IProveedor _proveedoresData;
        private readonly Abstracciones.BL.IBitacora _bitacoraData;
        private readonly Abstracciones.DAL.IInformeReabastecimiento _informeReabastecimientoData;

        public Categoria(Abstracciones.DAL.ICategoria categoriaData = null,
            Abstracciones.DAL.IInformeReabastecimiento informeReabastecimientoData = null,
            Abstracciones.DAL.IProducto productosData = null,
            Abstracciones.DAL.IProveedor proveedoresData = null,
            Abstracciones.BL.IBitacora bitacora = null)
        {
            _categoriasData = categoriaData ?? new DAL.Categoria();
            _informeReabastecimientoData = informeReabastecimientoData ?? new DAL.InformeReabastecimientoDAL();
            _productosData = productosData ?? new DAL.Producto();
            _proveedoresData = proveedoresData ?? new DAL.Proveedor();
            _bitacoraData = bitacora ?? new BLL.Bitacora();
        }

        public async Task Create(ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("categoriesCREATE");
            await _categoriasData.Create(categoria);
            await _bitacoraData.LogInformation("successful_addition", "category", categoria.Nombre);
        }

        public async Task Delete(ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("categoriesDELETE");
            var Tasks = new List<Task>();

            var productosTask = _productosData.GetAll();
            var proveedoresTask = _proveedoresData.GetAll();
            var informesTask = _informeReabastecimientoData.GetAll();

            await Task.WhenAll(
               productosTask,
               proveedoresTask,
               informesTask
            );
            var productos = (List<IProducto>)await productosTask;
            var proveedores = (List<IProveedor>)await proveedoresTask;
            var informes = (List<IInformeReabastecimiento>)await informesTask;

            #region Agregar a la lista de tasks la eliminacion de los productos de la categoria

            productos = productos.FindAll(producto => producto.Categoria.Equals(categoria));

            //El primer loop verifica que no hayan productos sin venderse de la categoria.
            //El segundo loop agrega el task de la eliminacion a la lista de tasks
            //Separe esto en dos listas porque si se ejecuta un task de eliminacion de un producto mientras se recorre la lista,
            //se podria llegar a un producto que tire la excepcion y van a quedar algunos productos eliminados y otros no.
            foreach (var producto in productos)
            {
                if (producto.CantidadExhibidores + producto.CantidadDepositos > 0)
                {
                    throw new Excepciones.TheresStillProductsLeftToSellException();
                }
            }
            foreach (var producto in productos)
            {
                Tasks.Add(_productosData.Delete(producto));
            }

            #endregion Agregar a la lista de tasks la eliminacion de los productos de la categoria

            #region Agregar a la lista de tasks la eliminacion de los informes pendientes de la categoria

            informes = informes.FindAll(informe => informe.Proveedor.Categoria.Equals(categoria) && !informe.SolicitudTerminada);

            foreach (var informe in informes)
            {
                Tasks.Add(_informeReabastecimientoData.Delete(informe));
            }

            #endregion Agregar a la lista de tasks la eliminacion de los informes pendientes de la categoria

            #region Agregar a la lista de tasks la eliminacion de los proveedores de la categoria

            proveedores = proveedores.FindAll(proveedor => proveedor.Categoria.Equals(categoria));
            foreach (var proveedor in proveedores)
            {
                Tasks.Add(_proveedoresData.Delete(proveedor));
            }

            #endregion Agregar a la lista de tasks la eliminacion de los proveedores de la categoria

            Tasks.Add(_categoriasData.Delete(categoria));

            //elimina todo simultaneamente
            await Task.WhenAll(
               Tasks
            );

            await _bitacoraData.LogInformation("successful_deletion", "category", categoria.Nombre);
        }

        public async Task Update(ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("categoriesUPDATE");
            await _categoriasData.Update(categoria);
            await _bitacoraData.LogInformation("successful_update", "category", categoria.Nombre);
        }

        public async Task<IList<ICategoria>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("categoriesREAD");
            return await _categoriasData.GetAll();
        }

        public async Task<IList<ICambioCategoria>> GetAllChanges(ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("categoriesREAD");
            return await _categoriasData.GetAllChanges(categoria);
        }
    }
}
