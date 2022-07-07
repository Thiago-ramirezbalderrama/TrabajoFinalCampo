using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones
{
    public interface IReadable<T>
    {
        Task<IList<T>> GetAll();
    }
}
