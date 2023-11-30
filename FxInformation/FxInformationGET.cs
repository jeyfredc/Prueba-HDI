using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using FxInformation.Interface;
using FxInformation.Models;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Extensions.Logging;


namespace FxInformation;

public class FxInformationGET
{
    private readonly IConsultaInformacionService _consultaInformacionService;
    private readonly ILogger<FxInformationGET> _logger;
    
    public FxInformationGET(IConsultaInformacionService consultaInformacionService, ILogger<FxInformationGET> logger)
    {
        _consultaInformacionService = consultaInformacionService;
        _logger = logger;
    }


    [FunctionName("FxInformationGET")]
    [OpenApiOperation(operationId: "Datos Informacion", tags: new[] { "score" },
        Summary = "Obtener Informacion segun el score",
        Description = "Este servicio devuelve un json")]
    [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json",
        bodyType: typeof(List<ResultadoInformacion>),
        Summary = "Respuesta exitosa", Description = "Respuesta exitosa")]
    [OpenApiResponseWithoutBody(statusCode: HttpStatusCode.InternalServerError,
        Summary = "Si hay un error interno del servidor",
        Description = "Si hay un error interno del servidor")]
    public async Task<IActionResult> DatosPlacasSolicitud(
        [HttpTrigger(AuthorizationLevel.Function, "get", Route = "obtener-informacion/{score}")]
        HttpRequest req, string score)
    {
        try
        {
            _logger.LogInformation("Iniciando la función FxGetDatosPlacasSolicitud.");
            // Validación de ID del detalle del vehículo
            if (score.Equals(""))
            {
                return new BadRequestObjectResult(new ServiceResponse<ResultadoInformacion>
                {
                    IsError = true,
                    Message = "El Score es invalido",
                    Data = null
                })
                {
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            var resultados = await _consultaInformacionService.ObtenerInformacion(score);

            if (resultados == null || resultados.IsError)
            {
                _logger.LogWarning($"No se encontraron datos para el Score: {score}");
                return new ObjectResult(new ServiceResponse<ResultadoInformacion>
                {
                    IsError = true,
                    Message = $"No se encontraron datos para el Score: {score}",
                    Data = null
                })
                {
                    StatusCode = StatusCodes.Status404NotFound
                };
            }

            return new OkObjectResult(resultados);
        }
        catch (Exception e)
        {
            _logger.LogError($"Error en la función FxInformationGET: {e.Message}");
            return new ObjectResult(new ServiceResponse<ResultadoInformacion>
            {
                IsError = true,
                Message = $"Ocurrio un error: {e.Message}",
                Data = null
            })
            {
                StatusCode = StatusCodes.Status404NotFound
            };
        }
    }



}