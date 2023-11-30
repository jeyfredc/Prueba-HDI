using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("Personas", Schema = "dbo")]
    public class Personas
    {
        [Key][Column("PersonaId")]
        public int PersonaId { get; set; }
    
        [Column("EdadMin")]
        public string EdadMin { get; set; }
    
        [Column("EdadMax")]
        public string EdadMax { get; set; }
    
        [Column("Nombres")]
        public string Nombres { get; set; }
    
        [Column("PrimerApellido")]
        public string PrimerApellido { get; set; }
    
        [Column("SegundoApellido")]
        public string SegundoApellido { get; set; }

    }
}