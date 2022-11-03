using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Servicios
{
    public static class EncriptadoAdmin
    {

        private const int SALT_SIZE = 32;
        private const int HASH_SIZE = 32;
        private const int ITERATIONS = 20000;
        private const string DVH_SALT = "hfjdasklhgwuerighbrwe";
        private const string DVV_SALT = "hrewiorweyuiorweyuioo";
        private static bool bIntegrity = true;


        public static bool checkIntegrity
        {
            get { return bIntegrity; }
            set { bIntegrity = value; }
        }

        private static byte[] GetHash(byte[] input, byte[] salt)
        {
            // Generar el hash en base al input y el salt
            var pbkdf2 = new Rfc2898DeriveBytes(input, salt, ITERATIONS);
            return pbkdf2.GetBytes(HASH_SIZE);
        }


        private static byte[] CreateSalt()
        {
            var provider = new RNGCryptoServiceProvider();
            var salt = new byte[SALT_SIZE];
            provider.GetBytes(salt);
            return salt;
        }



        public static List<byte[]> CreateNewHash(byte[] input)
        {
            var returnArray = new List<byte[]>();
            var salt = CreateSalt();

            // Generar el hash en base al input y el salt generado
            var pbkdf2 = new Rfc2898DeriveBytes(input, salt, ITERATIONS);
            returnArray.Add(pbkdf2.GetBytes(HASH_SIZE));
            returnArray.Add(salt);
            return returnArray;
        }



        public static bool CompareHashes(byte[] plain, byte[] salt, byte[] hashToCompare)
        {
            var h1 = GetHash(plain, salt);
            return h1.SequenceEqual(hashToCompare);
        }



        public static byte[] CalcularDVH(object obj)
        {
            using (var sha256Hash = SHA256.Create())
            {
                var t = obj.GetType();
                var dvh = string.Empty;
                var props = t.GetProperties();

                foreach (var item in props)
                {
                    if (item.PropertyType.FullName.Equals(typeof(DateTime).FullName))
                    {
                        var a = (DateTime)item.GetValue(obj);
                        dvh += a.ToString("ddmmyyyyhhmmss");
                    }
                    else if (item.Name != "DVH")
                    {
                        dvh += item.GetValue(obj).ToString();
                    }
                }
                return sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(dvh + DVH_SALT));
            }
        }



        public static bool VerificarDVH(Abstracciones.Entities.IEntidadPersistente obj)
        {
            if (!checkIntegrity) return true;
            var dvRecalculado = CalcularDVH(obj);
            var dvObtenido = obj.DVH;
            var resultadoComparacion = dvRecalculado.SequenceEqual(dvObtenido);
            return resultadoComparacion;
        }




        public static byte[] CalcularDVV(IList<Abstracciones.Entities.IEntidadPersistente> objs)
        {
            using (var sha256Hash = SHA256.Create())
            {
                IList<byte> dvv = new List<byte>();

                foreach (var obj in objs)
                {
                    foreach (var b in obj.DVH)
                    {
                        dvv.Add(b);
                    }
                }
                var strToHash = Encoding.UTF8.GetString(dvv.ToArray()) + DVV_SALT;
                return sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(strToHash)).ToArray();
            }
        }

        public static bool VerificarDVV(IList<Abstracciones.Entities.IEntidadPersistente> objs, byte[] dvvObtenido)
        {
            if (!checkIntegrity) return true;
            var dvRecalculado = CalcularDVV(objs);
            var resultadoComparacion = dvRecalculado.SequenceEqual(dvvObtenido);
            return resultadoComparacion;
        }
    }
}
