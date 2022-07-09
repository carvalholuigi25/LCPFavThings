using LCPFavThingsLib.Models;
using Newtonsoft.Json;

namespace LCPFavThings.Helpers
{
    public static class HTTPHelper
    {
        public static readonly ILSHelper lsh;
        public static string GetMyBaseAddress()
        {
            var isSSL = true;
            var port = isSSL ? 5001 : 5000;
            var httph = isSSL ? "https" : "http";
            var localAddress = $@"{httph}://localhost:{port}";
            var virtualAddress = $@"{httph}://10.0.2.2:{port}";
            //var virtualAddress = DeviceInfo.DeviceType == DeviceType.Physical ? $@"{httph}://192.168.1.67:{port}" : $@"{httph}://10.0.2.2:{port}";

            return DeviceInfo.Platform == DevicePlatform.Android ? virtualAddress : localAddress;
        }

        public static HttpClientHandler GetInsecureHandler(int mode = 0)
        {
            HttpClientHandler handler = new HttpClientHandler();

            handler.ClientCertificateOptions = ClientCertificateOption.Manual;
            handler.ServerCertificateCustomValidationCallback = (message, cert, chain, errors) =>
            {
                if(mode == 0)
                {
                    return true;
                }
                else
                {
                    if (cert.Issuer.Equals("CN=localhost"))
                        return true;
                    return errors == System.Net.Security.SslPolicyErrors.None;
                }
            };
            
            return handler;
        }

        public static async Task<string> SetBearerJWT()
        {
            var myainfo = !string.IsNullOrEmpty(await lsh.Get("authinfo")) ? await lsh.Get("authinfo") : "";
            var objainfo = JsonConvert.DeserializeObject<UserAuth>(myainfo);
            return objainfo.TokenInfo.AccessToken;
        }
    }
}
