using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Neuropediatria.Modelos
{
    [Serializable]
    public class Paciente
    {
        public string idCandidato { get; set; }
        public string idFicha { get; set; }
        public bool ativo { get; set; }
        public string dsNome { get; set; }
        public DateTime dtNascimento { get; set; }
        public string dsPatologia { get; set; }
        public string dsNomeAluno { get; set; }
        public string dtAlocacao { get; set; }
    }
}