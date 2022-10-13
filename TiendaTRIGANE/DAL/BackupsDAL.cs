using Abstracciones.DAL;
using Abstracciones.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace DAL
{
    public class BackupsDAL : IBackups
    {
        private readonly IAccesoDB _db;
        private readonly IBitacoraDAL _bitacora;
        private readonly string backupsPath = @"D:\TiendaTRIGANE backups\";

        public BackupsDAL(IAccesoDB db = null, IBitacoraDAL bitacora = null)
        {
            _db = db ?? new ConexionDAL();
            _bitacora = bitacora ?? new BitacoraDAL();
        }

        public async Task Create(IBackup backup)
        {
            try
            {
                var backups = await GetAll();
                backup.ID = backups.Count > 0 ? backups.First().ID + 1 : 1; //no es identidad. se usa el first() en lugar de last() porque se trae los registros ordenados por fecha en orden descendiente
                SqlParameter[] parameters = {
                    new SqlParameter("@idBackup", backup.ID),
                    new SqlParameter("@DNI_Empleado", backup.Empleado.DNI),
                    new SqlParameter("@Fecha", backup.Fecha),
                    new SqlParameter("@SystemPath", backupsPath),
                };
                await _db.WriteStoredProcedure("BACKUP_CREATE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "backup", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<IBackup>> GetAll()
        {
            try
            {
                var backups = new List<IBackup>();
                var tabla = await _db.ReadStoredProcedure("BACKUP_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var rolEmpleado = new BE.Rol
                    {
                        ID = int.Parse(registro["Empleado_Rol_idRol"].ToString()),
                        Nombre = registro["Empleado_Rol_Nombre"].ToString(),
                        AdministradorSistema = bool.Parse(registro["Empleado_Rol_AdministradorDelSistema"].ToString())
                    };
                    var empleado = new BE.Empleado(rolEmpleado)
                    {
                        DNI = int.Parse(registro["Empleado_DNI"].ToString()),
                        Nombre = registro["Empleado_Nombre"].ToString(),
                        Apellido = registro["Empleado_Apellido"].ToString(),
                        FechaNacimiento = DateTime.Parse(registro["Empleado_FechaNacimiento"].ToString()),
                        Email = registro["Empleado_Email"].ToString()
                    };

                    var backup = new BE.Backup()
                    {
                        ID = int.Parse(registro["idBackup"].ToString()),
                        Empleado = empleado,
                        Fecha = DateTime.Parse(registro["Fecha"].ToString())
                    };
                    backups.Add(backup);
                }
                return backups;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "backup", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        private async Task<bool> CheckIfBackupExists(IBackup backup)
        {
            try
            {
                var Existe = new SqlParameter("@Existe", SqlDbType.Bit)
                {
                    Direction = ParameterDirection.Output
                };
                SqlParameter[] parameters = {
                    new SqlParameter("@idBackup", backup.ID),
                    Existe
                };
                await _db.ReadStoredProcedure("BACKUP_CHECK_IF_IT_EXISTS", parameters);
                return bool.Parse(Existe.Value.ToString());
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "backup", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Restore(IBackup backup)
        {
            try
            {
                if (!await CheckIfBackupExists(backup))
                {
                    await _bitacora.LogError("error", "backup", $"Backup {backup.Fecha}:  no fue encontrado");
                    throw new Servicios.Excepciones.BackupNotFoundException();
                }

                string query = @"
                DECLARE @TablaAntesDelRestore TABLE(idBackup INT,Fecha datetime, DNI_Empleado int, SystemPath nvarchar(260));
                INSERT INTO @TablaAntesDelRestore(idBackup, Fecha, DNI_Empleado, SystemPath)
                SELECT idBackup, Fecha, DNI_Empleado, SystemPath FROM Backups;
                declare @backup_path nvarchar(260) = (select top (1) SystemPath from Backups where idBackup = @idBackup)
                USE [master];
	            ALTER DATABASE TiendaTRIGANE SET SINGLE_USER WITH ROLLBACK IMMEDIATE; --si hay conexiones abiertas no se puede hacer el restore
	            RESTORE DATABASE TiendaTRIGANE FROM DISK =  @backup_path  WITH REPLACE;
	            ALTER DATABASE TiendaTRIGANE SET MULTI_USER; -- restaurar acceso de multiples usuarios
	            USE [TiendaTRIGANE];
                delete from Backups
	            insert into Backups (idBackup, Fecha, DNI_Empleado,SystemPath)
	            SELECT idBackup, Fecha, DNI_Empleado, SystemPath FROM @TablaAntesDelRestore";

                using (SqlConnection connection = new SqlConnection(_db.conexionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@idBackup", backup.ID);
                    connection.Open();

                    await command.ExecuteNonQueryAsync();
                }
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "backup", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
