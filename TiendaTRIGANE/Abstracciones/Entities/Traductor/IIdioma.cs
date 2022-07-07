using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.Entities.Traductor
{
    public interface IIdioma : IEntidadPersistente
    {
        string Nombre { get; set; }
        bool MostrarPorDefecto { get; set; }
        bool Habilitado { get; set; }
    }
}
