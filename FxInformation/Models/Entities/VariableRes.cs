using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("VariablesRes", Schema = "dbo")]
    public class VariableRes
    {
        [Key][Column("VariableResId")]
        public int VariableResId { get; set; }
    
        [Column("NombreVariable")]
        public string NombreVariable { get; set; }
    
        [Column("ScoreVariable")]
        public string ScoreVariable { get; set; }
    
        [Column("Descripcion")]
        public string Descripcion { get; set; }
    


    }
}