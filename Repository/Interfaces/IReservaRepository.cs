using backend.domain;
using Domain;

namespace Repository.Interfaces
{
    public interface IReservaRepository
    {
        Task<SqlRspDTO> insReserva(InsReservaDTO insReserva);
        Task<SqlRspDTO> insPasajero(InsPasajeroDTO insPasajero);
    }
}
