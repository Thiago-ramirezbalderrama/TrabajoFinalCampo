using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Venta : Abstracciones.BL.IVenta
    {
        private readonly Abstracciones.DAL.IVenta _ventaData;
        private readonly Abstracciones.DAL.IProducto _productoData;
        private readonly Abstracciones.BL.IBitacora _bitacora;

        public Venta(Abstracciones.DAL.IVenta ventaData = null, Abstracciones.DAL.IProducto productoData = null, Abstracciones.BL.IBitacora bitacora = null)
        {
            _ventaData = ventaData ?? new DAL.VentaDAL();
            _productoData = productoData ?? new DAL.Producto();
            _bitacora = bitacora ?? new BLL.Bitacora();
        }

        public async Task Realizar(Abstracciones.Entities.IVenta venta, IList<Abstracciones.Entities.IDetalleVenta> detalles)
        {
            Servicios.PermisosAdmin.CheckPermission("makeSale");
            //venta.EmpleadoVendedor = (Entities.Empleado)Service.SessionManager.GetInstance.Empleado;
            venta.Fecha = DateTime.Now;
            venta.Efectuada = true;
            await _ventaData.Create(venta);
            venta = await _ventaData.GetUltimoPorVendedor(Servicios.SesionAdmin.GetInstance.Empleado);
            foreach (var detalle in detalles)
            {
                detalle.Importe = CalcularImportePorProducto(detalle.Producto, detalle.Cantidad);
                detalle.Producto.CantidadExhibidores -= detalle.Cantidad;

                //en el caso de que se haya vendido varios productos que no esten cargados en el sistema en el momento que este
                //cajero estaba realizando la venta, la cantidad en gondolas sería negativo. por eso seteo la cantidad a 0.
                if (detalle.Producto.CantidadExhibidores < 0)
                {
                    detalle.Producto.CantidadExhibidores = 0;
                }
                await _ventaData.CreateDetalle(venta, detalle);
                await _productoData.Update(detalle.Producto);
            }
            await _bitacora.LogInformation("sale_has_been_made", "sales", "");
        }

        public async Task Cancelar(Abstracciones.Entities.IVenta venta)
        {
            Servicios.PermisosAdmin.CheckPermission("cancelSale");
            foreach (var detalle in venta.Detalles)
            {
                detalle.Producto.CantidadExhibidores += detalle.Cantidad;
                await _productoData.Update(detalle.Producto);
            }
            venta.EmpleadoCancelacion = (BE.Empleado)Servicios.SesionAdmin.GetInstance.Empleado;
            venta.Efectuada = false;
            await _ventaData.Update(venta);
            await _bitacora.LogInformation("sale_has_been_cancelled", "sales", "");
        }

        public async Task<IList<Abstracciones.Entities.IVenta>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("salesRecordREAD");
            return await _ventaData.GetAll();
        }

        public double CalcularImportePorProducto(Abstracciones.Entities.IProducto producto, int cantidad)
        {
            var importe = producto.PrecioUnitario * cantidad;
            return Math.Round(importe, 2);
        }

        public double CalcularImporteTotal(IList<Abstracciones.Entities.IDetalleVenta> detalles)
        {
            double importe = 0;
            foreach (var detalle in detalles)
            {
                importe += CalcularImportePorProducto(detalle.Producto, detalle.Cantidad);
            }
            return Math.Round(importe, 2);
        }
    }
}
