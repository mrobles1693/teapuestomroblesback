using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class InsReservaDTO
    {
        public int nCantidadPax { get; set; }
        public int nIdProgramacionVueloIda { get; set; }
        public int? nIdProgramacionVueloVuelta { get; set; }
    }

    public class InsPasajeroDTO
    {
        public int nIdReserva { get; set; }
        public bool bPrincipal { get; set; }
        public string? sDNI { get; set; }
        public string? sPasaporte { get; set; }
        public string sApellidoP { get; set; }
        public string sApellidoM { get; set; }
        public string sPriNombre { get; set; }
        public string? sSegNombre { get; set; }
        public string sCelular { get; set; }
        public string sCorreo { get; set; }
        public DateTime dFechaNacimiento { get; set; }
    }
}
