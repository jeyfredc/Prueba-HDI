using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    [Table("Categorias", Schema = "dbo")]
    public class Categoria
    {
        [Key][Column("CategoriaId")]
        public int CategoriaId { get; set; }
        [Column("Vin")]
        public int Vin { get; set; }
        [Column("TipoDocumento")]
        public int TipoDocumento { get; set; }
        [Column("NumeroDocumento")]
        public int NumeroDocumento { get; set; }
        [Column("FechaUltimaCarga")]
        public DateTime FechaUltimaCarga { get; set; }
    

    }
}