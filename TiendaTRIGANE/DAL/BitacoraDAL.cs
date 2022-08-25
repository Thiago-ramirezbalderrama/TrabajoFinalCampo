using System;
using System.Collections.Generic;
using Abstracciones.DAL;
using Abstracciones.Entities.Traductor;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Win32;
using Newtonsoft.Json;

namespace DAL
{
    public class BitacoraDAL : IBitacoraDAL
    {
        private readonly IAccesoDB _db;

        public BitacoraDAL(IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        private void SaveToDisk(object obj)
        {
            string downloadPath = Registry.GetValue(@"HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "{374DE290-123F-4565-9164-39C4925E467B}", String.Empty).ToString();
            string pathToSave = downloadPath + @"\Supermercado\Errores";
            var direc = Directory.CreateDirectory(pathToSave);
            File.WriteAllText(pathToSave + $"\\${Guid.NewGuid()}.json", JsonConvert.SerializeObject(obj, Formatting.Indented));
        }

        private async Task Create(Abstracciones.Entities.IEventoBitacora eventoBitacora)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@Severidad", eventoBitacora.Severidad.NombrePalabra),
                    new SqlParameter("@DNIEmpleado", eventoBitacora.Empleado.DNI),
                    new SqlParameter("@Fecha", eventoBitacora.Fecha),
                    new SqlParameter("@Actividad", eventoBitacora.Actividad.NombrePalabra),
                    new SqlParameter("@TipoEntidad", eventoBitacora.TipoEntidad.NombrePalabra),
                    new SqlParameter("@InfoAsociada", eventoBitacora.InfoAsociada)
                };
                await _db.WriteStoredProcedure("EVENTOBITACORA_CREATE", parameters);
            }
            catch (Exception ex)
            {
                SaveToDisk(ex);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task LogInformation(string actividad, string tipoEntidad, string infoAsociada)
        {
            if(actividad != "correct_login")
            {
                await Create(new BE.EventoBitacora
                {
                    Severidad = new BE.Palabra { NombrePalabra = "information" },
                    Empleado = Servicios.SesionAdmin.GetInstance.Empleado,
                    Fecha = DateTime.Now,
                    Actividad = new BE.Palabra { NombrePalabra = actividad },
                    TipoEntidad = new BE.Palabra { NombrePalabra = tipoEntidad },
                    InfoAsociada = infoAsociada
                });
            }
        }

        public async Task LogWarning(string actividad, string tipoEntidad, string infoAsociada)
        {
            await Create(new BE.EventoBitacora
            {
                Severidad = new BE.Palabra { NombrePalabra = "warning" },
                Empleado = Servicios.SesionAdmin.GetInstance.Empleado,
                Fecha = DateTime.Now,
                Actividad = new BE.Palabra { NombrePalabra = actividad },
                TipoEntidad = new BE.Palabra { NombrePalabra = tipoEntidad },
                InfoAsociada = infoAsociada
            });
        }

        public async Task LogError(string actividad, string tipoEntidad, string infoAsociada)
        {
            try
            {
                var bitacora = new BE.EventoBitacora
                {
                    Severidad = new BE.Palabra { NombrePalabra = "error" },
                    Empleado = Servicios.SesionAdmin.GetInstance.Empleado,
                    Fecha = DateTime.Now,
                    Actividad = new BE.Palabra { NombrePalabra = actividad },
                    TipoEntidad = new BE.Palabra { NombrePalabra = tipoEntidad },
                    InfoAsociada = infoAsociada
                };
                await Create(bitacora);
                SaveToDisk(bitacora);
            }
            catch (Exception ex)
            {
                SaveToDisk(ex);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.IEventoBitacora>> GetAll()
        {
            IList<Abstracciones.Entities.IEventoBitacora> eventosBitacora = new List<Abstracciones.Entities.IEventoBitacora>();
            var tabla = await _db.ReadStoredProcedure("EVENTOBITACORA_GET_ALL", null);

            foreach (DataRow registro in tabla.Rows)
            {
                var rol = new BE.Rol
                {
                    ID = int.Parse(registro["idRol"].ToString()),
                    Nombre = registro["Rol_Nombre"].ToString(),
                    AdministradorSistema = bool.Parse(registro["Rol_AdministradorDelSistema"].ToString())
                };
                var empleado = new BE.Empleado(rol)
                {
                    DNI = int.Parse(registro["DNI"].ToString()),
                    Nombre = registro["Nombre"].ToString(),
                    Apellido = registro["Apellido"].ToString(),
                    FechaNacimiento = DateTime.Parse(registro["FechaNacimiento"].ToString()),
                    Email = registro["Email"].ToString()
                };
                if (!registro.IsNull("idIdioma"))
                {
                    empleado.Idioma = new BE.Idioma
                    {
                        ID = int.Parse(registro["idIdioma"].ToString()),
                        Nombre = registro["Idioma_Nombre"].ToString(),
                        MostrarPorDefecto = bool.Parse(registro["Idioma_Default"].ToString()),
                        Habilitado = bool.Parse(registro["Idioma_Habilitado"].ToString())
                    };
                }

                var evento = new BE.EventoBitacora
                {
                    ID = int.Parse(registro["idEventoBitacora"].ToString()),
                    Severidad = new BE.Palabra
                    {
                        NombrePalabra = registro["Severidad"].ToString()
                    },
                    Empleado = empleado,
                    Fecha = DateTime.Parse(registro["Fecha"].ToString()),
                    Actividad = new BE.Palabra
                    {
                        NombrePalabra = registro["Actividad"].ToString()
                    },
                    InfoAsociada = registro["InfoAsociada"].ToString()
                };

                if (!registro.IsNull("TipoEntidad"))
                {
                    evento.TipoEntidad = new BE.Palabra
                    {
                        NombrePalabra = registro["TipoEntidad"].ToString()
                    };
                }
                eventosBitacora.Add(evento);
            }
            return eventosBitacora;
        }

        public async Task<IList<IPalabra>> GetSeverityLevels()
        {
            var severidades = new List<IPalabra>();
            var tabla = await _db.ReadStoredProcedure("SEVERIDAD_GET_ALL", null);

            foreach (DataRow registro in tabla.Rows)
            {
                var severidad = new BE.Palabra
                {
                    NombrePalabra = registro["Severidad"].ToString()
                };
                severidades.Add(severidad);
            }
            return severidades;
        }
    }
}
