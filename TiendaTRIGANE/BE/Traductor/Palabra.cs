namespace BE.Traductor
{
    internal class Palabra : Abstracciones.Entities.Traductor.IPalabra
    {
        public string NombrePalabra { get; set; }

        public bool Equals(Abstracciones.Entities.Traductor.IPalabra palabra)
        {
            if (palabra == null) return false;

            return NombrePalabra == palabra.NombrePalabra;
        }
    }
}
