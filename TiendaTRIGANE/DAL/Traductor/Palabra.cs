using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Palabra : Abstracciones.DAL.Traductor.IPalabra
    {
        private readonly Abstracciones.DAL.IAccesoDB _db;

        public Palabra(Abstracciones.DAL.IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
        }

        //public IList<Abstractions.IPalabra> GetNotTranslatedByLanguage(Abstractions.IIdioma idioma)
        //{
        //    IList<Abstractions.IPalabra> palabras = new List<Abstractions.IPalabra>();
        //    SqlParameter[] parameters = new SqlParameter[]
        //    {
        //        new SqlParameter("@idIdioma", idioma.ID)
        //    };
        //    DataTable tabla = _db.Leer("PALABRA_GET_NOT_TRANSLATED", parameters);
        //    foreach (DataRow registro in tabla.Rows)
        //    {
        //        Entities.Palabra palabra = new Entities.Palabra()
        //        {
        //            NombrePalabra = registro["NombrePalabra"].ToString()
        //        };
        //        palabras.Add(palabra);
        //    }
        //    return palabras;
        //}

        public async Task<IList<Abstracciones.Entities.Traductor.IPalabra>> GetAll()
        {
            try
            {
                IList<Abstracciones.Entities.Traductor.IPalabra> palabras = new List<Abstracciones.Entities.Traductor.IPalabra>();
                var tabla = await _db.ReadStoredProcedure("PALABRA_GET_ALL", null);
                foreach (DataRow registro in tabla.Rows)
                {
                    var palabra = new BE.Palabra
                    {
                        NombrePalabra = registro["NombrePalabra"].ToString()
                    };
                    palabras.Add(palabra);
                }

                return palabras;
            }
            catch (SqlException ex)
            {
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
