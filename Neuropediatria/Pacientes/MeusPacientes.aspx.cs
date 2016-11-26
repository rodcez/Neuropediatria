using Neuropediatria.Controle;
using Neuropediatria.Modelos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Pacientes
{
    public partial class MeusPacientes : ControlePerfil
    {
        public int idPacienteVS
        {
            get { return (int)(ViewState["idPacienteVS"] ?? 0); }
            set { ViewState["idPacienteVS"] = value; }
        }

        public int idEstagiarioVS
        {
            get { return (int)(ViewState["idEstagiarioVS"] ?? 0); }
            set { ViewState["idEstagiarioVS"] = value; }
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
            Validacoes("MeusPacientes");

            var perfil = ConfigurationManager.AppSettings["Perfil"].ToString();
            idEstagiarioVS = int.Parse(ConfigurationManager.AppSettings["IdUsuario"].ToString());

            if (IsPostBack) return;

            populaGrid(string.Empty);
        }

        private void populaGrid(string ordem, bool regraAtivo = false)
        {
            try
            {
                var query = string.Format(  "SELECT C.idCandidato, C.dsNome, C.dtNascimento, H.dsPatologia, C.dtAlocacao, E.dsNomeAluno, F.idFicha   " +
                                            "FROM tb_Ficha as F " +
                                            "RIGHT JOIN tb_Candidato as C on(c.idCandidato = f.idPaciente) " +
                                            "LEFT JOIN tb_Historico as H on(c.idHistorico = h.idHistorico) " +
                                            "LEFT JOIN tb_Estagio as E on(c.idEstagio = E.idEstagio) " +
                                            "WHERE isPaciente = {0} AND C.ativo = {1} AND E.idUsuario = {2}", 1, 1, idEstagiarioVS);

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
            if (e.CommandName == "fichaCandidato")
            {
                var index = int.Parse((string)e.CommandArgument);

                var idFicha = gvPacientes.DataKeys[index]["idFicha"].ToString();

                idPacienteVS = int.Parse(gvPacientes.DataKeys[index]["idCandidato"].ToString());

                if(string.IsNullOrEmpty(idFicha))
                {
                    (Master as Site).mostrarCarregando("O Paciente: <strong>" + gvPacientes.DataKeys[index]["dsNome"].ToString() + "</strong> não foi alocado a nenhum Estagiário, Contate o seu Supervisor?");

                    return;
                }

                verFichaCandidato(int.Parse(idFicha));
            }
        }

        private void verFichaCandidato(int idCandidato)
        {
            Response.Redirect("~/Pacientes/FichaPaciente.aspx?id=" + idCandidato);
        }

        protected void ordenaLista_SelectedIndexChanged(object sender, EventArgs e)
        {
            populaGrid(((ListControl)sender).SelectedValue);
        }
    }
}
