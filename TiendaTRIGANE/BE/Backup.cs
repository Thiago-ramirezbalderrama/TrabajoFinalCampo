using System;
using System.Collections.Generic;
using System.Linq;
using Abstracciones.Entities;

namespace BE
{
    public class Backup : EntidadPersistente, IBackup
    {
        public DateTime Fecha { get; set; }
        public IEmpleado Empleado { get; set; }

        public bool Equals(IBackup backup)
        {
            if (backup == null || !base.Equals(backup)) return false;

            return Fecha == backup.Fecha &&
                Empleado.Equals(backup.Empleado);
        }
    }
}
