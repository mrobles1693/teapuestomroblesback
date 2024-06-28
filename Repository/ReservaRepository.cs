using Dapper;
using Domain;
using Microsoft.Extensions.Configuration;
using Repository.Interfaces;
using System.Data.SqlClient;
using System.Data;
using backend.domain;

namespace Repository
{
    public class ReservaRepository : IReservaRepository
    {
        private readonly IConfiguration _configuration;

        public ReservaRepository(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<SqlRspDTO> insReserva(InsReservaDTO insReserva)
        {
            SqlRspDTO res = new SqlRspDTO();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_reserva]", 1);
                parameters.Add("nCantidadPax", insReserva.nCantidadPax);
                parameters.Add("nIdProgramacionVueloIda", insReserva.nIdProgramacionVueloIda);
                parameters.Add("nIdProgramacionVueloVuelta", insReserva.nIdProgramacionVueloVuelta);

                res = await connection.QuerySingleAsync<SqlRspDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return res;
        }

        public async Task<SqlRspDTO> cancelarReserva(int nIdReserva)
        {
            SqlRspDTO res = new SqlRspDTO();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_reserva]", 2);
                parameters.Add("nIdReserva", nIdReserva);

                res = await connection.QuerySingleAsync<SqlRspDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return res;
        }

        public async Task<SqlRspDTO> finalizarReserva(int nIdReserva)
        {
            SqlRspDTO res = new SqlRspDTO();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_reserva]", 3);
                parameters.Add("nIdReserva", nIdReserva);

                res = await connection.QuerySingleAsync<SqlRspDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return res;
        }

        public async Task<SqlRspDTO> insPasajero(InsPasajeroDTO insPasajero)
        {
            SqlRspDTO res = new SqlRspDTO();

            using (SqlConnection connection = new SqlConnection(_configuration.GetConnectionString("cnBD")))
            {
                DynamicParameters parameters = new();
                string storedProcedure = string.Format("{0};{1}", "[dbo].[pa_reserva_pasajero]", 1);
                parameters.Add("nIdReserva", insPasajero.nIdReserva);
                parameters.Add("bPrincipal", insPasajero.bPrincipal);
                parameters.Add("sDNI", insPasajero.sDNI);
                parameters.Add("sPasaporte", insPasajero.sPasaporte);
                parameters.Add("sApellidoP", insPasajero.sApellidoP);
                parameters.Add("sApellidoM", insPasajero.sApellidoM);
                parameters.Add("sPriNombre", insPasajero.sPriNombre);
                parameters.Add("sSegNombre", insPasajero.sSegNombre);
                parameters.Add("sCelular", insPasajero.sCelular);
                parameters.Add("sCorreo", insPasajero.sCorreo);
                parameters.Add("dFechaNacimiento", insPasajero.dFechaNacimiento);

                res = await connection.QuerySingleAsync<SqlRspDTO>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }

            return res;
        }
    }
}
