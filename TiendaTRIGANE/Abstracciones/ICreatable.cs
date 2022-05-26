using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones
{
    public interface ICreatable<T>
    {
        Task Create(T obj);
    }
}
