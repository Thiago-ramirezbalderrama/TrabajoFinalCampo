using System.Collections.Generic;
using System.Threading.Tasks;
using Abstracciones.DAL;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    internal class DigitosVerificadoresVerticales : IDigitosVerificadoresVerticales
    {
        private readonly IAccesoDB _db;
        private readonly IBitacoraDAL _bitacora;

        public DigitosVerificadoresVerticales(IAccesoDB db = null, IBitacoraDAL bitacora = null)
        {
            _db = db ?? new ConexionDAL();
            _bitacora = bitacora ?? new BitacoraDAL();
        }

        public async Task<Abstracciones.IDVV> Get(string nombreTabla)
        {
            try
            {
                SqlParameter[] parameters = { new SqlParameter("@Tabla", nombreTabla) };
                var tabla = await _db.ReadStoredProcedure("DVV_GET", parameters);
                Abstracciones.IDVV dvv = new BE.DVV(nombreTabla, (byte[])tabla.Rows[0]?["DVV"]);
                return dvv;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("dvv_entry_not_found", "dvv", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task<IList<Abstracciones.IDVV>> GetAll()
        {
            try
            {
                IList<Abstracciones.IDVV> dvvs = new List<Abstracciones.IDVV>();
                var tabla = await _db.ReadStoredProcedure("DVV_GET_ALL", null);
                foreach (DataRow registro in tabla.Rows)
                {
                    dvvs.Add(new BE.DVV(registro["Tabla"].ToString(), (byte[])tabla.Rows[0]["DVV"]));
                }
                return dvvs;
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "dvv", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }

        public async Task Update(Abstracciones.IDVV dvv)
        {
            try
            {
                SqlParameter[] parameters = {
                new SqlParameter("@Tabla", dvv.Tabla),
                new SqlParameter("@DVV", dvv.DV)
            };

                await _db.WriteStoredProcedure("DVV_UPDATE", parameters);
            }
            catch (SqlException ex)
            {
                await _bitacora.LogError("error", "dvv", ex.StackTrace);
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
