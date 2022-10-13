using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones.DAL
{
    public interface IBackups : IReadable<Entities.IBackup>, ICreatable<Entities.IBackup>
    {
        Task Restore(Entities.IBackup backup);
    }
}
