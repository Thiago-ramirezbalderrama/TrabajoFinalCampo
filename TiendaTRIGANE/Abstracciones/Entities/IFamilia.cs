
using System.Collections.Generic;

namespace Abstracciones.Entities
{
    public interface IFamilia : IEntidadPersistente
    {
        string NombreFamilia { get; set; }

        IList<IFamilia> hijos { get; set; }
        //Traductor.IPalabra Descripcion { get; set; }

        void AgregarFamiliaHija(IFamilia familia);

        void AgregarPermiso(IPermiso permiso);
    }
}
