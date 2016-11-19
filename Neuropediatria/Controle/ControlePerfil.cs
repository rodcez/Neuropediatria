using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Neuropediatria.Controle
{
    public class ControlePerfil : Page
    {
        public void Validacoes (string modulo)
        {
            validaLogin();

            var appSett = ConfigurationManager.AppSettings;
            Dictionary<string, bool> modulos = new Dictionary<string, bool>();

            modulos.Add("Relatorios", Convert.ToBoolean(appSett["Relatorios"]));
            modulos.Add("Candidatos", Convert.ToBoolean(appSett["Candidatos"]));
            modulos.Add("Pacientes", Convert.ToBoolean(appSett["Pacientes"]));
            modulos.Add("MeusPacientes", Convert.ToBoolean(appSett["MeusPacientes"]));
            modulos.Add("Usuarios", Convert.ToBoolean(appSett["Usuarios"]));

            if(!string.IsNullOrEmpty(modulo) && !modulos.First(x => x.Key == modulo).Value)
                Response.Redirect("~/Conta/Login.aspx?msg=2");
        }

        private void validaLogin()
        {
            var usuario = Request.Cookies["login"];

            var appSett = ConfigurationManager.AppSettings;

            if (usuario == null || !usuario.Value.Equals(appSett["ChaveMD5"]))
                Response.Redirect("~/Conta/Login.aspx?msg=1");
        }
    }
}