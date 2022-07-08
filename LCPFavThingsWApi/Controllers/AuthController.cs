//source: https://gist.github.com/renatogroffe/90612f4412249218b99e7bbc08a68065/raw/b87d60799922633070c932729ce132431faf5272/LoginController.cs

using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using LCPFavThingsWApi.SecurityApi.JWT;

namespace LCPFavThingsWApi.Controllers;

[ApiController]
[Route("api/auth")]
public class AuthController : ControllerBase
{
    [AllowAnonymous]
    [HttpPost]
    [ProducesResponseType(typeof(Token), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.Unauthorized)]
    public ActionResult<Token> Post(
        [FromBody] User utilizador,
        [FromServices] ILogger<AuthController> logger,
        [FromServices] AccessManager accessManager)
    {
        logger.LogInformation($"Recebida solicitação para o utilizador: {utilizador?.Username}");

        if (utilizador is not null && accessManager.ValidateCredentials(utilizador))
        {
            logger.LogInformation($"Sucesso na autenticação do utilizador: {utilizador.Username}");
            return accessManager.GenerateToken(utilizador);
        }
        else
        {
            logger.LogError($"Falha na autenticação do utilizador: {utilizador?.Username}");
            return new UnauthorizedResult();
        }
    }
}
