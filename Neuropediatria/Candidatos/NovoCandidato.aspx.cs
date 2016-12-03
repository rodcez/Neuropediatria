using Neuropediatria.Controle;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Candidatos
{
    public partial class NovoCandidato : ControlePerfil
    {
        public int idCandidatoVS
        {
            get { return (int)(ViewState["idCandidatoVS"] ?? 0); }
            set { ViewState["idCandidatoVS"] = value; }
        }

        public int idHistoricoVS
        {
            get { return (int)(ViewState["idHistoricoVS"] ?? 0); }
            set { ViewState["idHistoricoVS"] = value; }
        }

        public int idFichaVS
        {
            get { return (int)(ViewState["idFichaVS"] ?? 0); }
            set { ViewState["idFichaVS"] = value; }
        }
        
        public bool isPaciente
        {
            get { return Convert.ToBoolean(ViewState["isPaciente"]); }
            set { ViewState["isPaciente"] = value; }
        }
        public int isPacienteVS
        {
            get { return (int)(ViewState["isPacienteVS"] ?? 0); }
            set { ViewState["isPacienteVS"] = value; }
        }

        public int idEstagiarioVS
        {
            get { return (int)(ViewState["idEstagiarioVS"] ?? 0); }
            set { ViewState["idEstagiarioVS"] = value; }
        }
        
        public string dtAlocacaoVS
        {
            get { return Convert.ToString(ViewState["dtAlocacaoVS"]); }
            set { ViewState["dtAlocacaoVS"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Validacoes("Candidatos");
            tabelaConteudo.Enabled = true;

            if (IsPostBack) return;

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                getCandidato(Request.QueryString["id"]);
            }
            else
                cabecalho.Text = "<h1>Candidato</h1>";
        }

        private void getCandidato(string idCandidato)
        {
            (Master as Site).mostrarCarregando("Carregando dados...");

            int id;

            if (!int.TryParse(idCandidato, out id))
            {
                (Master as Site).mostrarErro("Dados inválidos!");
                return;
            }

            idCandidatoVS = id;

            var query = string.Format("PopulaCandidatoPaciente {0}", id);

            SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

            if (sqlReader.Read())
            {
                dsNome.Text = sqlReader["dsNome"].ToString();
                dtNascimento.Text = Convert.ToDateTime(sqlReader["dtNascimento"]).ToString("yyyy-MM-dd");
                numTelefone.Text = sqlReader["numTelefone"].ToString();
                dsResponsavel.Text = sqlReader["dsResponsavel"].ToString();
                dsPatologia.Text = sqlReader["dsPatologia"].ToString();
                isPacienteVS = int.Parse(sqlReader["isPaciente"].ToString());
                isPaciente = Convert.ToBoolean(isPacienteVS);
                idHistoricoVS = int.Parse(sqlReader["idHistorico"].ToString());
                dtAlocacaoVS = sqlReader["dtAlocacao"].ToString();
                idFichaVS = int.Parse(string.IsNullOrEmpty(sqlReader["idFicha"].ToString()) ? "0" : sqlReader["idFicha"].ToString());

                if (idFichaVS != 0)
                    idEstagiarioVS = int.Parse(sqlReader["idEstagio"].ToString());


                cabecalho.Text = isPaciente ? "<h1>Paciente</h1>" : "<h1>Candidato</h1>";

                (Master as Site).ocultarPaineis();
            }
            else
            {
                (Master as Site).mostrarErro("Nenhum resultado encontrado!");
                cabecalho.Text = "<h1>Candidato</h1>";
                return;
            }

            if (isPaciente)
            {
                populaEstagiarios();

                if(idFichaVS != 0)
                {
                    dtAlocacao.Text = Convert.ToDateTime(dtAlocacaoVS).ToString("yyyy-MM-dd");
                    ddEstagiario.SelectedValue = idEstagiarioVS.ToString();
                }
            }
        }

        private void populaEstagiarios()
        {
            var query = "SELECT idEstagio, dsNomeAluno " +
                        "FROM tb_Estagio as E " +
                        "JOIN tb_Usuario as C on(C.idUsuario = E.idUsuario) " +
                        "WHERE C.ativo = 1 ";

            ddEstagiario.DataSource = ServicosDB.Instancia.ExecutarSelect(query);
            ddEstagiario.DataTextField = "dsNomeAluno";
            ddEstagiario.DataValueField = "idEstagio";
            ddEstagiario.DataBind();

            ddEstagiario.Items.Insert(0, new ListItem("Selecione...", "0"));

            alocacao.Visible = true;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            (Master as Site).mostrarCarregando("Carregando...");

            Page.Validate();

            if (!Page.IsValid)
            {
                (Master as Site).mostrarErro("Campos com > ! < São obrigatórios!");
                return;
            }

            DateTime tempData;

            if(!DateTime.TryParse(dtNascimento.Text, out tempData))
            {
                (Master as Site).mostrarErro("Data de nascimento inválida!");
                return;
            }

            tempData = new DateTime(1900,01,01);

            if (DateTime.Compare(Convert.ToDateTime(dtNascimento.Text), tempData) < 0)
            {
                (Master as Site).mostrarErro("Data de nascimento inválida!");
                return;
            }

            if (DateTime.Compare(Convert.ToDateTime(dtNascimento.Text), DateTime.Now) > 0)
            {
                (Master as Site).mostrarErro("Data de nascimento inválida!");
                return;
            }

            long telefoneValido;
            if (numTelefone.Text.Length < 8 || !long.TryParse(numTelefone.Text, out telefoneValido))
            {
                (Master as Site).mostrarErro("Telefone inválido");
                return;
            }

            salvarCandidato();
        }

        private void salvarCandidato()
        {
            if (isPaciente)
            {
                if (ddEstagiario.SelectedIndex == 0 || string.IsNullOrEmpty(dtAlocacao.Text))
                {
                    (Master as Site).mostrarErro("É necessário informar o Estagiário e a Data de alocação!");
                    return;
                }
            }

            Dictionary<string, dynamic> sqlParameters = new Dictionary<string, dynamic>();

            sqlParameters.Add("@idCanditato", idCandidatoVS);
            sqlParameters.Add("@isPaciente", isPacienteVS);
            sqlParameters.Add("@dsNome", dsNome.Text);
            sqlParameters.Add("@dtNascimento", Convert.ToDateTime(dtNascimento.Text));
            sqlParameters.Add("@numTelefone", numTelefone.Text);
            sqlParameters.Add("@dsResponsavel", dsResponsavel.Text);
            sqlParameters.Add("@idHistorico", idHistoricoVS);
            sqlParameters.Add("@dsPatologia", dsPatologia.Text);

            var validacaoDados = ServicosDB.Instancia.ExecutarProcedure("InsertUpdateNovoCandidato", sqlParameters);

            if (validacaoDados <= 0)
            {
                (Master as Site).mostrarErro("Ocorreu um erro ao adicionar/atualizar!");
                tabelaConteudo.Enabled = true;
                return;
            }

            if (isPaciente)
            {
                tabelaConteudo.Enabled = false;
                AlocarPaciente(idCandidatoVS, ddEstagiario.SelectedValue, Convert.ToDateTime(dtAlocacao.Text));
                return;
            }


            (Master as Site).mostrarSucesso("Dados Salvos com sucesso!");

            tabelaConteudo.Enabled = true;

            if (isPaciente)
                Response.Redirect("~/Pacientes/ListaPacientes.aspx");
            else
                Response.Redirect("~/Candidatos/ListaCandidatos.aspx");
        }

        private void AlocarPaciente(int idCandidato, string idEstagiario, DateTime dataAlocacao)
        {
            if (DateTime.Compare(Convert.ToDateTime(dtAlocacao.Text), DateTime.Now.Date) < 0)
            {
                (Master as Site).mostrarErro("Data de alocação inválida!");
                tabelaConteudo.Enabled = true;
                return;
            }

            Dictionary<string, dynamic> sqlParameters = new Dictionary<string, dynamic>();

            sqlParameters.Add("@idCandidato", idCandidato);
            sqlParameters.Add("@idEstagio", idEstagiario);
            sqlParameters.Add("@dataAlocacao", dataAlocacao);

            var validacao = ServicosDB.Instancia.ExecutarProcedure("AlocarPaciente", sqlParameters);

            if (validacao <= 0)
            {
                (Master as Site).mostrarErro("Ocorreu um erro ao alocar o estagiário.");
                tabelaConteudo.Enabled = true;
                return;
            }

            (Master as Site).mostrarSucesso("Alocação realizada com sucesso!");

            tabelaConteudo.Enabled = true;

            if (isPaciente)
                Response.Redirect("~/Pacientes/ListaPacientes.aspx");

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            if (isPaciente)
                Response.Redirect("~/Pacientes/ListaPacientes.aspx");
            else
                Response.Redirect("~/Candidatos/ListaCandidatos.aspx");

        }
    }
}