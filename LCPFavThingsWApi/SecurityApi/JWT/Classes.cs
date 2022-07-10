//source: https://raw.githubusercontent.com/renatogroffe/ASPNETCore6-REST_API-JWT-Swagger_ContagemAcessos/main/APIs.Security.JWT/Classes.cs

using LCPFavThingsWApi.Models;

namespace LCPFavThingsWApi.SecurityApi.JWT;

public class User : UserAuth { }

public static class Roles
{
    public const string? ROLE_ACESSO_APIS = "Acesso-APIs";
}

public class TokenConfigurations
{
    public string? Audience { get; set; }
    public string? Issuer { get; set; }
    public int Seconds { get; set; } = 60;
    public string? SecretJwtKey { get; set; }
}

public class Token
{
    public Guid? TokenId { get; set; } = Guid.NewGuid();
    public bool Authenticated { get; set; }
    public string? Created { get; set; }
    public string? Expiration { get; set; }
    public string? AccessToken { get; set; }
    public string? Message { get; set; }
}
