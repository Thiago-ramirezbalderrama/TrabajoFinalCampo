using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Abstracciones.Entities;

namespace BE
{
    public abstract class EntidadPersistente : IEntidadPersistente
    {

        public int ID { get; set; }
        public byte[] DVH { get; set; }
        public bool EstadoActivo { get; set; }


        public bool Equals(IEntidadPersistente entidadPersistente)
        {
            if (entidadPersistente == null) return false;

            return ID == entidadPersistente.ID;
        }

    }
}
