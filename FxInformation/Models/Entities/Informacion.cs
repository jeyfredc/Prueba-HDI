using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("Informacion", Schema = "dbo")]
    public class Informacion
    {
        [Key][Column("InformacionID")]
        public int InformacionID { get; set; }
    
        [Column("ScoreId")]
        public int ScoreId { get; set; }
    
        [Column("RiesgoId")]
        public int RiesgoId { get; set; }
    
        [Column("CategoriaId")]
        public int CategoriaId { get; set; }
    

    }
}