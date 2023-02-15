using System;
using System.Security.Cryptography;
using System.Text;

namespace webapi.Helpers
{
    public class SecurityEncrypt
    {
        #region encryptone
        public string Encrypt(string raw)
        {

            using (AesCryptoServiceProvider csp = new AesCryptoServiceProvider())
            {
                ICryptoTransform e = GetCryptoTransform(csp, true);
                byte[] inputBuffer = Encoding.UTF8.GetBytes(raw);
                byte[] output = e.TransformFinalBlock(inputBuffer, 0, inputBuffer.Length);

                string encrypted = Convert.ToBase64String(output);

                return encrypted;
            }
        }


        public string Decrypt(string encrypted)
        {
            using (AesCryptoServiceProvider csp = new AesCryptoServiceProvider())
            {
                var d = GetCryptoTransform(csp, false);
                // var d = GetCryptoTransform(csp, true);
                byte[] output = Convert.FromBase64String(encrypted);
                byte[] decryptedOutput = d.TransformFinalBlock(output, 0, output.Length);


                string decypted = Encoding.UTF8.GetString(decryptedOutput);
                return decypted;
            }
        }

        private ICryptoTransform GetCryptoTransform(AesCryptoServiceProvider csp, bool encrypting)
        {
            csp.Mode = CipherMode.CBC;
            csp.Padding = PaddingMode.PKCS7;
            dynamic passWord = "wh@reH0us3crypt   ";
            dynamic salt = "S41tS4lt";


            String iv = "e123b725e675b456";

            dynamic spec = new Rfc2898DeriveBytes(Encoding.UTF8.GetBytes(passWord), Encoding.UTF8.GetBytes(salt), 65536);
            byte[] key = spec.GetBytes(16);


            csp.IV = Encoding.UTF8.GetBytes(iv);
            csp.Key = key;
            if (encrypting)
            {
                return csp.CreateEncryptor();
            }
            return csp.CreateDecryptor();
        }
        #endregion
    }
}
