using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IBitacoraDAL : IReadable<Entities.IEventoBitacora>
    {
        Task LogInformation(string actividad, string tipoEntidad, string infoAsociada);

        Task LogWarning(string actividad, string tipoEntidad, string infoAsociada);

        Task LogError(string actividad, string tipoEntidad, string infoAsociada);

        Task<IList<Entities.Traductor.IPalabra>> GetSeverityLevels();
    }
}
