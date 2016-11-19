using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Neuropediatria.Modelos
{
    public class Candidato
    {
        public string id { get; set; }
        public string nome { get; set; }
        public int idade { get; set; }
        public string patologia { get; set; }
        public string status { get; set; }

        public Candidato () { }

        public Candidato (string id, string nome, int idade, string patologia, bool status)
        {
            this.id = id;
            this.nome = nome;
            this.idade = idade;
            this.patologia = patologia;
            this.status = status ? "Novo" : "Paciente";
        }
    }
}