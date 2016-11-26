using Neuropediatria.Controle;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Neuropediatria
{
    public partial class Default : ControlePerfil
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Validacoes(string.Empty);
            if (IsPostBack) return;
                        
            var appSett = ConfigurationManager.AppSettings;

            btRelatorio.Visible = false;//Convert.ToBoolean(appSett["Relatorios"]);
            btCandidatos.Visible = Convert.ToBoolean(appSett["Candidatos"]);
            btPacientes.Visible = Convert.ToBoolean(appSett["Pacientes"]);
            btMeusPacientes.Visible = Convert.ToBoolean(appSett["MeusPacientes"]);
            btUsuarios.Visible = Convert.ToBoolean(appSett["Usuarios"]);
        }


        protected void btRelatorio_Click(object sender, EventArgs e)
        {
            //Response.Redirect("~/Relatorio/relatorios.aspx");
        }

        protected void btCandidatos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Candidatos/ListaCandidatos.aspx");
        }

        protected void btPacientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pacientes/ListaPacientes.aspx");
        }

        protected void btMeusPacientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pacientes/MeusPacientes.aspx");
        }
        protected void btUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Conta/ListaUsuarios.aspx");
        }

    }
}