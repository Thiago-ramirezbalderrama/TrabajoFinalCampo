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

        public DigitosVerificadoresVerticales(IAccesoDB db = null)
        {
            _db = db ?? new ConexionDAL();
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
                throw new Servicios.Excepciones.DatabaseUnknownErrorException();
            }
        }
    }
}
