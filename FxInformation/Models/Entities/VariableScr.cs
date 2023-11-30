using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("VariablesSrc", Schema = "dbo")]
    public class VariableScr
    {
        [Key][Column("VariableScrId")]
        public int VariableResId { get; set; }
    
        [Column("Nombre")]
        public string NombreVariable { get; set; }
    
        [Column("Valor")]
        public string ScoreVariable { get; set; }
    

    }
}