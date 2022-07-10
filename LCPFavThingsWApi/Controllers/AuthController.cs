//source: https://gist.github.com/renatogroffe/90612f4412249218b99e7bbc08a68065/raw/b87d60799922633070c932729ce132431faf5272/LoginController.cs

using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using LCPFavThingsWApi.SecurityApi.JWT;
using LCPFavThingsWApi.Context;
using Microsoft.EntityFrameworkCore;
using LCPFavThingsWApi.Models;

namespace LCPFavThingsWApi.Controllers;

[ApiController]
[Route("api/auth")]
public class AuthController : ControllerBase
{
    private readonly DBContext _context;

    public AuthController(DBContext context)
    {
        _context = context;
    }

    // GET: api/Users
    private async Task<string?> GetAvatarFromUser(User myu)
    {
        return await _context.User.Where(x => x.Username == myu.Username).Select(x => x.Avatar).FirstOrDefaultAsync();
    }

    [AllowAnonymous]
    [HttpPost]
    [ProducesResponseType(typeof(Users), (int)HttpStatusCode.OK)]
    [ProducesResponseType((int)HttpStatusCode.Unauthorized)]
    public async Task<ActionResult<Users?>> Post(
        [FromBody] User utilizador,
        [FromServices] ILogger<AuthController> logger,
        [FromServices] AccessManager accessManager)
    {
        logger.LogInformation($"Recebida solicitação para o utilizador: {utilizador?.Username}");

        if (utilizador is not null && accessManager.ValidateCredentials(utilizador))
        {
            logger.LogInformation($"Sucesso na autenticação do utilizador: {utilizador.Username}");
            return new Users()
            {
                Username = utilizador.Username,
                Avatar = await GetAvatarFromUser(utilizador),
                TokenInfo = accessManager.GenerateToken(utilizador)
            };
        }
        else
        {
            logger.LogError($"Falha na autenticação do utilizador: {utilizador?.Username}");
            return new UnauthorizedResult();
        }
    }
}
