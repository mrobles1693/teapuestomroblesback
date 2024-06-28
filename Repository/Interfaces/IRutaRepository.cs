using Domain;

namespace Repository.Interfaces
{
    public interface IRutaRepository
    {
        Task<IList<CiudadDTO>> getListOrigen();
        Task<IList<CiudadDTO>> getListDestino(int nIdCiudadOrigen);
        Task<IList<ProgramacionVueloDTO>> getListProgramacion(searchProgramacionVueloDTO searchProgramacionVuelo);
        Task<int> getPrecioFinal(getPrecioProgramacioVueloDTO getPrecioProgramacion);
    }
}
