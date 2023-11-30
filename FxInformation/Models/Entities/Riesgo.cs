using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("Riesgos", Schema = "dbo")]
    public class Riesgo
    {
        [Key][Column("RiesgoId")]
        public int RiesgoId { get; set; }
    
        [Column("FechaConsulta")]
        public DateTime FechaConsulta { get; set; }
    
        [Column("Secuencia")]
        public int Secuencia { get; set; }
    
        [Column("CodigoRespuesta")]
        public string CodigoRespuesta { get; set; }

        [Column("PersonaId")]
        public int PersonaId { get; set; }
    }
}