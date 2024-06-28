using backend.domain;
using Domain;

namespace BussinesLogic.Interfaces
{
    public interface IReservaBL
    {
        Task<SqlRspDTO> insReserva(InsReservaDTO insReserva);
        Task<SqlRspDTO> insPasajero(InsPasajeroDTO insPasajero);
    }
}
