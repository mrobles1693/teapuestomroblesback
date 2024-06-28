using BussinesLogic.Interfaces;
using Repository.Interfaces;
using Domain;
using backend.domain;

namespace BussinesLogic
{
    public class ReservaBL  : IReservaBL
    {
        IReservaRepository repository;

        public ReservaBL(IReservaRepository _repository)
        {
            this.repository = _repository;
        }

        public async Task<SqlRspDTO> insReserva(InsReservaDTO insReserva)
        {
            return await repository.insReserva(insReserva);
        }

        public async Task<SqlRspDTO> insPasajero(InsPasajeroDTO insPasajero)
        {
            return await repository.insPasajero(insPasajero);
        }
    }
}
