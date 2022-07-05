using System.ComponentModel.DataAnnotations;
using static LCPFavThingsLib.Enums.MyEnums;

namespace LCPFavThings.Models
{
	public class QueryData
	{
		#nullable enable
		
		[Required]
		public string? QryCommand { get; set; }
        public string? SGBDService { get; set; } = SGBDServiceEnum.sqlite.ToString();
    }
}
