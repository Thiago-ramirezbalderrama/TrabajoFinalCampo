using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstracciones
{
    public interface IObservableIdioma
    {
        void AgregarObservador(IObserverIdioma observer);

        void QuitarObservador(IObserverIdioma observer);

        void NotificarCambio();
    }
}
