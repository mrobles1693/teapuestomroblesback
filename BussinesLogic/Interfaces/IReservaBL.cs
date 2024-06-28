using backend.domain;
using Domain;

namespace BussinesLogic.Interfaces
{
    public interface IReservaBL
    {
        Task<SqlRspDTO> insReserva(InsReservaDTO insReserva);
        Task<SqlRspDTO> cancelarReserva(int nIdReserva);
        Task<SqlRspDTO> finalizarReserva(int nIdReserva);
        Task<SqlRspDTO> insPasajero(InsPasajeroDTO insPasajero);
    }
}
