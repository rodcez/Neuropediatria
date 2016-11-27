using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Neuropediatria.Utils
{
    public static class Utils
    {
        public static string GerarChaveMD5 (string user, string pass)
        {
            var chave = user + pass + ConfigurationManager.AppSettings["Segredo"];

            using (MD5 md5Hash = MD5.Create())
            {
                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(chave));

                StringBuilder sBuilder = new StringBuilder();

                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }

                return sBuilder.ToString();
            }
        }

        public static bool DataToBool(string value)
        {
            int tempInt;

            if(int.TryParse(value, out tempInt))
                return Convert.ToBoolean(tempInt);

            return string.IsNullOrWhiteSpace(value) ? false : Convert.ToBoolean(value);
        }

        public static int DataToInt(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                return 0;

            int tempInt;

            if(!int.TryParse(value, out tempInt))
                return 0;

            return tempInt;
        }
    }
}