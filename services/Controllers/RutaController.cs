using backend.domain;
using BussinesLogic.Interfaces;
using Domain;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace services.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RutaController : ControllerBase
    {
        public readonly IRutaBL service;

        public RutaController(IRutaBL _service)
        {
            service = _service;
        }

        [HttpGet("[action]")]
        public async Task<ActionResult<ApiResponse<List<CiudadDTO>>>> getListOrigen()
        {

            ApiResponse<List<CiudadDTO>> response = new ApiResponse<List<CiudadDTO>>();

            try
            {
                var result = await service.getListOrigen();

                response.success = true;
                response.data = (List<CiudadDTO>)result;
                return StatusCode(200, response);
            }
            catch (Exception ex)
            {
                response.success = false;
                response.errMsj = ex.Message;
                return StatusCode(500, response);
            }
        }

        [HttpGet("[action]")]
        public async Task<ActionResult<ApiResponse<List<CiudadDTO>>>> getListDestino(int nIdCiudadOrigen)
        {

            ApiResponse<List<CiudadDTO>> response = new ApiResponse<List<CiudadDTO>>();

            try
            {
                var result = await service.getListDestino(nIdCiudadOrigen);

                response.success = true;
                response.data = (List<CiudadDTO>)result;
                return StatusCode(200, response);
            }
            catch (Exception ex)
            {
                response.success = false;
                response.errMsj = ex.Message;
                return StatusCode(500, response);
            }
        }

        [HttpPost("[action]")]
        public async Task<ActionResult<ApiResponse<List<ProgramacionVueloDTO>>>> getListProgramacion([FromBody] searchProgramacionVueloDTO searchProgramacionVuelo)
        {
            ApiResponse<List<ProgramacionVueloDTO>> response = new ApiResponse<List<ProgramacionVueloDTO>>();

            try
            {
                var result = await service.getListProgramacion(searchProgramacionVuelo);

                response.success = true;
                response.data = (List<ProgramacionVueloDTO>)result;
                return StatusCode(200, response);
            }
            catch (Exception ex)
            {
                response.success = false;
                response.errMsj = ex.Message;
                return StatusCode(500, response);
            }
        }

        [HttpGet("[action]")]
        public async Task<ActionResult<ApiResponse<ProgramacionVueloCantDTO>>> getDisponibilidadAsientos(int nIdProgramacionVuelo)
        {
            ApiResponse<ProgramacionVueloCantDTO> response = new ApiResponse<ProgramacionVueloCantDTO>();

            try
            {
                var result = await service.getDisponibilidadAsientos(nIdProgramacionVuelo);

                response.success = true;
                response.data = (ProgramacionVueloCantDTO)result;
                return StatusCode(200, response);
            }
            catch (Exception ex)
            {
                response.success = false;
                response.errMsj = ex.Message;
                return StatusCode(500, response);
            }
        }
    }
}
