using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("Scores", Schema = "dbo")]
    public class Scores
    {
        [Key][Column("ScoreId")]
        public int ScoreId { get; set; }
    
        [Column("Score")]
        public string Score { get; set; }
    }
}