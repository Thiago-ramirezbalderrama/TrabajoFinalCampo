using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class InformeReabastecimiento : Abstracciones.BL.IInformeReabastecimiento
    {
        private readonly Abstracciones.DAL.IInformeReabastecimiento _informeReabastecimientoData;
        private readonly Abstracciones.DAL.IProducto _productoData;

        public InformeReabastecimiento(
            Abstracciones.DAL.IInformeReabastecimiento informeData = null,
            Abstracciones.DAL.IProducto productoData = null
            )
        {
            _informeReabastecimientoData = informeData ?? new DAL.InformeReabastecimientoDAL();
            _productoData = productoData ?? new DAL.Producto();
        }

        public async Task CrearSolicitud(Abstracciones.Entities.IInformeReabastecimiento informe, IList<Abstracciones.Entities.IDetalle> detalles)
        {
            Servicios.PermisosAdmin.CheckPermission("replenishmentREQUEST");
            await _informeReabastecimientoData.Create(informe);
            informe = await _informeReabastecimientoData.GetUltimoPorEmpleadoSolicitante(Servicios.SesionAdmin.GetInstance.Empleado);

            foreach (var detalle in detalles)
            {
                await _informeReabastecimientoData.CreateDetalleSolicitud(informe, detalle);
            }
        }

        public async Task TerminarSolicitud(Abstracciones.Entities.IInformeReabastecimiento informe)
        {
            Servicios.PermisosAdmin.CheckPermission("replenishmentEND_REQUEST");
            informe.SolicitudTerminada = true;
            await _informeReabastecimientoData.Update(informe);
            if (!informe.EntregaAceptada) return;
            foreach (var detalle in informe.DetallesEntrega)
            {
                await _informeReabastecimientoData.CreateDetalleEntrega(informe, detalle);
                detalle.Producto.CantidadDepositos += detalle.Cantidad;
                await _productoData.Update(detalle.Producto);
            }
        }

        public async Task<IList<Abstracciones.Entities.IInformeReabastecimiento>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("replenishmentREAD");
            return await _informeReabastecimientoData.GetAll();
        }
    }
}
