using Dapper;
using Microsoft.Extensions.Configuration;
using Repository.Interfaces;
using System.Data.SqlClient;
using System.Data;
using Domain;

namespace Repository
{
    public class RutaRepository : IRutaRepository
    {
        private readonly IConfiguration _configuration;

        public RutaRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<IList<CiudadDTO>> getListOrigen()
        {
            IEnumerable<CiudadDTO> list = new List<CiudadDTO>();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_ruta]", 1);

                list = await connection.QueryAsync<CiudadDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return list.ToList();
        }

        public async Task<IList<CiudadDTO>> getListDestino(int nIdCiudadOrigen)
        {
            IEnumerable<CiudadDTO> list = new List<CiudadDTO>();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_ruta]", 2);
                parameters.Add("nIdCiudadOrigen", nIdCiudadOrigen);

                list = await connection.QueryAsync<CiudadDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return list.ToList();
        }

        public async Task<IList<ProgramacionVueloDTO>> getListProgramacion(int nIdCiudadOrigen, int nIdCiudadDestino)
        {
            IEnumerable<ProgramacionVueloDTO> list = new List<ProgramacionVueloDTO>();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_ruta]", 3);
                parameters.Add("nIdCiudadOrigen", nIdCiudadOrigen);
                parameters.Add("nIdCiudadDestino", nIdCiudadDestino);

                list = await connection.QueryAsync<ProgramacionVueloDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return list.ToList();
        }

        public async Task<ProgramacionVueloCantDTO> getDisponibilidadAsientos(int nIdProgramacionVuelo)
        {
            ProgramacionVueloCantDTO res = new ProgramacionVueloCantDTO();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_ruta]", 4);
                parameters.Add("nIdProgramacionVuelo", nIdProgramacionVuelo);

                res = await connection.QuerySingleAsync<ProgramacionVueloCantDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return res;
        }

    }
}
