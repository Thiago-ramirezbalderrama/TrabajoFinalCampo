using System.Collections.Generic;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BLL
{
    public class Backups : Abstracciones.BL.IBackups
    {
        private readonly Abstracciones.DAL.IBackups _backupsData;
        private readonly Abstracciones.BL.IBitacora _bitacora;

        public Backups(Abstracciones.DAL.IBackups backupsData = null, Abstracciones.BL.IBitacora bitacora = null)
        {
            _backupsData = backupsData ?? new DAL.BackupsDAL();
            _bitacora = bitacora ?? new BLL.Bitacora();
        }

        public async Task Create(IBackup backup)
        {
            Servicios.PermisosAdmin.CheckPermission("backupsMANAGE");
            await _backupsData.Create(backup);
            await _bitacora.LogInformation("successful_addition", "backup", "");
        }

        public async Task<IList<IBackup>> GetAll()
        {
            Servicios.PermisosAdmin.CheckPermission("backupsMANAGE");
            return await _backupsData.GetAll();
        }

        public async Task Restore(IBackup backup)
        {
            Servicios.PermisosAdmin.CheckPermission("backupsMANAGE");
            await _backupsData.Restore(backup);
            await _bitacora.LogInformation("data_restored_from_a_backup", "backup", "");
        }
    }
}
