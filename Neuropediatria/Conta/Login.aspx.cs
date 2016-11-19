using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (IsPostBack) return;

            /* TODO
             
             * Testar usuário inativo e com estagiario data expirada     
             
             */

            if (!string.IsNullOrEmpty(Request.QueryString["msg"]))
                getMensagem(Request.QueryString["msg"]);
        }

        private void getMensagem(string msg)
        {
            switch (msg)
            {
                case "1":
                    (Master as Site).mostrarErro("Você não tem o acesso necessário.");
                    break;

                case "2":
                    (Master as Site).mostrarErro("Não é possível autenticar o usuário.");
                    break;

                case "3":
                    (Master as Site).mostrarSucesso("Usuário deslogado com sucesso.");
                    sairLogin();
                    break;

                default:
                    break;
            }
        }

        private void sairLogin()
        {
            Response.Cookies["login"].Value = null;
            (Master as Site).LoginAtivo(false);
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            (Master as Site).mostrarCarregando("Carregando...");

            Page.Validate();

            if (!Page.IsValid)
            {
                (Master as Site).mostrarErro("Dados incorretos!");
                btnEntrar.Enabled = true;
                return;
            }

            validarLogin(txtUsuario.Text, txtSenha.Text);
        }

        private void validarLogin(string usuario, string senha)
        {
            string chaveMD5 = Utils.Utils.GerarChaveMD5(usuario, senha);

            var query = string.Format(  "SELECT idUsuario, dsUsuario, dsSenha, dsModulos, dsPerfil, dsChave, ativo " +
                                        "FROM tb_Usuario " +
                                        "WHERE dsChave = '{0}'", chaveMD5);

            SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

            var appSett = ConfigurationManager.AppSettings;
            List<string> modulos = new List<string>();

            if (sqlReader.Read())
            {
                if(validaUsuario(sqlReader["ativo"].ToString()))
                    return;

                if(sqlReader["dsPerfil"].ToString().Equals("estagiario") && !validaEstagio(sqlReader["idUsuario"].ToString()))
                    return;

                Response.Cookies["login"].Value = chaveMD5;
                Response.Cookies["login"].Expires = DateTime.Now.AddDays(1);

                Session["login"] = usuario + senha;

                modulos = sqlReader["dsModulos"].ToString().Split(',').ToList();

                appSett.Set("Perfil", sqlReader["dsPerfil"].ToString());
                appSett.Set("IdUsuario", sqlReader["idUsuario"].ToString());
                appSett.Set("chaveMD5", chaveMD5);
                appSett.Set("Relatorios", modulos.Exists(x => x.Contains("relatorios")).ToString());
                appSett.Set("Candidatos", modulos.Exists(x => x.Contains("candidatos")).ToString());
                appSett.Set("Pacientes", modulos.Exists(x => x.Contains("pacientes")).ToString());
                appSett.Set("MeusPacientes", modulos.Exists(x => x.Contains("meusPacientes")).ToString());
                appSett.Set("Usuarios", modulos.Exists(x => x.Contains("usuarios")).ToString());

                (Master as Site).LoginAtivo(true);
                (Master as Site).ocultarPaineis();
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                (Master as Site).mostrarErro("Usuário não encontrado!");
                btnEntrar.Enabled = true;
                return;
            }

        }

        private bool validaUsuario(string ativo)
        {
            if(!Convert.ToBoolean(ativo))
            {
                (Master as Site).mostrarErro("Usuario inativo no sistema, favor contatar o administrador.");
                return true;
            }

            return false;
        }

        private bool validaEstagio(string idUsuario)
        {
            SqlDataReader reader = ServicosDB.Instancia.ExecutarSelect(string.Format("SELECT dtEstagioTermino FROM tb_Estagio WHERE idUsuario = {0}", idUsuario));

            if (reader.Read())
            {
                if (DateTime.Compare(DateTime.Now, Convert.ToDateTime(reader["dtEstagioTermino"].ToString())) > 0)
                {
                    (Master as Site).mostrarErro("Data final do estágio expirada, favor contatar o administrador.");
                    ServicosDB.Instancia.ExecutarAtualizacao(string.Format("UPDATE tb_usuario SET ativo = 0 WHERE idUsuario = {0}", idUsuario));
                    return false;
                }

                return true;
            }

            (Master as Site).mostrarErro("Data final do estágio inválida, favor contatar o administrador.");

            return false ;
        }
    }
}