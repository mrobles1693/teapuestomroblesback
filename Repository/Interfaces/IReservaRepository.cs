using backend.domain;
using Domain;

namespace Repository.Interfaces
{
    public interface IReservaRepository
    {
        Task<SqlRspDTO> insReserva(InsReservaDTO insReserva);
        Task<SqlRspDTO> cancelarReserva(int nIdReserva);
        Task<SqlRspDTO> finalizarReserva(int nIdReserva);
        Task<SqlRspDTO> insPasajero(InsPasajeroDTO insPasajero);
    }
}
