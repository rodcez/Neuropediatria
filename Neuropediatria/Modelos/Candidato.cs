using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Neuropediatria.Modelos
{
    [Serializable]
    public class Candidato
    {
        public string idCandidato { get; set; }
        public string dsNome { get; set; }
        public DateTime dtNascimento { get; set; }
        public string dsPatologia { get; set; }
        public bool isPaciente { get; set; }
        public string status { get; set; }

    }
}