using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IDigitosVerificadoresVerticales : IReadable<IDVV>, IUpdateable<IDVV>
    {
        Task<IDVV> Get(string nombreTabla);
    }
}
