using Neuropediatria.Controle;
using Neuropediatria.Modelos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Conta
{
    public partial class ListaUsuarios : ControlePerfil
    {
        public List<Usuarios> listaCSV
        {
            get
            {
                if ((List<Usuarios>)ViewState["listaCSV"] == null)
                    ViewState["listaCSV"] = new List<Usuarios>();

                return (List<Usuarios>)(ViewState["listaCSV"]);
            }
            set { ViewState["listaCSV"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Validacoes("Usuarios");

            if (IsPostBack) return;

            populaGrid(string.Empty);
        }

        private void populaGrid(string ordem, bool regraAtivo = false)
        {
            listaCSV.Clear();

            try
            {
                var query = "SELECT U.idUsuario, F.dsNomeFuncionario, E.dsNomeAluno, U.dsUsuario, U.dsPerfil, U.ativo " +
                            "FROM tb_Usuario as U " +
                            "LEFT JOIN tb_Funcionario as F on(U.idUsuario = F.idUsuario) " +
                            "LEFT JOIN tb_Estagio as E on(U.idUsuario = E.idUsuario) ";

                if(regraAtivo)
                    query += "WHERE ativo = 1 ";

                if (!string.IsNullOrEmpty(ordem))
                    query += "order by " + ordem + " ASC";


                SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

                while(sqlReader.Read())
                {
                    listaCSV.Add(new Usuarios
                    {
                        idUsuario = sqlReader["idUsuario"].ToString(),
                        dsNomeFuncionario = sqlReader["dsNomeFuncionario"].ToString(),
                        dsNomeAluno = sqlReader["dsNomeAluno"].ToString(),
                        dsUsuario = sqlReader["dsUsuario"].ToString(),
                        dsPerfil = sqlReader["dsPerfil"].ToString(),
                        ativo = sqlReader["ativo"].ToString()
                    });
                }

                gvUsuarios.DataSource = listaCSV;
                gvUsuarios.DataBind();

                (Master as Site).ocultarPaineis();
            }
            catch (Exception e)
            {
                (Master as Site).mostrarErro("Erro:" + e.Message);
            }
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "visuUsuario")
            {
                var index = int.Parse((string)e.CommandArgument);
                var idUsuario = gvUsuarios.DataKeys[index]["idUsuario"].ToString();

                visualizarUsuario(idUsuario);
            }
        }

        private void visualizarUsuario(string idUsuario)
        {
            Response.Redirect("~/Conta/NovoUsuario.aspx?id=" + idUsuario);
        }

        protected void ordenaLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ordem = ((ListControl)sender).SelectedValue;

            if(ordem == "nome")
                ordem = "dsNomeFuncionario asc, dsNomeAluno";

            populaGrid(ordem);
        }

        public static T ConvertFromDBVal<T>(object obj)
        {
            if (obj == null || obj == DBNull.Value)
            {
                return default(T);
            }
            else
            {
                return (T)obj;
            }
        }
        
        protected void gvUsuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToBoolean(e.Row.Cells[0].Text))
                    e.Row.Cells[0].BackColor = e.Row.Cells[0].ForeColor = System.Drawing.Color.LimeGreen;
                else
                    e.Row.Cells[0].BackColor = e.Row.Cells[0].ForeColor = System.Drawing.Color.OrangeRed;
            }
        }

        protected void maisUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Conta/NovoUsuario.aspx");
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
             "attachment;filename=ListaUsuarios.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";

            StringBuilder sb = new StringBuilder();

            sb.Append("Ativo, Nome Usuario, Login Usuario, Perfil");
            sb.Append("\r\n");

            foreach (var item in listaCSV)
            {
                var nome = item.dsPerfil.Equals("estagiario") ? item.dsNomeAluno : item.dsNomeFuncionario;
                
                sb.Append(string.Format("{0}, {1}, {2}, {3}",
                    item.ativo, nome, item.dsUsuario, item.dsPerfil));
                sb.Append("\r\n");
            }

            Response.Output.Write(sb.ToString());
            Response.Flush();
            Response.End();

        }
    }
}
