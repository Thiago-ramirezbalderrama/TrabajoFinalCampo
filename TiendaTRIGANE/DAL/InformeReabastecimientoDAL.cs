using System;
using System.Collections.Generic;
using Abstracciones.Entities;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class InformeReabastecimientoDAL : Abstracciones.DAL.IInformeReabastecimiento
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;

        public InformeReabastecimientoDAL(Abstracciones.DAL.IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        public async Task Create(IInformeReabastecimiento informeReabastecimiento)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@DNI_Proveedor", informeReabastecimiento.Proveedor.DNI),
                    new SqlParameter("@DNI_EmpleadoSolicitante", informeReabastecimiento.EmpleadoSolicitante.DNI),
                    new SqlParameter("@FechaSolicitud", informeReabastecimiento.FechaSolicitud),
                    new SqlParameter("@FechaEntregaAcordada", informeReabastecimiento.FechaEntregaAcordada),
                    new SqlParameter("@ComentarioSolicitud", informeReabastecimiento.ComentarioSolicitud),
                    new SqlParameter("@SolicitudTerminada", informeReabastecimiento.SolicitudTerminada)
                };
                await _db.WriteStoredProcedure("INFORMEREABASTECIMIENTO_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(IInformeReabastecimiento informeReabastecimiento)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idInformeReabastecimiento", informeReabastecimiento.ID),
                    new SqlParameter("@DNI_Proveedor", informeReabastecimiento.Proveedor.DNI),
                    new SqlParameter("@DNI_EmpleadoSolicitante", informeReabastecimiento.EmpleadoSolicitante.DNI),
                    new SqlParameter("@DNI_EmpleadoReceptor", informeReabastecimiento.EmpleadoReceptor.DNI),
                    new SqlParameter("@FechaSolicitud", informeReabastecimiento.FechaSolicitud),
                    new SqlParameter("@FechaEntregaAcordada", informeReabastecimiento.FechaEntregaAcordada),
                    new SqlParameter("@FechaEntregaReal", informeReabastecimiento.FechaEntregaReal),
                    new SqlParameter("@ComentarioSolicitud", informeReabastecimiento.ComentarioSolicitud),
                    new SqlParameter("@ComentarioEntrega", informeReabastecimiento.ComentarioEntrega),
                    new SqlParameter("@SolicitudTerminada", informeReabastecimiento.SolicitudTerminada),
                    new SqlParameter("@EntregaAceptada", informeReabastecimiento.EntregaAceptada)
                };
                await _db.WriteStoredProcedure("INFORMEREABASTECIMIENTO_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Delete(IInformeReabastecimiento informeReabastecimiento)
        {
            try
            {
                SqlParameter[] parameters = {
                new SqlParameter("@idInformeReabastecimiento", informeReabastecimiento.ID)
            };
                await _db.WriteStoredProcedure("INFORMEREABASTECIMIENTO_DELETE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<IInformeReabastecimiento>> GetAll()
        {
            try
            {
                var informes = new List<IInformeReabastecimiento>();
                var tabla = await _db.ReadStoredProcedure("INFORMEREABASTECIMIENTO_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    #region Proveedor

                    var categoriaProveedor = new BE.Categoria
                    {
                        ID = int.Parse(registro["Proveedor_Categoria_ID"].ToString()),
                        Nombre = registro["Proveedor_Categoria_Nombre"].ToString()
                    };
                    var proveedor = new BE.Proveedor(categoriaProveedor)
                    {
                        DNI = int.Parse(registro["Proveedor_DNI"].ToString()),
                        Nombre = registro["Proveedor_Nombre"].ToString(),
                        Apellido = registro["Proveedor_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Proveedor_FechaNacimiento"].ToString()),
                        Email = registro["Proveedor_Email"].ToString()
                    };

                    #endregion Proveedor

                    #region EmpleadoSolicitante

                    var rolEmpleadoSolicitante = new BE.Rol
                    {
                        ID = int.Parse(registro["EmpleadoSolicitante_Rol_idRol"].ToString()),
                        Nombre = registro["EmpleadoSolicitante_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["EmpleadoSolicitante_Rol_AdministradorDELSistema"].ToString())
                    };
                    var empleadoSolicitante = new BE.Empleado(rolEmpleadoSolicitante)
                    {
                        DNI = int.Parse(registro["EmpleadoSolicitante_DNI"].ToString()),
                        Nombre = registro["EmpleadoSolicitante_Nombre"].ToString(),
                        Apellido = registro["EmpleadoSolicitante_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["EmpleadoSolicitante_FechaNacimiento"].ToString()),
                        Email = registro["EmpleadoSolicitante_Email"].ToString()
                    };

                    #endregion EmpleadoSolicitante

                    #region EmpleadoReceptor

                    BE.Empleado empleadoReceptor = null;
                    var solicitudTerminada = bool.Parse(registro["SolicitudTerminada"].ToString());
                    if (solicitudTerminada)
                    {
                        var rolEmpleadoReceptor = new BE.Rol
                        {
                            ID = int.Parse(registro["EmpleadoReceptor_Rol_idRol"].ToString()),
                            Nombre = registro["EmpleadoReceptor_Rol_Nombre"].ToString(),
                            AdministradorSistema = bool.Parse(registro["EmpleadoReceptor_Rol_AdministradordelSistema"].ToString())
                        };
                        empleadoReceptor = new BE.Empleado(rolEmpleadoReceptor)
                        {
                            DNI = int.Parse(registro["EmpleadoReceptor_DNI"].ToString()),
                            Nombre = registro["EmpleadoReceptor_Nombre"].ToString(),
                            Apellido = registro["EmpleadoReceptor_Apellido"].ToString(),
                            FechaNacimiento = DateTime.Parse(registro["EmpleadoReceptor_FechaNacimiento"].ToString()),
                            Email = registro["EmpleadoReceptor_Email"].ToString()
                        };
                    }

                    #endregion EmpleadoReceptor

                    var informe = new BE.InformeReabastecimiento(proveedor, empleadoSolicitante)
                    {
                        ID = int.Parse(registro["idInformeReabastecimiento"].ToString()),
                        FechaSolicitud = DateTime.Parse(registro["FechaSolicitud"].ToString()),
                        FechaEntregaAcordada = DateTime.Parse(registro["FechaEntregaAcordada"].ToString()),
                        ComentarioSolicitud = registro["ComentarioSolicitud"].ToString(),
                        SolicitudTerminada = solicitudTerminada
                    };
                    if (informe.SolicitudTerminada)
                    {
                        informe.EntregaAceptada = bool.Parse(registro["EntregaAceptada"].ToString());
                        informe.ComentarioEntrega = registro["ComentarioEntrega"].ToString();
                        informe.FechaEntregaReal = DateTime.Parse(registro["FechaEntregaReal"].ToString());
                        informe.EmpleadoReceptor = empleadoReceptor;
                        if (informe.EntregaAceptada)
                        {
                            var detallesEntrega = await GetAllDetallesEntrega(informe);
                            foreach (var detalle in detallesEntrega)
                            {
                                informe.AgregarDetalleEntrega(detalle);
                            }
                        }
                    }
                    var detallesSolicitud = await GetAllDetallesSolicitud(informe);
                    foreach (var detalleSolicitud in detallesSolicitud)
                    {
                        informe.AgregarDetalleSolicitud(detalleSolicitud);
                    }

                    informes.Add(informe);
                }
                return informes;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IInformeReabastecimiento> GetUltimoPorEmpleadoSolicitante(IEmpleado empleado)
        {
            try
            {
                IList<IInformeReabastecimiento> informes = new List<IInformeReabastecimiento>();
                SqlParameter[] parameters =
                {
                new SqlParameter("@DNI", empleado.DNI)
            };
                var tabla = await _db.ReadStoredProcedure("INFORMEREABASTECIMIENTO_GET_LATEST_BY_REQUESTING_EMPLOYEE", parameters);

                foreach (DataRow registro in tabla.Rows)
                {
                    #region Proveedor

                    var categoriaProveedor = new BE.Categoria
                    {
                        ID = int.Parse(registro["Proveedor_Categoria_ID"].ToString()),
                        Nombre = registro["Proveedor_Categoria_Nombre"].ToString()
                    };
                    var proveedor = new BE.Proveedor(categoriaProveedor)
                    {
                        DNI = int.Parse(registro["Proveedor_DNI"].ToString()),
                        Nombre = registro["Proveedor_Nombre"].ToString(),
                        Apellido = registro["Proveedor_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Proveedor_FechaNacimiento"].ToString()),
                        Email = registro["Proveedor_Email"].ToString()
                    };

                    #endregion Proveedor

                    #region EmpleadoSolicitante

                    var rolEmpleadoSolicitante = new BE.Rol
                    {
                        ID = int.Parse(registro["EmpleadoSolicitante_Rol_idRol"].ToString()),
                        Nombre = registro["EmpleadoSolicitante_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["EmpleadoSolicitante_Rol_AdministradordelSistema"].ToString())
                    };
                    var empleadoSolicitante = new BE.Empleado(rolEmpleadoSolicitante)
                    {
                        DNI = int.Parse(registro["EmpleadoSolicitante_DNI"].ToString()),
                        Nombre = registro["EmpleadoSolicitante_Nombre"].ToString(),
                        Apellido = registro["EmpleadoSolicitante_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["EmpleadoSolicitante_FechaNacimiento"].ToString()),
                        Email = registro["EmpleadoSolicitante_Email"].ToString()
                    };

                    #endregion EmpleadoSolicitante

                    #region EmpleadoReceptor

                    BE.Empleado empleadoReceptor = null;
                    var solicitudTerminada = bool.Parse(registro["SolicitudTerminada"].ToString());
                    if (solicitudTerminada)
                    {
                        var rolEmpleadoReceptor = new BE.Rol
                        {
                            ID = int.Parse(registro["EmpleadoReceptor_Rol_idRol"].ToString()),
                            Nombre = registro["EmpleadoReceptor_Rol_Nombre"].ToString(),
                            AdministradorSistema = bool.Parse(registro["EmpleadoReceptor_Rol_AdministradordelSistema"].ToString())
                        };
                        empleadoReceptor = new BE.Empleado(rolEmpleadoReceptor)
                        {
                            DNI = int.Parse(registro["EmpleadoReceptor_DNI"].ToString()),
                            Nombre = registro["EmpleadoReceptor_Nombre"].ToString(),
                            Apellido = registro["EmpleadoReceptor_Apellido"].ToString(),
                            FechaNacimiento = DateTime.Parse(registro["EmpleadoReceptor_FechaNacimiento"].ToString()),
                            Email = registro["EmpleadoReceptor_Email"].ToString()
                        };
                    }

                    #endregion EmpleadoReceptor

                    var informe = new BE.InformeReabastecimiento(proveedor, empleadoSolicitante)
                    {
                        ID = int.Parse(registro["idInformeReabastecimiento"].ToString()),
                        FechaSolicitud = DateTime.Parse(registro["FechaSolicitud"].ToString()),
                        FechaEntregaAcordada = DateTime.Parse(registro["FechaEntregaAcordada"].ToString()),
                        ComentarioSolicitud = registro["ComentarioSolicitud"].ToString(),
                        SolicitudTerminada = solicitudTerminada
                    };
                    if (informe.SolicitudTerminada)
                    {
                        informe.EntregaAceptada = bool.Parse(registro["EntregaAceptada"].ToString());
                        informe.ComentarioEntrega = registro["ComentarioEntrega"].ToString();
                        informe.FechaEntregaReal = DateTime.Parse(registro["FechaEntregaReal"].ToString());
                        informe.EmpleadoReceptor = empleadoReceptor;
                        if (informe.EntregaAceptada)
                        {
                            var detallesEntrega = await GetAllDetallesEntrega(informe);
                            foreach (BE.Detalle detalle in detallesEntrega)
                            {
                                informe.AgregarDetalleEntrega(detalle);
                            }
                        }
                    }
                    var detallesSolicitud = await GetAllDetallesSolicitud(informe);
                    foreach (BE.Detalle detalleSolicitud in detallesSolicitud)
                    {
                        informe.AgregarDetalleSolicitud(detalleSolicitud);
                    }

                    informes.Add(informe);
                }
                return informes[0] ?? null;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task CreateDetalleSolicitud(IInformeReabastecimiento informeReabastecimiento, IDetalle detalleInformeEntrega)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idInformeReabastecimiento", informeReabastecimiento.ID),
                    new SqlParameter("@idProducto", detalleInformeEntrega.Producto.ID),
                    new SqlParameter("@Cantidad", detalleInformeEntrega.Cantidad)
                };
                await _db.WriteStoredProcedure("DETALLE_SOLICITUD_REABASTECIMIENTO_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<IList<IDetalle>> GetAllDetallesSolicitud(IInformeReabastecimiento informeReabastecimiento)
        {
            try
            {
                IList<IDetalle> detallesInformeEntrega = new List<IDetalle>();
                SqlParameter[] parameters = {
                    new SqlParameter("@idInformeReabastecimiento", informeReabastecimiento.ID)
                };
                var tabla = await _db.ReadStoredProcedure("DETALLE_SOLICITUD_REABASTECIMIENTO_GET_ALL", parameters);

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
                        CantidadExhibidores = int.Parse(registro["CantidadExhibidores"].ToString())
                    };
                    var detalleInformeEntrega = new BE.Detalle(producto)
                    {
                        //ID = int.Parse(registro["idDetalleSolicitudReabastecimiento"].ToString()),
                        Cantidad = int.Parse(registro["Cantidad"].ToString())
                    };
                    detallesInformeEntrega.Add(detalleInformeEntrega);
                }
                return detallesInformeEntrega;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task CreateDetalleEntrega(IInformeReabastecimiento informeReabastecimiento, IDetalle detalleInformeEntrega)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idInformeReabastecimiento", informeReabastecimiento.ID),
                    new SqlParameter("@idProducto", detalleInformeEntrega.Producto.ID),
                    new SqlParameter("@Cantidad", detalleInformeEntrega.Cantidad)
                };
                await _db.WriteStoredProcedure("DETALLE_ENTREGA_REABASTECIMIENTO_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<IList<IDetalle>> GetAllDetallesEntrega(IInformeReabastecimiento informeReabastecimiento)
        {
            try
            {
                IList<IDetalle> detallesInformeEntrega = new List<IDetalle>();
                SqlParameter[] parameters = {
                new SqlParameter("@idInformeReabastecimiento", informeReabastecimiento.ID)
            };
                var tabla = await _db.ReadStoredProcedure("DETALLE_ENTREGA_REABASTECIMIENTO_GET_ALL", parameters);

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
                        CantidadExhibidores = int.Parse(registro["CantidadExhibidores"].ToString())
                    };
                    var detalleInformeEntrega = new BE.Detalle(producto)
                    {
                        //ID = int.Parse(registro["idDetalleEntregaReabastecimiento"].ToString()),
                        Cantidad = int.Parse(registro["Cantidad"].ToString())
                    };
                    detallesInformeEntrega.Add(detalleInformeEntrega);
                }
                return detallesInformeEntrega;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
