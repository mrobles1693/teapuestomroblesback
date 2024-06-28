using BussinesLogic.Interfaces;
using Domain;
using Repository.Interfaces;

namespace BussinesLogic
{
    public class RutaBL : IRutaBL
    {
        IRutaRepository repository;

        public RutaBL(IRutaRepository _repository)
        {
            this.repository = _repository;
        }

        public async Task<IList<CiudadDTO>> getListOrigen()
        {
            return await this.repository.getListOrigen();
        }

        public async Task<IList<CiudadDTO>> getListDestino(int nIdCiudadOrigen)
        {
            return await this.repository.getListDestino(nIdCiudadOrigen);
        }

        public async Task<IList<ProgramacionVueloDTO>> getListProgramacion(int nIdCiudadOrigen, int nIdCiudadDestino)
        {
            return await this.repository.getListProgramacion(nIdCiudadOrigen, nIdCiudadDestino);
        }

        public async Task<ProgramacionVueloCantDTO> getDisponibilidadAsientos(int nIdProgramacionVuelo)
        {
            return await this.repository.getDisponibilidadAsientos(nIdProgramacionVuelo);
        }
    }
}
