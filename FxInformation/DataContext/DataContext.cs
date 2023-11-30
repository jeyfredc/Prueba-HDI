using FxInformation.Models;
using Microsoft.EntityFrameworkCore;

namespace FxInformation.DataContext
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        { }

        public DbSet<Categoria> Categorias { get; set; }
    
        public DbSet<Identificacion> Identificaciones { get; set; }
    
        public DbSet<Informacion> Informaciones { get; set; }
    
        public DbSet<Personas> Personas { get; set; }
    
        public DbSet<Riesgo> Riesgos { get; set; }
    
        public DbSet<Scores> Scores { get; set; }
    
        public DbSet<VariableRes> VariablesRes { get; set; }
    
        public DbSet<VariableScr> VariableScrs { get; set; }
    
        public DbSet<ResultadoInformacion> ResultadoInformaciones { get; set; }
    
    }
}