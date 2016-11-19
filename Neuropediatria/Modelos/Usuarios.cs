using System;

namespace Neuropediatria.Modelos
{
    [Serializable]

    public class Usuarios
    {
        public string ativo { get; set; }
        public string dsNomeAluno { get; set; }
        public string dsNomeFuncionario { get; set; }
        public string dsPerfil { get; set; }
        public string dsUsuario { get; set; }
        public string idUsuario { get; set; }
    }
}