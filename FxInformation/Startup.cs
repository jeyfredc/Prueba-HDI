using System;
using System.Reflection;
using System.Text.Json.Serialization;
using AzureFunctions.Extensions.Swashbuckle;
using FxInformation.Interface;
using FxInformation.Services;
using Microsoft.Azure.Functions.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;


[assembly:FunctionsStartup(typeof(FxInformation.Startup))]

namespace FxInformation
{
    public class Startup : FunctionsStartup
    {
        public override void ConfigureAppConfiguration(IFunctionsConfigurationBuilder builder)
        {
            // Configura la configuración de la aplicación
            builder.ConfigurationBuilder
                .AddJsonFile("local.settings.json", optional: true, reloadOnChange: true)
                .AddEnvironmentVariables();
        }
        
        public override void Configure(IFunctionsHostBuilder builder)
        {
            builder.Services.AddMvcCore().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.Preserve;
            });
            
            var connectionString = 
                Environment.GetEnvironmentVariable("SqlServerConnection");
            builder.Services.AddDbContext<DataContext.DataContext>(x =>
            {
                x.UseSqlServer(connectionString
                        , options=>options.EnableRetryOnFailure())
                    .EnableSensitiveDataLogging();
            });
            

            builder.Services.AddTransient<IConsultaInformacionService, ConsultaInformacionService>();

            
            builder.AddSwashBuckle(Assembly.GetExecutingAssembly());
            
        }
    
    }
}