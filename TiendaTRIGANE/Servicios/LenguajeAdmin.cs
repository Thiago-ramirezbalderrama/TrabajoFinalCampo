using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicios
{
    public class LenguajeAdmin : Abstracciones.IObservableIdioma
    {
        private static readonly List<Abstracciones.IObserverIdioma> observadores = new List<Abstracciones.IObserverIdioma>();
        private Dictionary<string, Abstracciones.Entities.Traductor.ITraduccion> Traducciones = new Dictionary<string, Abstracciones.Entities.Traductor.ITraduccion>();
        public Abstracciones.Entities.Traductor.IIdioma Idioma { get; private set; }

        public void AgregarObservador(Abstracciones.IObserverIdioma observador)
        {
            if (!observadores.Contains(observador))
            {
                observadores.Add(observador);
            }
        }

        public string Traducir(string key)
        {
            if (Traducciones.ContainsKey(key))
            {
                return Traducciones[key].Texto;
            }

            return key;
        }

        public void CambiarIdioma(Abstracciones.Entities.Traductor.IIdioma nuevoIdioma, Dictionary<string, Abstracciones.Entities.Traductor.ITraduccion> traducciones)
        {
            Idioma = nuevoIdioma;
            Traducciones = traducciones;
            NotificarCambio();
        }

        public void QuitarObservador(Abstracciones.IObserverIdioma observador)
        {
            if (!observadores.Contains(observador))
            {
                observadores.Remove(observador);
            }
        }

        public void NotificarCambio()
        {
            foreach (var observador in observadores)
            {
                observador.ActualizarIdioma();
            }
        }
    }
}
