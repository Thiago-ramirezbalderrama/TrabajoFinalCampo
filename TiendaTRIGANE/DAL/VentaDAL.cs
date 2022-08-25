using Abstracciones.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.IO;
using Microsoft.Win32;

namespace DAL
{
    public class VentaDAL : Abstracciones.DAL.IVenta
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;
        private readonly Abstracciones.DAL.IBitacoraDAL _bitacora;

        public VentaDAL(Abstracciones.DAL.IAccesoDB db = null, Abstracciones.DAL.IBitacoraDAL bitacora = null)
        {
            _db = db ?? new ConexionDAL();
            _bitacora = bitacora ?? new BitacoraDAL();
        }

        public async Task Create(IVenta venta)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@Fecha", venta.Fecha),
                    new SqlParameter("@Efectuada", venta.Efectuada),
                    new SqlParameter("@DNI_Empleado_Vendedor", venta.EmpleadoVendedor.DNI),
                    new SqlParameter("@DNI_Empleado_Cancelacion", venta.EmpleadoCancelacion?.DNI)
                };

                await _db.WriteStoredProcedure("VENTA_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "sales", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(IVenta venta)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idVenta", venta.ID),
                    new SqlParameter("@Fecha", venta.Fecha),
                    new SqlParameter("@Efectuada", venta.Efectuada),
                    new SqlParameter("@DNI_Empleado_Cancelacion", venta.EmpleadoCancelacion.DNI),
                    new SqlParameter("@DNI_Empleado_Vendedor", venta.EmpleadoVendedor.DNI),
                    new SqlParameter("@Activo", venta.EstadoActivo)
                };
                await _db.WriteStoredProcedure("VENTA_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "sales", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<IVenta>> GetAll()
        {
            try
            {
                var ventas = new List<IVenta>();
                var tabla = await _db.ReadStoredProcedure("VENTA_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var rolEmpleadoVendedor = new BE.Rol
                    {
                        ID = int.Parse(registro["Empleado_Vendedor_Rol_idRol"].ToString()),
                        Nombre = registro["Empleado_Vendedor_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["Empleado_Vendedor_Rol_AdministradorDelSistema"].ToString())
                    };
                    var empleadoVendedor = new BE.Empleado(rolEmpleadoVendedor)
                    {
                        DNI = int.Parse(registro["Empleado_Vendedor_DNI"].ToString()),
                        Nombre = registro["Empleado_Vendedor_Nombre"].ToString(),
                        Apellido = registro["Empleado_Vendedor_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Empleado_Vendedor_FechaNacimiento"].ToString()),
                        Email = registro["Empleado_Vendedor_Email"].ToString()
                    };
                    IRol rolEmpleadoCancelacion;
                    IEmpleado empleadoCancelacion = null;
                    if (!(bool)registro["Efectuada"])
                    {
                        rolEmpleadoCancelacion = new BE.Rol
                        {
                            ID = int.Parse(registro["Empleado_Cancelacion_Rol_idRol"].ToString()),
                            Nombre = registro["Empleado_Cancelacion_Rol_Nombre"].ToString(),
                            AdministradorSistema = bool.Parse(registro["Empleado_Cancelacion_Rol_AdministradorDelSistema"].ToString())
                        };
                        empleadoCancelacion = new BE.Empleado(rolEmpleadoCancelacion)
                        {
                            DNI = int.Parse(registro["Empleado_Cancelacion_DNI"].ToString()),
                            Nombre = registro["Empleado_Cancelacion_Nombre"].ToString(),
                            Apellido = registro["Empleado_Cancelacion_Apellido"].ToString(),
                            FechaNacimiento = DateTime.Parse(registro["Empleado_Cancelacion_FechaNacimiento"].ToString()),
                            Email = registro["Empleado_Cancelacion_Email"].ToString()
                        };
                    }

                    var venta = new BE.Venta(empleadoVendedor)
                    {
                        EstadoActivo = bool.Parse(registro["Activo"].ToString()),
                        Fecha = DateTime.Parse(registro["Fecha"].ToString()),
                        Efectuada = (bool)registro["Efectuada"],
                        EmpleadoCancelacion = !(bool)registro["Efectuada"] ? empleadoCancelacion : null,
                        ID = int.Parse(registro["idVenta"].ToString())
                    };
                    var detalles = await GetAllDetalles(venta);
                    foreach (IDetalleVenta detalle in detalles)
                    {
                        venta.AgregarDetalle(detalle);
                    }
                    ventas.Add(venta);
                }
                return ventas; //.FindAll(venta => venta.EstadoActivo);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "sales", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IVenta> GetUltimoPorVendedor(IEmpleado empleado)
        {
            try
            {
                IList<IVenta> ventas = new List<IVenta>();
                SqlParameter[] parameters = {
                    new SqlParameter("@DNI", empleado.DNI)
                };
                var tabla = await _db.ReadStoredProcedure("VENTA_GET_LATEST_BY_SELLER_EMPLOYEE", parameters);

                foreach (DataRow registro in tabla.Rows)
                {
                    var rolEmpleadoVendedor = new BE.Rol
                    {
                        ID = int.Parse(registro["Empleado_Vendedor_Rol_idRol"].ToString()),
                        Nombre = registro["Empleado_Vendedor_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["Empleado_Vendedor_Rol_AdministradorDelSistema"].ToString())
                    };
                    var empleadoVendedor = new BE.Empleado(rolEmpleadoVendedor)
                    {
                        DNI = int.Parse(registro["Empleado_Vendedor_DNI"].ToString()),
                        Nombre = registro["Empleado_Vendedor_Nombre"].ToString(),
                        Apellido = registro["Empleado_Vendedor_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Empleado_Vendedor_FechaNacimiento"].ToString()),
                        Email = registro["Empleado_Vendedor_Email"].ToString()
                    };
                    BE.Rol rolEmpleadoCancelacion;
                    BE.Empleado empleadoCancelacion = null;
                    if (!(bool)registro["Efectuada"])
                    {
                        rolEmpleadoCancelacion = new BE.Rol
                        {
                            ID = int.Parse(registro["Empleado_Cancelacion_Rol_idRol"].ToString()),
                            Nombre = registro["Empleado_Cancelacion_Rol_Nombre"].ToString(),
                            AdministradorSistema = bool.Parse(registro["Empleado_Cancelacion_Rol_AdministradorDelSistema"].ToString())
                        };
                        empleadoCancelacion = new BE.Empleado(rolEmpleadoCancelacion)
                        {
                            DNI = int.Parse(registro["Empleado_Cancelacion_DNI"].ToString()),
                            Nombre = registro["Empleado_Cancelacion_Nombre"].ToString(),
                            Apellido = registro["Empleado_Cancelacion_Apellido"].ToString(),
                            FechaNacimiento = DateTime.Parse(registro["Empleado_Cancelacion_FechaNacimiento"].ToString()),
                            Email = registro["Empleado_Cancelacion_Email"].ToString()
                        };
                    }

                    var venta = new BE.Venta(empleadoVendedor)
                    {
                        EstadoActivo = bool.Parse(registro["Activo"].ToString()),
                        Fecha = DateTime.Parse(registro["Fecha"].ToString()),
                        Efectuada = (bool)registro["Efectuada"],
                        EmpleadoCancelacion = !(bool)registro["Efectuada"] ? empleadoCancelacion : null,
                        ID = int.Parse(registro["idVenta"].ToString())
                    };

                    var detalles = await GetAllDetalles(venta);
                    foreach (BE.DetalleVenta detalle in detalles)
                    {
                        venta.AgregarDetalle(detalle);
                    }
                    ventas.Add(venta);
                }
                return ventas[0] ?? null;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "sales", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task CreateDetalle(IVenta venta, IDetalleVenta detalleVenta)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idVenta", venta.ID),
                    new SqlParameter("@idProducto", detalleVenta.Producto.ID),
                    new SqlParameter("@Cantidad", detalleVenta.Cantidad),
                    new SqlParameter("@Importe", detalleVenta.Importe)
                };
                await _db.WriteStoredProcedure("DETALLEVENTA_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "sales", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<IList<IDetalleVenta>> GetAllDetalles(IVenta venta)
        {
            try
            {
                IList<IDetalleVenta> detallesventa = new List<IDetalleVenta>();
                SqlParameter[] parameters = {
                    new SqlParameter("@idVenta", venta.ID)
                };
                var tabla = await _db.ReadStoredProcedure("DETALLEVENTA_GET_ALL", parameters);

                foreach (DataRow registro in tabla.Rows)
                {
                    var categoria = new BE.Categoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        Nombre = registro["Categoria_Nombre"].ToString()
                    };
                    var producto = new BE.Producto(categoria)
                    {
                        ID = int.Parse(registro["idProducto"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        PrecioUnitario = double.Parse(registro["PrecioUnitario"].ToString()),
                        CantidadDepositos = int.Parse(registro["CantidadDepositos"].ToString()),
                        CantidadExhibidores = int.Parse(registro["CantidadExhibidores"].ToString()),
                        AdvertenciaBajoStock = int.Parse(registro["AdvertenciaBajoStock"].ToString()),
                        EstadoActivo = (bool)registro["Activo"],
                        DVH = (byte[])registro["dv"]
                    };
                    var detalleventa = new BE.DetalleVenta(producto)
                    {
                        Cantidad = int.Parse(registro["Cantidad"].ToString()),
                        Importe = double.Parse(registro["Importe"].ToString())
                    };

                    detallesventa.Add(detalleventa);
                }
                return detallesventa;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "sales", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
