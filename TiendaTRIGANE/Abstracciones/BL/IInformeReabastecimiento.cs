using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IInformeReabastecimiento : IReadable<Entities.IInformeReabastecimiento>
    {
        Task CrearSolicitud(Entities.IInformeReabastecimiento informe, IList<Entities.IDetalle> detalles);

        Task TerminarSolicitud(Entities.IInformeReabastecimiento informe);
    }
}
