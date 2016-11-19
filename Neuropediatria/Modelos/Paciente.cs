using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Neuropediatria.Modelos
{
    public class Paciente
    {
        public string id { get; set; }
        public Candidato candidato { get; set; }
        public string idFicha { get; set; }
        public string idUsuario { get; set; }

        public Paciente() { }

        public Paciente(string id, Candidato candidato, string idFicha, string idUsuario)
        {
            this.id = id;
            this.candidato = candidato;
            this.idFicha = idFicha;
            this.idUsuario = idUsuario;
        }
    }
}