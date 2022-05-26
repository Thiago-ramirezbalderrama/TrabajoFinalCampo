using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    internal class ConexionDAL : Abstracciones.DAL.IAccesoDB
    {
        public string conexionString { get => @"Data Source=.;Initial Catalog=TiendaTRIGANE;Integrated Security=True"; }


        public async Task<int> WriteStoredProcedure(string st, SqlParameter[] parameters)
        {
            try
            {
                using (var CN = new SqlConnection(conexionString))
                {
                    await Task.Delay(000);
                    await CN.OpenAsync();
                    var CMD = new SqlCommand
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandText = st,
                        Connection = CN
                    };
                    CMD.Parameters.AddRange(parameters);
                    return await CMD.ExecuteNonQueryAsync();
                }
            }
            catch (SqlException ex) when (ex.Number == 2 || ex.Number == 17142)
            {
                throw new Servicios.Excepciones.ConnectionToDataBaseException();
            }
        }






        public async Task<double> ReadScalarValue(string st, SqlParameter[] parameters)
        {
            try
            {
                using (var CN = new SqlConnection(conexionString))
                {
                    await Task.Delay(000);
                    await CN.OpenAsync();
                    var CMD = new SqlCommand
                    {
                        CommandType = CommandType.StoredProcedure,
                        CommandText = st,
                        Connection = CN
                    };
                    if (parameters != null)
                        CMD.Parameters.AddRange(parameters);
                    var res = await CMD.ExecuteScalarAsync();

                    try
                    {
                        if (res != null)
                            return float.Parse(res.ToString());
                        return 0.0;
                    }
                    catch
                    {
                        return 0.0;
                    }
                }
            }
            catch (SqlException ex) when (ex.Number == 2 || ex.Number == 17142)
            {
                throw new Servicios.Excepciones.ConnectionToDataBaseException();
            }
        }







        public async Task<DataTable> ReadStoredProcedure(string st, SqlParameter[] parameters)
        {
            return await Task.Run(async () =>
            {
                try
                {
                    await Task.Delay(0000);
                    using (var CN = new SqlConnection(conexionString))
                    {
                        await CN.OpenAsync();
                        var tabla = new DataTable();
                        var adaptador = new SqlDataAdapter
                        {
                            SelectCommand = new SqlCommand
                            {
                                CommandType = CommandType.StoredProcedure,
                                CommandText = st,
                                Connection = CN
                            }
                        };

                        if (parameters != null)
                            adaptador.SelectCommand.Parameters.AddRange(parameters);

                        await Task.Run(() =>
                        {
                            adaptador.Fill(tabla);
                        });
                        return tabla;
                    }
                }
                catch (SqlException ex) when (ex.Number == 2 || ex.Number == 17142)
                {
                    throw new Servicios.Excepciones.ConnectionToDataBaseException();
                }
            });
        }

    }
}
