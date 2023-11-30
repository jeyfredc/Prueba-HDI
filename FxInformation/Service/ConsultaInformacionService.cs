using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FxInformation.Interface;
using FxInformation.Models;
using Microsoft.EntityFrameworkCore;

namespace FxInformation.Services
{
    public class ConsultaInformacionService : IConsultaInformacionService
    {
        private readonly DataContext.DataContext _context;

        public ConsultaInformacionService(
            DataContext.DataContext context
        )
        {
            _context = context;
        }

        public async Task<ServiceResponse<List<ResultadoInformacion>>> ObtenerInformacion (string score)
        {
            try
            {
                // Realiza una consulta a la base de datos para obtener los resultados
                var results = _context.ResultadoInformaciones.FromSqlInterpolated($"EXEC consultaScore {score}").ToList();
                // Retorna una respuesta exitosa con los datos si se encuentran resultados
                if (results != null)
                {
                    return new ServiceResponse<List<ResultadoInformacion>>
                    {
                        IsError = false,
                        Message = "Consulta exitosa",
                        Data = results
                    };
                }
                // Retorna una respuesta de error si no se encuentran datos
                else
                {
                    return new ServiceResponse<List<ResultadoInformacion>>
                    {
                        IsError = true,
                        Message = "No se encontraron resultados",
                        Data = null
                    };
                }
            }
            // Manejo de excepciones con una respuesta de error
            catch (Exception e)
            {
                return new ServiceResponse<List<ResultadoInformacion>>()
                {
                    IsError = true,
                    Message = e.Message,
                    Data = null
                };
            }
        }
    }
}