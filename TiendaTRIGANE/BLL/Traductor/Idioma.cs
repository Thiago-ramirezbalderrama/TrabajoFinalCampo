using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Idioma : Abstracciones.BL.Traductor.IIdioma
    {
        private readonly Abstracciones.DAL.Traductor.IIdioma _idiomaData;
        private readonly Abstracciones.DAL.IEmpleado _empleadoData;

        public Idioma(
            Abstracciones.DAL.Traductor.IIdioma idiomaData = null,
            Abstracciones.DAL.IEmpleado empleadoData = null
            )
        {
            _idiomaData = idiomaData ?? new DAL.Idioma();
            _empleadoData = empleadoData ?? new DAL.EmpleadoDAL();
        }

        public async Task Create(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            Servicios.PermisosAdmin.CheckPermission("languagesMANAGE");
            idioma.Habilitado = false;
            idioma.MostrarPorDefecto = false;
            await _idiomaData.Create(idioma);
        }

        public async Task<IList<Abstracciones.Entities.Traductor.IIdioma>> GetAll()
        {
            return await _idiomaData.GetAll();
        }

        public async Task<IList<Abstracciones.Entities.Traductor.IIdioma>> GetAllHabilitados()
        {
            return await _idiomaData.GetAllHabilitados();
        }

        public async Task<Abstracciones.Entities.Traductor.IIdioma> GetDefault()
        {
            return await _idiomaData.GetDefault();
        }

        public async Task MostrarPorDefecto(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            Servicios.PermisosAdmin.CheckPermission("languagesMANAGE");
            if (!idioma.Habilitado)
            {
                idioma.Habilitado = true;
            }
            var idiomaPorDefecto = await _idiomaData.GetDefault();
            idiomaPorDefecto.MostrarPorDefecto = false;
            idioma.MostrarPorDefecto = true;
            await _idiomaData.Update(idioma);
            await _idiomaData.Update(idiomaPorDefecto);
        }

        public async Task UpdateHabilitado(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            Servicios.PermisosAdmin.CheckPermission("languagesMANAGE");
            //si se deshabilito un idioma se reinicia la preferencia de aquellos empleados que prefieren ese idioma.
            if (!idioma.Habilitado)
            {
                var idiomasHabilitados = await _idiomaData.GetAllHabilitados();
                if (idiomasHabilitados.Count == 1)
                {
                    throw new Servicios.Excepciones.CannotDisableOnlyEnabledLanguageException();
                }
                var empleados = await _empleadoData.GetAll();
                foreach (var empleado in empleados)
                {
                    if (empleado.Idioma != null && empleado.Idioma.Equals(idioma))
                    {
                        empleado.Idioma = null;
                        await _empleadoData.Update(empleado);
                    }
                }
                var nuevoIdiomaPorDefecto = idiomasHabilitados.First(i => !i.Equals(idioma));
                nuevoIdiomaPorDefecto.MostrarPorDefecto = true;
                idioma.MostrarPorDefecto = false;
                await _idiomaData.Update(nuevoIdiomaPorDefecto);
            }
            await _idiomaData.Update(idioma);
        }
    }
}
