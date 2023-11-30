using System.Collections.Generic;
using System.Threading.Tasks;
using FxInformation.Models;

namespace FxInformation.Interface
{
    public interface IConsultaInformacionService
    {
        Task<ServiceResponse<List<ResultadoInformacion>>> ObtenerInformacion (string score);
    }
}