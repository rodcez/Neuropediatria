using Neuropediatria.Controle;
using Neuropediatria.Modelos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Candidatos
{
    public partial class ListaCandidatos : ControlePerfil
    {
        public string idCandidatoVS
        {
            get { return (string)(ViewState["idCandidatoVS"] ?? string.Empty); }
            set { ViewState["idCandidatoVS"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Validacoes("Candidatos");
            if (IsPostBack) return;

            /* TODO
             
             * Fazer alguma verificação se ele já foi paciente 
             
             */

            populaGrid();
        }

        protected void maisCandidato_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Candidatos/NovoCandidato.aspx");
        }

        private void populaGrid(string ordem = "")
        {
            try
            {
                var query = "SELECT C.idCandidato, C.dsNome, C.dtNascimento, h.dsPatologia, C.isPaciente " +
                            "FROM tb_Candidato as C " +
                            "JOIN tb_Historico as H on(c.idHistorico = h.idHistorico) " +
                            "WHERE (C.isPaciente is NULL OR C.isPaciente = 0) ";

                if (!string.IsNullOrEmpty(ordem))
                    query += "order by " + ordem + " ASC";


                gvCandidatos.DataSource = ServicosDB.Instancia.ExecutarSelect(query);
                gvCandidatos.DataBind();

                (Master as Site).ocultarPaineis();
            }
            catch (Exception e)
            {
                (Master as Site).mostrarErro("Erro:" + e.Message);
            }
        }

        protected void gvCandidatos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "visuCandidato")
            {
                var index = int.Parse((string)e.CommandArgument);
                var idCandidato = gvCandidatos.DataKeys[index]["idCandidato"].ToString();

                visualizarCandidato(idCandidato);
            }
            else if (e.CommandName == "candPaciente")
            {
                var index = int.Parse((string)e.CommandArgument);
                idCandidatoVS = gvCandidatos.DataKeys[index]["idCandidato"].ToString();

                (Master as Site).mostrarCarregando("Deseja mesmo transformar o CANDIDATO: <strong>" + gvCandidatos.DataKeys[index]["dsNome"].ToString() + "</strong> em PACIENTE?");
                btnsConfirmar.Visible = true;
            }
        }

        protected void btnSim_Click(object sender, EventArgs e)
        {
            btnsConfirmar.Visible = false;
            (Master as Site).ocultarPaineis();
            tranformarCandidato(idCandidatoVS);
            idCandidatoVS = string.Empty;
        }

        protected void btnNao_Click(object sender, EventArgs e)
        {
            btnsConfirmar.Visible = false;
            (Master as Site).ocultarPaineis();
        }

        private void tranformarCandidato(string idCandidato)
        {
            try
            {
                var query = string.Format("UPDATE tb_Candidato SET isPaciente = {0} WHERE idCandidato = {1}", 
                                          1, idCandidato);

                ServicosDB.Instancia.ExecutarAtualizacao(query);

                (Master as Site).ocultarPaineis();

                populaGrid();

                Response.Redirect("~/Pacientes/ListaPacientes.aspx");
            }
            catch (Exception e)
            {
                (Master as Site).mostrarErro("Erro:" + e.Message);
            }
        }

        private void visualizarCandidato(string idCandidato)
        {
            Response.Redirect("~/Candidatos/NovoCandidato.aspx?id=" + idCandidato);
        }

        protected void ordenaLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            populaGrid(((ListControl)sender).SelectedValue);
        }
        
    }
}