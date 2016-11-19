using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Conta
{
    public partial class NovoUsuario : Page
    {
        public int idUsuarioVS
        {
            get { return (int)(ViewState["idUsuarioVS"] ?? 0); }
            set { ViewState["idUsuarioVS"] = value; }
        }

        public int idEstagiarioVS
        {
            get { return (int)(ViewState["idEstagiarioVS"] ?? 0); }
            set { ViewState["idEstagiarioVS"] = value; }
        }

        public int idFuncionarioVS
        {
            get { return (int)(ViewState["idFuncionarioVS"] ?? 0); }
            set { ViewState["idFuncionarioVS"] = value; }
        }

        public string senhaVS
        {
            get { return Convert.ToString(ViewState["senhaVS"]); }
            set { ViewState["senhaVS"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            cabecalho.Text = "<h1>Cadastro de Usuario</h1>";

            if (IsPostBack) return;

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                getUsuario(Request.QueryString["id"]);
        }

        private void getUsuario(string idUsuario)
        {
            int id;

            if (!int.TryParse(idUsuario, out id))
            {
                (Master as Site).mostrarErro("Dados inválidos!");
                return;
            }

            dsUsuario.Enabled = false;

            idUsuarioVS = id;

            var query = string.Format(  "SELECT U.idUsuario, U.dsUsuario, U.dsPerfil, U.ativo, F.idFuncionario, F.dsNomeFuncionario, E.idEstagio, E.dsNomeAluno, E.idRGM, E.idSupervisor, E.dtEstagioInicio, E.dtEstagioTermino " +
                                        "FROM tb_Usuario AS U " +
                                        "LEFT JOIN tb_Estagio AS E ON(E.idUsuario = U.idUsuario) " +
                                        "LEFT JOIN tb_Funcionario AS F ON(F.idUsuario = U.idUsuario) " +
                                        "WHERE U.idUsuario = {0}", id);

            SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

            if (sqlReader.Read())
            {
                idUsuarioVS = int.Parse(sqlReader["idUsuario"].ToString());
                dsUsuario.Text = sqlReader["dsUsuario"].ToString();
                ddPerfil.SelectedValue = sqlReader["dsPerfil"].ToString();
                visualizaTabs();

                if (sqlReader["dsPerfil"].ToString().Equals("estagiario"))
                {
                    idEstagiarioVS = int.Parse(sqlReader["idEstagio"].ToString());
                    dsNome.Text = sqlReader["dsNomeAluno"].ToString();
                    idRGM.Text = sqlReader["idRGM"].ToString();
                    ddCoordenador.SelectedValue = sqlReader["idSupervisor"].ToString();
                    dtEstagioInicio.Text = Convert.ToDateTime(sqlReader["dtEstagioInicio"]).ToString("yyyy-MM-dd");
                    dtEstagioTermino.Text = Convert.ToDateTime(sqlReader["dtEstagioTermino"]).ToString("yyyy-MM-dd");
                    eAtivo.Checked = Convert.ToBoolean(sqlReader["ativo"].ToString());
                }
                else
                {
                    dsNome.Text = sqlReader["dsNomeFuncionario"].ToString();
                    idFuncionarioVS = int.Parse(sqlReader["idFuncionario"].ToString());
                    var ativo = Convert.ToBoolean(sqlReader["ativo"].ToString());

                    if (ddCoordenador.SelectedValue.Equals("coordenador"))
                        cAtivo.Checked = ativo;
                    else
                        aAtivo.Checked = ativo;

                }

                //ativo

                (Master as Site).ocultarPaineis();
            }
            else
            {
                (Master as Site).mostrarErro("Nenhum resultado encontrado!");
                return;
            }
        }

        protected void ddPerfil_SelectedIndexChanged(object sender, EventArgs e)
        {
            visualizaTabs();
        }

        public void visualizaTabs ()
        {
            tbAdmin.Visible = ddPerfil.SelectedValue.Equals("admin");
            tbAux.Visible = ddPerfil.SelectedValue.Equals("auxiliar");
            tbCoord.Visible = ddPerfil.SelectedValue.Equals("coordenador");
            tbEstagiario.Visible = ddPerfil.SelectedValue.Equals("estagiario");
            tbUsuario.Visible = !string.IsNullOrWhiteSpace(ddPerfil.SelectedValue);

            if (ddPerfil.SelectedValue.Equals("estagiario"))
                populaCoordenadores();
        }

        private void populaCoordenadores()
        {
            var query = "SELECT F.idFuncionario, F.dsNomeFuncionario "+
                        "FROM tb_Funcionario AS F "+
                        "JOIN tb_Usuario AS U on(F.idUsuario = U.idUsuario) "+
                        "WHERE F.dsFuncao = 'coordenador' and U.ativo = 1";

            ddCoordenador.DataSource = ServicosDB.Instancia.ExecutarSelect(query);
            ddCoordenador.DataTextField = "dsNomeFuncionario";
            ddCoordenador.DataValueField = "idFuncionario";
            ddCoordenador.DataBind();

            ddCoordenador.Items.Insert(0, new ListItem("Selecione...", "0"));
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

            if (!ValidaCampos())
                return;

            senhaVS = dsSenha.Text;

            if(idUsuarioVS == 0)
                (Master as Site).mostrarCarregando("Deseja realmente cadastrar o <strong> " + dsNome.Text + "</strong> como <strong> " + ddPerfil.SelectedItem.Text + "</strong> no sistema?");
            else
                (Master as Site).mostrarCarregando("Deseja realmente atualizar o usuário: <strong> " + dsUsuario.Text + "</strong>?");

            btnsConfirmar.Visible = true;
        }

        protected void btnSim_Click(object sender, EventArgs e)
        {
            btnsConfirmar.Visible = false;
            (Master as Site).ocultarPaineis();

            if (ddPerfil.SelectedValue == "estagiario")
                salvarEstagiario();
            else
                salvarFuncionario();

        }

        protected void btnNao_Click(object sender, EventArgs e)
        {
            btnsConfirmar.Visible = false;
            (Master as Site).ocultarPaineis();
        }

        private void salvarEstagiario()
        {
            Dictionary<string, dynamic> sqlParameters = new Dictionary<string, dynamic>();

            sqlParameters.Add("@idEstagio", idEstagiarioVS);
            sqlParameters.Add("@idUsuario", idUsuarioVS);
            sqlParameters.Add("@dsNomeAluno", dsNome.Text);
            sqlParameters.Add("@idRGM", idRGM.Text);
            sqlParameters.Add("@idSupervisor", ddCoordenador.SelectedValue);
            sqlParameters.Add("@dtAvaliacao", dtEstagioTermino.Text);
            sqlParameters.Add("@dtEstagioInicio", dtEstagioInicio.Text);
            sqlParameters.Add("@dtEstagioTermino", dtEstagioTermino.Text);
            sqlParameters.Add("@dsUsuario", dsUsuario.Text);
            sqlParameters.Add("@dsSenha", "MD5+Secret");
            sqlParameters.Add("@dsModulos", "meusPacientes");
            sqlParameters.Add("@dsPerfil", ddPerfil.SelectedValue);
            sqlParameters.Add("@dsChave", Utils.Utils.GerarChaveMD5(dsUsuario.Text, senhaVS));
            sqlParameters.Add("@dtExpiracao", dtEstagioTermino.Text);
            sqlParameters.Add("@ativo", eAtivo.Checked);

            var validacaoDados = ServicosDB.Instancia.ExecutarProcedure("InsertOrUpdateEstagiario", sqlParameters);

            if (validacaoDados <= 0)
            {
                (Master as Site).mostrarErro("Ocorreu um erro ao adicionar/atualizar!");
                return;
            }

            (Master as Site).mostrarSucesso("Usuário cadastrado com sucesso!");
            Response.Redirect("~/Conta/ListaUsuarios.aspx");
        }

        private void salvarFuncionario()
        {
            Dictionary<string, dynamic> sqlParameters = new Dictionary<string, dynamic>();

            var modulos = string.Empty;

            switch (ddPerfil.SelectedValue)
            {
                case "admin":
                    modulos = "usuarios, candidatos, pacientes, relatorios, meusPacientes";
                    break;

                case "coordenador":
                    modulos = "candidatos, pacientes, relatorios";
                    break;

                case "auxiliar":
                    modulos = "candidatos";
                    break;

                default:
                    break;
            }

            var ativo = ddPerfil.SelectedValue.Equals("coordenador") ? cAtivo.Checked : aAtivo.Checked;

            sqlParameters.Add("@idFuncionario", idFuncionarioVS);
            sqlParameters.Add("@idUsuario", idUsuarioVS);
            sqlParameters.Add("@dsNomeFuncionario", dsNome.Text);
            sqlParameters.Add("@dsFuncao", ddPerfil.SelectedValue);
            sqlParameters.Add("@dsUsuario", dsUsuario.Text);
            sqlParameters.Add("@dsSenha", "MD5+Secret");
            sqlParameters.Add("@dsModulos", modulos);
            sqlParameters.Add("@dsPerfil", ddPerfil.SelectedValue);
            sqlParameters.Add("@dsChave", Utils.Utils.GerarChaveMD5(dsUsuario.Text, senhaVS));
            sqlParameters.Add("@dtExpiracao", DateTime.Now.AddDays(365));
            sqlParameters.Add("@ativo", ativo);

            var validacaoDados = ServicosDB.Instancia.ExecutarProcedure("InsertOrUpdateFuncionario", sqlParameters);

            if (validacaoDados <= 0)
            {
                (Master as Site).mostrarErro("Ocorreu um erro ao adicionar/atualizar!");
                return;
            }

            (Master as Site).mostrarSucesso("Usuário cadastrado com sucesso!");
            Response.Redirect("~/Conta/ListaUsuarios.aspx");
        }

        private bool ValidaCampos()
        {
            if (string.IsNullOrEmpty(ddPerfil.SelectedValue))
            {
                (Master as Site).mostrarErro("É necessário selecionar um perfil!");
                return false;
            }

            if(idUsuarioVS == 0 && ddPerfil.SelectedValue == "admin")
            {
                (Master as Site).mostrarErro("Só pode haver um administrador no sistema.");
                return false;
            }

            if (string.IsNullOrWhiteSpace(dsUsuario.Text))
            {
                (Master as Site).mostrarErro("Usuário inválido!");
                return false;
            }

            if (idUsuarioVS == 0 && ExisteUsuario(dsUsuario.Text))
            {
                (Master as Site).mostrarErro("Usuário já existe no sistema!");
                return false;
            }

            if (dsUsuario.Text.Length < 4)
            {
                (Master as Site).mostrarErro("Usuário deve conter ao menos 3 caracteres!");
                return false;
            }

            if (!dsSenha.Text.Equals(dsSenhaConf.Text))
            {
                (Master as Site).mostrarErro("A senha e a confirmação não conferem!");
                return false;
            }

            if (dsSenha.Text.Length < 6)
            {
                (Master as Site).mostrarErro("A senha deve conter ao menos 6 caracteres!");
                return false;
            }

            if (ddPerfil.SelectedValue == "estag")
            {
                if (string.IsNullOrWhiteSpace(idRGM.Text) || idRGM.Text.Length < 11)
                {
                    (Master as Site).mostrarErro("RGM Inválido!");
                    return false;
                }

                if (string.IsNullOrEmpty(ddCoordenador.SelectedValue))
                {
                    (Master as Site).mostrarErro("É necessário selecionar um Coordenador!");
                    return false;
                }

                if (DateTime.Compare(Convert.ToDateTime(dtEstagioTermino.Text), DateTime.Now) <= 0)
                {
                    (Master as Site).mostrarErro("Data do término do estágio inválida inválida!");
                    return false;
                }

                if (DateTime.Compare(Convert.ToDateTime(dtEstagioTermino.Text), Convert.ToDateTime(dtEstagioInicio.Text)) < 0)
                {
                    (Master as Site).mostrarErro("Data de inicio não pode ser maior que a data de término!");
                    return false;
                }
            }

            return true;
        }

        private bool ExisteUsuario(string usuario)
        {
            var reader = ServicosDB.Instancia.ExecutarSelect(string.Format("SELECT dsUsuario FROM tb_Usuario WHERE dsUsuario = '{0}'", usuario));

            return reader.HasRows;
        }
    }
}