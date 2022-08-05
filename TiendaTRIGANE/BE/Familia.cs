using Abstracciones.Entities;
using System.Collections.Generic;

namespace BE
{
    public class Familia : EntidadPersistente, IFamilia
    {

        public Familia()
        {
            _hijos = new List<IPermiso>();
            _hijosFamilia = new List<IFamilia>();
        }

        private readonly List<IPermiso> _hijos;
        private readonly List<IFamilia> _hijosFamilia;

        public string NombreFamilia { get; set; }
        public IList<IFamilia> hijos { get; set; }

        public void AgregarFamiliaHija(IFamilia familia)
        {
            _hijosFamilia.Add(familia);
        }

        public void AgregarPermiso(IPermiso permiso)
        {
            _hijos.Add(permiso);
        }
    }
}
