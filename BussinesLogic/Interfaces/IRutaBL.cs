using Domain;

namespace BussinesLogic.Interfaces
{
    public interface IRutaBL
    {
        Task<IList<CiudadDTO>> getListOrigen();
        Task<IList<CiudadDTO>> getListDestino(int nIdCiudadOrigen);
        Task<IList<ProgramacionVueloDTO>> getListProgramacion(searchProgramacionVueloDTO searchProgramacionVuelo);
        Task<int> getPrecioFinal(getPrecioProgramacioVueloDTO getPrecioProgramacion);
    }
}
