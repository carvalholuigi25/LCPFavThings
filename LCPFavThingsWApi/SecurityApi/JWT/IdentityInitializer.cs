//source: https://raw.githubusercontent.com/renatogroffe/ASPNETCore6-REST_API-JWT-Swagger_ContagemAcessos/main/APIs.Security.JWT/IdentityInitializer.cs

using Microsoft.AspNetCore.Identity;

namespace LCPFavThingsWApi.SecurityApi.JWT;

public class IdentityInitializer
{
    private readonly ApiSecurityDBCtx _context;
    private readonly UserManager<ApplicationUser> _userManager;
    private readonly RoleManager<IdentityRole> _roleManager;

    public IdentityInitializer(
        ApiSecurityDBCtx context,
        UserManager<ApplicationUser> userManager,
        RoleManager<IdentityRole> roleManager)
    {
        _context = context;
        _userManager = userManager;
        _roleManager = roleManager;
    }

    public void Initialize()
    {
        if (_context.Database.EnsureCreated())
        {
            if (!_roleManager.RoleExistsAsync(Roles.ROLE_ACESSO_APIS).Result)
            {
                var resultado = _roleManager.CreateAsync(
                    new IdentityRole(Roles.ROLE_ACESSO_APIS)).Result;
                if (!resultado.Succeeded)
                {
                    throw new Exception(
                        $"Erro durante a criação da role {Roles.ROLE_ACESSO_APIS}.");
                }
            }

            CreateUser(
                new ApplicationUser()
                {
                    UserName = "guest",
                    Email = "guest@localhost.loc",
                    EmailConfirmed = true
                }, "8@SLq^D4S&$,mpjG", Roles.ROLE_ACESSO_APIS);

            CreateUser(
                new ApplicationUser()
                {
                    UserName = "admin",
                    Email = "admin@localhost.loc",
                    EmailConfirmed = true
                }, "-k-Nd?k6/pj7D7Ef", Roles.ROLE_ACESSO_APIS);
        }
    }

    private void CreateUser(
        ApplicationUser user,
        string password,
        string? initialRole = null)
    {
        if (_userManager.FindByNameAsync(user.UserName).Result == null)
        {
            var resultado = _userManager
                .CreateAsync(user, password).Result;

            if (resultado.Succeeded &&
                !String.IsNullOrWhiteSpace(initialRole))
            {
                _userManager.AddToRoleAsync(user, initialRole).Wait();
            }
        }
    }
}
