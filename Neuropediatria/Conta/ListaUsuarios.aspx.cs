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

namespace Neuropediatria.Conta
{
    public partial class ListaUsuarios : ControlePerfil
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Validacoes("Usuarios");

            if (IsPostBack) return;

            populaGrid(string.Empty);

            /* TODO
             
             * Fazer botão de mostrar somente ativos 
             
             */
        }

        private void populaGrid(string ordem)
        {
            try
            {
                var query = "SELECT U.idUsuario, F.dsNomeFuncionario, E.dsNomeAluno, U.dsUsuario, U.dsPerfil, U.ativo " +
                            "FROM tb_Usuario as U " +
                            "LEFT JOIN tb_Funcionario as F on(U.idUsuario = F.idUsuario) " +
                            "LEFT JOIN tb_Estagio as E on(U.idUsuario = E.idUsuario) ";

                if (!string.IsNullOrEmpty(ordem))
                    query += "order by " + ordem + " ASC";

                gvUsuarios.DataSource = ServicosDB.Instancia.ExecutarSelect(query);
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
    }
}
