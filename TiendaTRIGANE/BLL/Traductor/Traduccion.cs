using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Traduccion : Abstracciones.BL.Traductor.ITraduccion
    {
        private readonly Abstracciones.DAL.Traductor.ITraduccion _traduccionData;

        public Traduccion(Abstracciones.DAL.Traductor.ITraduccion traduccionData = null)
        {
            _traduccionData = traduccionData ?? new DAL.Traduccion();
        }

        public async Task<Dictionary<string, Abstracciones.Entities.Traductor.ITraduccion>> GetAll(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            return await _traduccionData.GetAll(idioma);
        }

        public async Task<IList<Abstracciones.Entities.Traductor.ITraduccion>> GetAllFromLanguages()
        {
            Servicios.PermisosAdmin.CheckPermission("translationsREAD");
            return await _traduccionData.GetAllFromAllLanguages();
        }

        public async Task Update(Abstracciones.Entities.Traductor.ITraduccion traduccion)
        {
            Servicios.PermisosAdmin.CheckPermission("translationsMANAGE");
            await _traduccionData.Update(traduccion);
        }
    }
}
