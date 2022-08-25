using System.Collections.Generic;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IBitacora : IReadable<Entities.IEventoBitacora>
    {
        Task LogInformation(string actividad, string tipoEntidad, string infoAsociada);

        Task LogWarning(string actividad, string tipoEntidad, string infoAsociada);

        Task LogError(string actividad, string tipoEntidad, string infoAsociada);

        Task<IList<Entities.Traductor.IPalabra>> GetSeverityLevels();
    }
}
