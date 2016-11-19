using Neuropediatria.Controle;
using Neuropediatria.Modelos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
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

        public List<Paciente> listaCSV
        {
            get {
                if ((List<Paciente>)ViewState["listaCSV"] == null)
                    ViewState["listaCSV"] = new List<Paciente>();

                return (List<Paciente>)(ViewState["listaCSV"]);
            }
            set { ViewState["listaCSV"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            /*
             TODO

            Ver para colocar o botão dar alta e pensar no esquema de ativar e desativar paciente
            Mudar o excluir para "Candidato" e trocar o nome da coluna para "Tranformar em"   
             
             */

            Validacoes("Pacientes");

            var perfil = ConfigurationManager.AppSettings["Perfil"].ToString();
            btExportar.Visible = perfil == "coordenador" || perfil == "admin";

            if (IsPostBack) return;

            populaGrid(string.Empty);
        }

        private void populaGrid(string ordem, bool regraAtivo = false)
        {
            try
            {
                var query = "SELECT C.idCandidato, C.dsNome, C.dtNascimento, H.dsPatologia, C.dtAlocacao, E.dsNomeAluno, F.idFicha   " +
                            "FROM tb_Ficha as F " +
                            "RIGHT JOIN tb_Candidato as C on(c.idCandidato = f.idPaciente) " +
                            "LEFT JOIN tb_Historico as H on(c.idHistorico = h.idHistorico) " +
                            "LEFT JOIN tb_Estagio as E on(c.idEstagio = E.idEstagio) " +
                            "WHERE isPaciente = 1";

                if (!string.IsNullOrEmpty(ordem))
                    query += "order by " + ordem + " ASC";

                List<Paciente> listaPaciente = new List<Paciente>();

                SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

                while (sqlReader.Read())
                {
                    var alocacao = string.IsNullOrEmpty(sqlReader["dtAlocacao"].ToString()) ? string.Empty : Convert.ToDateTime(sqlReader["dtAlocacao"].ToString()).ToString("dd/M/yyyy");

                    listaPaciente.Add(new Paciente {
                        idCandidato = sqlReader["idCandidato"].ToString(),
                        idFicha = sqlReader["idFicha"].ToString(),
                        dsNome = sqlReader["dsNome"].ToString(),
                        dtNascimento = Convert.ToDateTime(sqlReader["dtNascimento"].ToString()),
                        dsPatologia = sqlReader["dsPatologia"].ToString(),
                        dtAlocacao = alocacao,
                        dsNomeAluno = sqlReader["dsNomeAluno"].ToString(),
                    });
                }
                
                var queryFicha = "SELECT idFicha FROM tb_Ficha WHERE ativa = 1";

                SqlDataReader sqlReaderFicha = ServicosDB.Instancia.ExecutarSelect(queryFicha);

                while (sqlReaderFicha.Read())
                {
                    foreach (Paciente p in listaPaciente)
                    {
                        p.ativo = p.idFicha.Equals(sqlReaderFicha["idFicha"].ToString());

                        if(!p.ativo)
                        {
                            p.dtAlocacao = string.Empty;
                            p.dsNomeAluno = string.Empty;
                        }
                    }
                }

                if (regraAtivo)
                {
                    List<Paciente> listaPacienteTemp = listaPaciente.Where(x => x.ativo == true).ToList();

                    listaPaciente.Clear();
                    listaPaciente = listaPacienteTemp;
                }

                listaCSV = listaPaciente;
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
            else if (e.CommandName == "excluirPaciente")
            {
                ExcluirPaciente();
            }
        }

        private void ExcluirPaciente()
        {
            
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
        protected void visuTodos_CheckedChanged(object sender, EventArgs e)
        {
            if (visuTodos.Checked)
                populaGrid(string.Empty, true);
            else
                populaGrid(string.Empty, false);
        }

        protected void btExportar_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition",
             "attachment;filename=ListaPacientes.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";

            gvPacientes.AllowPaging = false;
            gvPacientes.DataBind();

            StringBuilder sb = new StringBuilder();

            sb.Append("Ativo, Nome Candidato, Data de Nascimento ,Patologia, Nome Estagiario, Data de Alocacao");
            sb.Append("\r\n");

            foreach (var item in listaCSV)
            {
                sb.Append(string.Format("{0}, {1}, {2}, {3}, {4}, {5}", 
                    item.ativo, item.dsNome, item.dtNascimento, item.dsPatologia, item.dsNomeAluno, item.dtAlocacao));
                sb.Append("\r\n");
            }

            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();

        }
    }
}
