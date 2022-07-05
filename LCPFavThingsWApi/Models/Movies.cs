using SQLite;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LCPFavThingsWApi.Models
{
    public partial class Movies
    {
#nullable enable

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        [PrimaryKey]
        public int? MovieId { get; set; }

        [Required]
        public string? Title { get; set; }

        [Required]
        public string? DescT { get; set; }

        [Required]
        public string? Genre { get; set; }

        [Required]
        public string? Category { get; set; }

        [Required]
        public string? Cover { get; set; }

        [Required]
        public string? Company { get; set; }

        [Required]
        public string? LangT { get; set; }

        [Required]
        [Range(1, int.MaxValue, ErrorMessage = " This field only accepts positive numbers!")]
        public int? Duration { get; set; }

        [Required]
        [Range(0, 10.0, ErrorMessage = "The value should be less than or equal to 10.0")]
        public decimal? Rating { get; set; }

        public Movies()
        {
            Title = string.Empty;
            DescT = string.Empty;
            Genre = string.Empty;
            Category = string.Empty;
            Company = string.Empty;
            LangT = string.Empty;
        }
    }
}
