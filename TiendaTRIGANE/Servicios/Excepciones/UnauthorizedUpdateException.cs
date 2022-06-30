namespace Servicios.Excepciones
{
    public class UnauthorizedUpdateException : CustomTranslatableException
    {
        public UnauthorizedUpdateException() : base("integrity_check_failed_unauthorized_update_longversion")
        {
        }
    }
}
