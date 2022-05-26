using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Abstracciones.DAL
{
    public interface IAccesoDB
    {

        Task<int> WriteStoredProcedure(string sp, SqlParameter[] parameters);

        Task<double> ReadScalarValue(string sp, SqlParameter[] parameters);

        Task<DataTable> ReadStoredProcedure(string sp, SqlParameter[] parameters);
        string conexionString { get; }

    }
}
