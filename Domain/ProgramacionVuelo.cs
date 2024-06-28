﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class ProgramacionVueloDTO
    {
        public int nIdProgramacionVuelo { get; set; }
        public int nIdRuta { get; set; }
        public int nIdAeronave { get; set; }
        public DateTime dFechaProgramada { get; set; }
    }

    public class ProgramacionVueloCantDTO
    { 
        public int nCapacidad { get; set; }
        public int nPasajeros { get; set; }
    }
}
