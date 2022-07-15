using SQLite;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using LCPFavThingsWApi.SecurityApi.JWT;
using LCPFavThingsWApi.Filters;

namespace LCPFavThingsWApi.Models
{
    public partial class Users
    {
        #nullable enable

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        [PrimaryKey]
        public int? UserId { get; set; }
        [Required]
        public string? Username { get; set; }
        [Required]
        public string? PasswordT { get; set; }
        public string? Email { get; set; }
        public string? Pin { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public DateTime? DateBirthday { get; set; }
        public string? Avatar { get; set; }
        public string? Cover { get; set; } = "guest.jpg";
        public string? About { get; set; }
        public DateTime? DateAccountCreated { get; set; } = DateTime.UtcNow;
        public UsersRoles? RoleT { get; set; } = UsersRoles.guest;
        public UserToken? TokenInfo { get; set; }
    }

    public class UserAuth
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        [PrimaryKey]
        [SwaggerIgnore]
        public int? UserAuthId { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }

        [SwaggerIgnore]
        public UsersRoles? RoleT { get; set; } = UsersRoles.user;

        [SwaggerIgnore]
        public string? Avatar { get; set; }

        [SwaggerIgnore]
        public int? UserId { get; set; } = 1;

        [SwaggerIgnore]
        [NotMapped]
        public UserToken? TokenInfo { get; set; }
    }

    public enum UsersRoles
    {
        banned,
        guest,
        user,
        admin
    }
}
