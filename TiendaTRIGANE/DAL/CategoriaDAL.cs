using Abstracciones.DAL;
using Abstracciones.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;

namespace DAL
{
    public class CategoriaDAL : Abstracciones.DAL.ICategoria
    {
        private readonly IAccesoDB _db;

        public CategoriaDAL(IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        public async Task Create(Abstracciones.Entities.ICategoria categoria)
        {
            try
            {
                categoria.EstadoActivo = true;
                var idReturnValue = new SqlParameter("@idCategoria", SqlDbType.Int)
                {
                    Direction = ParameterDirection.Output
                };

                SqlParameter[] parametersCategoriaCreate = {
                    idReturnValue,
                    new SqlParameter("@Nombre", categoria.Nombre),
                    new SqlParameter("@PorcentajeDescuento", categoria.PorcentajeDescuento),
                    new SqlParameter("@Perecedera", categoria.Perecedera),
                    new SqlParameter("@Activo", categoria.EstadoActivo)
                };
                await _db.WriteStoredProcedure("CATEGORIA_CREATE", parametersCategoriaCreate);
                categoria.ID = int.Parse(idReturnValue.Value.ToString());

                var tipoCambio = new BE.Palabra
                {
                    NombrePalabra = "addition"
                };
                await CreateSnapshot(categoria, tipoCambio);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task CreateSnapshot(Abstracciones.Entities.ICategoria categoria, Abstracciones.Entities.Traductor.IPalabra tipoCambio)
        {
            try
            {
                SqlParameter[] parametersCategoriaCreateSnapshot = {
                    new SqlParameter("@idCategoria", categoria.ID),
                    new SqlParameter("@Nombre", categoria.Nombre),
                    new SqlParameter("@PorcentajeDescuento", categoria.PorcentajeDescuento),
                    new SqlParameter("@Perecedera", categoria.Perecedera),
                    new SqlParameter("@DNIEmpleadoCambio", Servicios.SesionAdmin.GetInstance.Empleado.DNI),
                    new SqlParameter("@TipoCambio", tipoCambio.NombrePalabra),
                    new SqlParameter("@FechaCambio", DateTime.Now)
                };
                await _db.WriteStoredProcedure("CATEGORIA_CREATE_CHANGE", parametersCategoriaCreateSnapshot);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Delete(Abstracciones.Entities.ICategoria categoria)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@idCategoria", categoria.ID) };
                await _db.WriteStoredProcedure("CATEGORIA_DELETE", parameters);

                Abstracciones.Entities.Traductor.IPalabra tipoCambio = new BE.Palabra
                {
                    NombrePalabra = "deletion"
                };
                await CreateSnapshot(categoria, tipoCambio);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(Abstracciones.Entities.ICategoria categoria)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idCategoria", categoria.ID),
                    new SqlParameter("@Nombre", categoria.Nombre),
                    new SqlParameter("@PorcentajeDescuento", categoria.PorcentajeDescuento),
                    new SqlParameter("@Perecedera", categoria.Perecedera)
                };

                await _db.WriteStoredProcedure("CATEGORIA_UPDATE", parameters);

                var tipoCambio = new BE.Palabra
                {
                    NombrePalabra = "updation"
                };
                await CreateSnapshot(categoria, tipoCambio);
            }
            catch (SqlException ex) when (ex.Errors.Count > 0 && ex.Errors[0].Number == 2627)
            {
                throw new Servicios.Excepciones.ItemAlreadyExistsException();
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.ICategoria>> GetAll()
        {
            try
            {
                IList<Abstracciones.Entities.ICategoria> categorias = new List<Abstracciones.Entities.ICategoria>();
                var tabla = await _db.ReadStoredProcedure("CATEGORIA_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var categoria = new BE.Categoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        Perecedera = bool.Parse(registro["Perecedera"].ToString()),
                        PorcentajeDescuento = byte.Parse(registro["PorcentajeDescuento"].ToString()),
                    };
                    categorias.Add(categoria);
                }
                return categorias;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<ICambioCategoria>> GetAllChanges(Abstracciones.Entities.ICategoria categoria)
        {
            try
            {
                IList<ICambioCategoria> cambios = new List<ICambioCategoria>();
                SqlParameter[] parameters = {
                    new SqlParameter("@idCategoria", categoria.ID)
                };
                var tabla = await _db.ReadStoredProcedure("CATEGORIA_GET_ALL_CHANGES", parameters);

                foreach (DataRow registro in tabla.Rows)
                {
                    var Categoria = new BE.Categoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        PorcentajeDescuento = byte.Parse(registro["PorcentajeDescuento"].ToString()),
                        Perecedera = bool.Parse(registro["Perecedera"].ToString())
                    };

                    var RolEmpleadoCambio = new BE.Rol
                    {
                        ID = int.Parse(registro["Empleado_Cambio_Rol_idRol"].ToString()),
                        Nombre = registro["Empleado_Cambio_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["Empleado_Cambio_Rol_AdministradorDelSistema"].ToString())
                    };
                    var EmpleadoCambio = new BE.Empleado(RolEmpleadoCambio)
                    {
                        DNI = int.Parse(registro["Empleado_Cambio_DNI"].ToString()),
                        Nombre = registro["Empleado_Cambio_Nombre"].ToString(),
                        Apellido = registro["Empleado_Cambio_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Empleado_Cambio_FechaNacimiento"].ToString()),
                        Email = registro["Empleado_Cambio_Email"].ToString(),
                        Telefono = registro["Empleado_Cambio_Telefono"].ToString()
                    };

                    var historialCambios = new BE.CambioCategoria
                    {
                        ID = int.Parse(registro["idCategoria"].ToString()),
                        EstadoCategoria = Categoria,
                        EmpleadoCambio = EmpleadoCambio,
                        TipoCambio = new BE.Palabra
                        {
                            NombrePalabra = registro["TipoCambio"].ToString()
                        },
                        FechaCambio = DateTime.Parse(registro["FechaCambio"].ToString())
                    };
                    cambios.Add(historialCambios);
                }
                return cambios;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
