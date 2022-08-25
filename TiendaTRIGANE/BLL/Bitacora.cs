using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abstracciones.BL;
using Abstracciones.Entities.Traductor;

namespace BLL
{
    public class Bitacora : IBitacora
    {
        private readonly Abstracciones.DAL.IBitacoraDAL _eventoBitacoraData;

        public Bitacora(Abstracciones.DAL.IBitacoraDAL eventoBitacoraData = null)
        {
            _eventoBitacoraData = eventoBitacoraData ?? new DAL.BitacoraDAL();
        }

        public async Task LogInformation(string actividad, string tipoEntidad, string infoAsociada)
        {
            if (Servicios.SesionAdmin.LogEvents)
            {
                await _eventoBitacoraData.LogInformation(actividad, tipoEntidad, infoAsociada);
            }
        }

        public async Task LogWarning(string actividad, string tipoEntidad, string infoAsociada)
        {
            if (Servicios.SesionAdmin.LogEvents)
            {
                await _eventoBitacoraData.LogWarning(actividad, tipoEntidad, infoAsociada);
            }
        }

        public async Task LogError(string actividad, string tipoEntidad, string infoAsociada)
        {
            if (Servicios.SesionAdmin.LogEvents)
            {
                await _eventoBitacoraData.LogError(actividad, tipoEntidad, infoAsociada);
            }
        }

        public async Task<IList<Abstracciones.Entities.IEventoBitacora>> GetAll()
        {
            //Service.PermissionManager.CheckPermission("logsREAD");
            return await _eventoBitacoraData.GetAll();
        }

        public async Task<IList<IPalabra>> GetSeverityLevels()
        {
            return await _eventoBitacoraData.GetSeverityLevels();
        }
    }
}
