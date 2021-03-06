﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Neuropediatria
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var appSett = ConfigurationManager.AppSettings;

            navRelatorio.Visible = false;
            //navRelatorio.Visible = Convert.ToBoolean(appSett["Relatorios"]);
            navCandidatos.Visible = Convert.ToBoolean(appSett["Candidatos"]);
            navPacientes.Visible = Convert.ToBoolean(appSett["Pacientes"]);
            navMeusPacientes.Visible = Convert.ToBoolean(appSett["MeusPacientes"]);
            navUsuarios.Visible = Convert.ToBoolean(appSett["Usuarios"]);
            navLogin.Visible = !Convert.ToBoolean(appSett["LoginAtivo"]);
            navSair.Visible = Convert.ToBoolean(appSett["LoginAtivo"]);
        }

        public void mostrarCarregando(string mensagem)
        {
            ocultarPaineis();
            panelCarregando.Visible = true;
            mensagemCarregando.Text = mensagem;
        }

        public void mostrarSucesso(string mensagem)
        {
            ocultarPaineis();
            panelSucesso.Visible = true;
            mensagemSucesso.Text = mensagem;
        }

        public void mostrarErro(string mensagem)
        {
            ocultarPaineis();
            panelErro.Visible = true;
            mensagemErro.Text = mensagem;
        }

        public void ocultarPaineis()
        {
            panelCarregando.Visible = false;
            panelSucesso.Visible = false;
            panelErro.Visible = false;
        }

        public void LoginAtivo(bool value)
        {
            var appSett = ConfigurationManager.AppSettings;

            ConfigurationManager.AppSettings.Set("LoginAtivo", value.ToString());

            if (!value)
            {
                appSett.Set("IdUsuario", value.ToString());
                appSett.Set("chaveMD5", value.ToString());
                appSett.Set("Relatorios", value.ToString());
                appSett.Set("Candidatos", value.ToString());
                appSett.Set("Pacientes", value.ToString());
                appSett.Set("MeusPacientes", value.ToString());
                appSett.Set("Usuarios", value.ToString());
            }
        }
    }
}