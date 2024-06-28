using Domain;

namespace Repository.Interfaces
{
    public interface IRutaRepository
    {
        Task<IList<CiudadDTO>> getListOrigen();
        Task<IList<CiudadDTO>> getListDestino(int nIdCiudadOrigen);
        Task<IList<ProgramacionVueloDTO>> getListProgramacion(int nIdCiudadOrigen, int nIdCiudadDestino);
        Task<ProgramacionVueloCantDTO> getDisponibilidadAsientos(int nIdProgramacionVuelo);
    }
}
