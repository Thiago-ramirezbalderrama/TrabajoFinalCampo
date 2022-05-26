using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.BL
{
    public interface IRol : ICreatable<Entities.IRol>,
        IReadable<Entities.IRol>,
        IUpdateable<Entities.IRol>,
        IDeletable<Entities.IRol>
    {
    }
}
