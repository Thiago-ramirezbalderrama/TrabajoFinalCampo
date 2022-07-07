using System.Collections.Generic;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Idioma : Abstracciones.DAL.Traductor.IIdioma
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;

        public Idioma(Abstracciones.DAL.IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        public async Task Create(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@Nombre", idioma.Nombre),
                    new SqlParameter("@Habilitado", idioma.Habilitado),
                    new SqlParameter("@Default", idioma.MostrarPorDefecto)
                };

                await _db.WriteStoredProcedure("IDIOMA_CREATE", parameters);
            }
            catch (SqlException ex) when (ex.Errors.Count > 0 && ex.Errors[0].Number == 2627)
            {
                throw new Servicios.Excepciones.ItemAlreadyExistsException();
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.Traductor.IIdioma>> GetAll()
        {
            try
            {
                IList<Abstracciones.Entities.Traductor.IIdioma> idiomas = new List<Abstracciones.Entities.Traductor.IIdioma>();
                var tabla = await _db.ReadStoredProcedure("IDIOMA_GET_ALL", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var idioma = new BE.Idioma
                    {
                        ID = int.Parse(registro["idIdioma"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        MostrarPorDefecto = bool.Parse(registro["Default"].ToString()),
                        Habilitado = bool.Parse(registro["Habilitado"].ToString())
                    };
                    idiomas.Add(idioma);
                }
                return idiomas;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.Entities.Traductor.IIdioma>> GetAllHabilitados()
        {
            try
            {
                IList<Abstracciones.Entities.Traductor.IIdioma> idiomas = new List<Abstracciones.Entities.Traductor.IIdioma>();
                var tabla = await _db.ReadStoredProcedure("IDIOMA_GET_ALL_HABILITADOS", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var idioma = new BE.Idioma
                    {
                        ID = int.Parse(registro["idIdioma"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        MostrarPorDefecto = bool.Parse(registro["Default"].ToString()),
                        Habilitado = bool.Parse(registro["Habilitado"].ToString())
                    };
                    idiomas.Add(idioma);
                }
                return idiomas;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<Abstracciones.Entities.Traductor.IIdioma> GetDefault()
        {
            try
            {
                var idiomas = new List<BE.Idioma>();
                var tabla = await _db.ReadStoredProcedure("IDIOMA_GET_DEFAULT", null);

                foreach (DataRow registro in tabla.Rows)
                {
                    var idioma = new BE.Idioma
                    {
                        ID = int.Parse(registro["idIdioma"].ToString()),
                        Nombre = registro["Nombre"].ToString(),
                        MostrarPorDefecto = bool.Parse(registro["Default"].ToString()),
                        Habilitado = bool.Parse(registro["Habilitado"].ToString())
                    };
                    idiomas.Add(idioma);
                }
                return idiomas[0];
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(Abstracciones.Entities.Traductor.IIdioma idioma)
        {
            try
            {
                SqlParameter[] parameters = {
                    new SqlParameter("@idIdioma", idioma.ID),
                    new SqlParameter("@Habilitado", idioma.Habilitado),
                    new SqlParameter("@Default", idioma.MostrarPorDefecto)
                };
                await _db.WriteStoredProcedure("IDIOMA_UPDATE_HABILITADO", parameters);
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
