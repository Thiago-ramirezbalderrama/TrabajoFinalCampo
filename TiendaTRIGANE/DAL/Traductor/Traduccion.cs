using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Traduccion : Abstracciones.DAL.Traductor.ITraduccion
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;
        private readonly Abstracciones.DAL.Traductor.IIdioma _idioma_Data;

        public Traduccion(Abstracciones.DAL.IAccesoDB db = null, Abstracciones.DAL.Traductor.IIdioma idioma_Data = null)
        {
            _db = db ?? new ConexionDAL();
            _idioma_Data = idioma_Data ?? new Idioma();
        }

        public async Task<Dictionary<string, Abstracciones.Entities.Traductor.ITraduccion>> GetAll(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            try
            {
                var traducciones = new Dictionary<string, Abstracciones.Entities.Traductor.ITraduccion>();
                SqlParameter[] parameters = {
                    new SqlParameter("@idIdioma", idioma.ID)
                };
                var tabla = await _db.ReadStoredProcedure("TRADUCCION_GET", parameters);
                foreach (DataRow registro in tabla.Rows)
                {
                    var palabra = new BE.Palabra
                    {
                        NombrePalabra = registro["NombrePalabra"].ToString()
                    };
                    var traduccion = new BE.Traduccion(idioma, palabra)
                    {
                        Texto = registro["TextoTraducido"].ToString(),
                    };
                    var NombrePalabra = registro["NombrePalabra"].ToString();
                    traducciones.Add(NombrePalabra, traduccion);
                }
                return traducciones;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(Abstracciones.Entities.Traductor.ITraduccion traduccion)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idIdioma", traduccion.Idioma.ID),
                    new SqlParameter("@NombrePalabra", traduccion.Palabra.NombrePalabra),
                    new SqlParameter("@TextoTraducido", traduccion.Texto)
                };
                await _db.WriteStoredProcedure("TRADUCCION_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.Traductor.ITraduccion>> GetAllFromAllLanguages()
        {
            try
            {
                IList<Abstracciones.Entities.Traductor.ITraduccion> traducciones = new List<Abstracciones.Entities.Traductor.ITraduccion>();
                var idiomas = await _idioma_Data.GetAll();
                var tabla = await _db.ReadStoredProcedure("TRADUCCION_GET_ALL", null);
                foreach (DataRow registro in tabla.Rows)
                {
                    var palabra = new BE.Palabra
                    {
                        NombrePalabra = registro["NombrePalabra"].ToString()
                    };
                    var traduccion = new BE.Traduccion(
                        idiomas.First(idioma => idioma.ID == int.Parse(registro["idIdioma"].ToString())),
                        palabra)
                    {
                        Texto = registro["TextoTraducido"].ToString()
                    };
                    traducciones.Add(traduccion);
                }
                return traducciones;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
