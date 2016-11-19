using Neuropediatria.Controle;
using Neuropediatria.Modelos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Pacientes
{
    public partial class ListaPacientes : ControlePerfil
    {
        public int idPacienteVS
        {
            get { return (int)(ViewState["idPacienteVS"] ?? 0); }
            set { ViewState["idPacienteVS"] = value; }
        }

        public List<string> listaFichaAtivaVS
        {
            get {
                if ((List<string>)ViewState["listaFichaAtivaVS"] == null)
                    ViewState["listaFichaAtivaVS"] = new List<string>();

                return (List<string>)(ViewState["listaFichaAtivaVS"]);
            }
            set { ViewState["idPacienteVS"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            /*
             TODO

            Colocar uma Flag pra ativar ou não todas as fichas [Ativa e não ativa]
            Ver para colocar o botão dar alta e pensar no esquema de ativar e desativar paciente
            Mudar o excluir para "Candidato" e trocar o nome da coluna para "Tranformar em"   
             
             */

            Validacoes("Pacientes");

            if (IsPostBack) return;

            populaGrid(string.Empty);
        }

        private void populaGrid(string ordem)
        {
            try
            {
                var query = "SELECT C.idCandidato, C.dsNome, C.dtNascimento, H.dsPatologia, C.dtAlocacao, E.dsNomeAluno, C.idFicha " +
                            "FROM tb_Candidato as C " +
                            "LEFT JOIN tb_Historico as H on(c.idHistorico = h.idHistorico) " +
                            "LEFT JOIN tb_Estagio as E on(c.idEstagio = E.idEstagio) " +
                            "WHERE isPaciente = 1 ";

                if (!string.IsNullOrEmpty(ordem))
                    query += "order by " + ordem + " ASC";


                List<Paciente> listaPaciente = new List<Paciente>();

                SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

                while (sqlReader.Read())
                {
                    listaPaciente.Add(new Paciente {
                        idCandidato = sqlReader["idCandidato"].ToString(),
                        idFicha = sqlReader["idFicha"].ToString(),
                        dsNome = sqlReader["dsNome"].ToString(),
                        dtNascimento = Convert.ToDateTime(sqlReader["dtNascimento"].ToString()),
                        dsPatologia = sqlReader["dsPatologia"].ToString(),
                        dtAlocacao = Convert.ToDateTime(sqlReader["dtNascimento"].ToString()),
                        dsNomeAluno = sqlReader["dsNomeAluno"].ToString(),
                    });
                }
                
                var queryFicha = "SELECT idFicha FROM tb_Ficha WHERE ativa = 1";

                SqlDataReader sqlReaderFicha = ServicosDB.Instancia.ExecutarSelect(queryFicha);

                while (sqlReaderFicha.Read())
                    foreach (Paciente p in listaPaciente)
                        p.ativo = p.idFicha.Equals(sqlReaderFicha["idFicha"].ToString());

                gvPacientes.DataSource = listaPaciente;
                gvPacientes.DataBind();

                (Master as Site).ocultarPaineis();

                if (!sqlReader.HasRows)
                    (Master as Site).mostrarErro("Nenhum paciente encontrado.");

            }
            catch (Exception e)
            {
                (Master as Site).mostrarErro("Erro:" + e.Message);
            }
        }

        protected void gvPacientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "visuCandidato")
            {
                var index = int.Parse((string)e.CommandArgument);
                idPacienteVS = int.Parse(gvPacientes.DataKeys[index]["idCandidato"].ToString());

                visualizarCandidato(idPacienteVS);
            }
            else if (e.CommandName == "fichaCandidato")
            {
                var index = int.Parse((string)e.CommandArgument);

                var idFicha = gvPacientes.DataKeys[index]["idFicha"].ToString();

                idPacienteVS = int.Parse(gvPacientes.DataKeys[index]["idCandidato"].ToString());

                if(string.IsNullOrEmpty(idFicha))
                {
                    (Master as Site).mostrarCarregando("O Paciente: <strong>" + gvPacientes.DataKeys[index]["dsNome"].ToString() + "</strong> não foi alocado a nenhum Estagiário, gostaria de alocar o paciente?");
                    btnsConfirmar.Visible = true;

                    return;
                }

                verFichaCandidato(idPacienteVS);
            }
        }

        private void visualizarCandidato(int idCandidato)
        {
            Response.Redirect("~/Candidatos/NovoCandidato.aspx?id=" + idCandidato);
        }

        protected void btnSim_Click(object sender, EventArgs e)
        {
            btnsConfirmar.Visible = false;
            (Master as Site).ocultarPaineis();
            Response.Redirect("~/Candidatos/NovoCandidato.aspx?id=" + idPacienteVS);
        }

        protected void btnNao_Click(object sender, EventArgs e)
        {
            btnsConfirmar.Visible = false;
            (Master as Site).ocultarPaineis();
        }

        private void verFichaCandidato(int idCandidato)
        {
            Response.Redirect("~/Pacientes/FichaPaciente.aspx?id=" + idCandidato);
        }

        protected void ordenaLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            populaGrid(((ListControl)sender).SelectedValue);
        }

        protected void gvPacientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToBoolean(e.Row.Cells[0].Text))
                    e.Row.Cells[0].BackColor = e.Row.Cells[0].ForeColor = System.Drawing.Color.LimeGreen;
                else
                    e.Row.Cells[0].BackColor = e.Row.Cells[0].ForeColor = System.Drawing.Color.OrangeRed;
            }
        }

        class Paciente
        {
            public string idCandidato { get; set; }
            public string idFicha { get; set; }
            public bool ativo { get; set; }
            public string dsNome { get; set; }
            public DateTime dtNascimento { get; set; }
            public string dsPatologia { get; set; }
            public string dsNomeAluno { get; set; }
            public DateTime dtAlocacao { get; set; }
        }
    }
}
