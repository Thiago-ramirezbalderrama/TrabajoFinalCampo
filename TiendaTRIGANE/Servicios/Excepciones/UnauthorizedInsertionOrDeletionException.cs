namespace Servicios.Excepciones
{
    public class UnauthorizedInsertionOrDeletionException : CustomTranslatableException
    {
        public UnauthorizedInsertionOrDeletionException() : base("integrity_check_failed_unauthorized_addition_or_deletion_longversion")

        {
        }
    }
}
