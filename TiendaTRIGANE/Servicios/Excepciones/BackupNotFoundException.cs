namespace Servicios.Excepciones
{
    public class BackupNotFoundException : CustomTranslatableException
    {
        public BackupNotFoundException() : base("backup_not_found")
        {
        }
    }
}
