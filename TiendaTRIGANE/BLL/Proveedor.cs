using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Proveedor : Abstracciones.BL.IProveedor
    {
        private readonly Abstracciones.DAL.IProveedor _proveedorData;

        public Proveedor(Abstracciones.DAL.IProveedor proveedorData = null)
        {
            _proveedorData = proveedorData ?? new DAL.Proveedor();
        }

        public async Task Create(Abstracciones.Entities.IProveedor proveedor)
        {
            Servicios.PermisosAdmin.CheckPermission("suppliersCREATE");
            await _proveedorData.Create(proveedor);
        }

        public async Task Delete(Abstracciones.Entities.IProveedor proveedor)
        {
            Servicios.PermisosAdmin.CheckPermission("suppliersDELETE");
            await _proveedorData.Delete(proveedor);
        }

        public async Task Update(Abstracciones.Entities.IProveedor proveedor)
        {
            Servicios.PermisosAdmin.CheckPermission("suppliersUPDATE");
            await _proveedorData.Update(proveedor);
        }

        public async Task<IList<Abstracciones.Entities.IProveedor>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("suppliersREAD");
            return await _proveedorData.GetAll();
        }

        public async Task<IList<Abstracciones.Entities.IProveedor>> GetAll(Abstracciones.Entities.ICategoria categoria)
        {
            Servicios.PermisosAdmin.CheckPermission("suppliersREAD");
            return await _proveedorData.GetAll(categoria);
        }
    }
}
