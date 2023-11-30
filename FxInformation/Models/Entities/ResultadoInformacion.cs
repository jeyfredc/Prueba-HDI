using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FxInformation.Models
{
    public class ResultadoInformacion
    {
        [Key][Column("Score")]
        public string Score {get; set; }
    
        [Column("FechaConsulta")]
        public DateTime FechaConsulta {get; set; }
    
        [Column("Secuencia")]
        public int Secuencia {get; set; }
    
        [Column("CodigoRespuesta")]
        public string CodigoRespuesta {get; set; }
    
        [Column("NumeroDocumento")]
        public string NumeroDocumento {get; set; }
    
        [Column("Tipo")]
        public string Tipo {get; set; }
    
        [Column("Estadi")]
        public string Estadi {get; set; }
    
        [Column("Ciudad")]
        public string Ciudad {get; set; }
    
        [Column("Departamento")]
        public string Departamento {get; set; }
    
        [Column("Genero")]
        public string Genero {get; set; }
    
        [Column("EdadMin")]
        public string EdadMin {get; set; }
    
        [Column("EdadMax")]
        public string EdadMax {get; set; }
    
        [Column("Nombres")]
        public string Nombres {get; set; }
    
        [Column("PrimerApellido")]
        public string PrimerApellido {get; set; }
    
        [Column("SegundoApellido")]
        public string SegundoApellido {get; set; }
    
        [Column("TipoDocumento")]
        public string TipoDocumento {get; set; }
    
        [Column("Vin")]
        public string? Vin {get; set; }

    
        [Column("FechaUltimaCarga")]
        public DateTime FechaUltimaCarga {get; set; }

    }
}