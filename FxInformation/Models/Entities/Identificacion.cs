using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("Identificaciones", Schema = "dbo")]
    public class Identificacion
    {
        [Key][Column("IdentificacionId")]
        public int IdentificacionId { get; set; }
    
        [Column("Numero")]
        public string Numero { get; set; }
    
        [Column("Tipo")]
        public string Tipo { get; set; }
    
        [Column("Estadi")]
        public string Estadi { get; set; }
    
        [Column("Ciudad")]
        public string Ciudad { get; set; }
    

        [Column("Departamento")]
        public string Departamento { get; set; }
    
        [Column("Genero")]
        public string Genero { get; set; }
    }
}