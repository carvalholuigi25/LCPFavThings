using SQLite;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using LCPFavThingsWApi.SecurityApi.JWT;
using System.Text.Json.Serialization;

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
        public int? Pin { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public DateTime? DateBirthday { get; set; }
        public string? Avatar { get; set; }
        public string? Cover { get; set; } = "guest.jpg";
        public string? About { get; set; }
        public DateTime? DateAccountCreated { get; set; } = DateTime.UtcNow;
        public UsersRoles? RoleT { get; set; } = UsersRoles.guest;
        [NotMapped]
        [JsonIgnore]
        public Token? TokenInfo { get; set; }
    }

    public class UserAuth
    {
        public string? Username { get; set; }
        public string? Password { get; set; }
        [JsonIgnore]
        public Token? TokenInfo { get; set; }
    }

    public enum UsersRoles
    {
        banned,
        guest,
        user,
        admin
    }
}
