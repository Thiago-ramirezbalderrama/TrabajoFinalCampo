using System.Collections.Generic;
using System.Threading.Tasks;

namespace BLL
{
    public class Palabra : Abstracciones.BL.Traductor.IPalabra
    {
        private readonly Abstracciones.DAL.Traductor.IPalabra _palabraData;

        public Palabra(Abstracciones.DAL.Traductor.IPalabra palabraData = null)
        {
            _palabraData = palabraData ?? new DAL.Palabra();
        }

        public async Task<IList<Abstracciones.Entities.Traductor.IPalabra>> GetAll()
        {
            return await _palabraData.GetAll();
        }
    }
}
