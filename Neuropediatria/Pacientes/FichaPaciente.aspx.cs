using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utils;

namespace Neuropediatria.Pacientes
{
    public partial class FichaPaciente : System.Web.UI.Page
    {
        public int idFichaVS
        {
            get { return (int)(ViewState["idFichaVS"] ?? 0); }
            set { ViewState["idFichaVS"] = value; }
        }
        public int idEstagiarioVS
        {
            get { return (int)(ViewState["idEstagiarioVS"] ?? 0); }
            set { ViewState["idEstagiarioVS"] = value; }
        }
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
        public int idEnderecoVS
        {
            get { return (int)(ViewState["idEnderecoVS"] ?? 0); }
            set { ViewState["idEnderecoVS"] = value; }
        }
        public bool isPacienteVS
        {
            get { return Convert.ToBoolean(ViewState["isPacienteVS"]); }
            set { ViewState["isPacienteVS"] = value; }
        }
        public string dtAlocacaoVS
        {
            get { return Convert.ToString(ViewState["dtAlocacaoVS"]); }
            set { ViewState["dtAlocacaoVS"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Validacoes("Candidatos");
            tabelaConteudo.Enabled = true;

            if (IsPostBack) return;

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                getFicha(Request.QueryString["id"]);
        }

        private void getFicha(string idFicha)
        {
            (Master as Site).mostrarCarregando("Carregando dados...");

            int id;
            int idUsuario = int.Parse(ConfigurationManager.AppSettings["idUsuario"].ToString());

            if (!int.TryParse(idFicha, out id))
            {
                (Master as Site).mostrarErro("Dados inválidos!");
                return;
            }

            idFichaVS = id;


            var query = string.Format("SELECT E.dsNomeAluno, E.idRGM, E.dtAvaliacao, E.dtEstagioInicio, E.dtEstagioTermino,  " +
                                        "C.dsNome, C.dtNascimento, C.idSexo, C.dsResponsavel, C.dsParentesco, C.numTelefone, C.dtAlocacao, " +
                                        "L.idEndereco, L.numCEP, L.dsCidade, L.dsEstado, L.dsLogradouro, L.numLogradouro, L.dsComplemento, " +
                                        "H.idHistorico, H.dsPatologia, H.dsQueixaPrincipal, H.dsMedicoResponsavel, H.dsDeficitFuncional, H.dsHospitalProcedencia, H.dsTratamentosPrevios, H.dsHistorico, " +
                                        "F.* " +
                                        "FROM tb_ficha as F " +
                                        "LEFT JOIN tb_Estagio as E on(E.idEstagio = F.idEstagio) " +
                                        "LEFT JOIN tb_Candidato as C on(C.idCandidato = F.idPaciente) " +
                                        "LEFT JOIN tb_Endereco as L on(C.idEndereco = L.idEndereco) " +
                                        "LEFT JOIN tb_Historico as H on(C.idHistorico = H.idHistorico) " +
                                        "LEFT JOIN tb_Usuario as U on (E.idUsuario = U.idUsuario) " +
                                        "WHERE F.idFicha = {0} AND U.idUsuario = {1}", id, idUsuario);

            SqlDataReader sqlReader = ServicosDB.Instancia.ExecutarSelect(query);

            if (sqlReader.Read())
            {
                int tempId;

                idFichaVS = Utils.Utils.DataToInt(sqlReader["idFicha"].ToString());
                idEstagiarioVS = Utils.Utils.DataToInt(sqlReader["idEstagio"].ToString());
                idCandidatoVS = Utils.Utils.DataToInt(sqlReader["idPaciente"].ToString());
                idHistoricoVS = Utils.Utils.DataToInt(sqlReader["idHistorico"].ToString());
                idEnderecoVS = Utils.Utils.DataToInt(sqlReader["idEndereco"].ToString());

                dtAlocacaoVS = sqlReader["dtAlocacao"].ToString();

                dsNomeAluno.Text = sqlReader["dsNomeAluno"].ToString();
                idRGM.Text = sqlReader["idRGM"].ToString();
                dtAvaliacao.Text = Convert.ToDateTime(sqlReader["dtAvaliacao"]).ToString("yyyy-MM-dd");
                dtEstagioInicio.Text = Convert.ToDateTime(sqlReader["dtEstagioInicio"]).ToString("yyyy-MM-dd");
                dtEstagioTermino.Text = Convert.ToDateTime(sqlReader["dtEstagioTermino"]).ToString("yyyy-MM-dd");
                dsNome.Text = sqlReader["dsNome"].ToString();
                dtNascimento.Text = Convert.ToDateTime(sqlReader["dtNascimento"]).ToString("yyyy-MM-dd");
                dsSexo.SelectedValue = sqlReader["idSexo"].ToString();
                dsResponsavel.Text = sqlReader["dsResponsavel"].ToString();
                dsParentesco.Text = sqlReader["dsParentesco"].ToString();
                numTelefone.Text = sqlReader["numTelefone"].ToString();
                numCEP.Text = sqlReader["numCEP"].ToString();
                dsCidade.Text = sqlReader["dsCidade"].ToString();
                dsEstado.Text = sqlReader["dsEstado"].ToString();
                dsLogradouro.Text = sqlReader["dsLogradouro"].ToString();
                numLogradouro.Text = sqlReader["numLogradouro"].ToString();
                dsComplemento.Text = sqlReader["dsComplemento"].ToString();
                dsPatologia.Text = sqlReader["dsPatologia"].ToString();
                dsQueixaPrincipal.Text = sqlReader["dsQueixaPrincipal"].ToString();
                dsMedicoResponsavel.Text = sqlReader["dsMedicoResponsavel"].ToString();
                dsDeficitFuncional.Text = sqlReader["dsDeficitFuncional"].ToString();
                dsHospitalProcedencia.Text = sqlReader["dsHospitalProcedencia"].ToString();
                dsTratamentosPrevios.Text = sqlReader["dsTratamentosPrevios"].ToString();
                dsHistorico.Text = sqlReader["dsHistorico"].ToString();

                hasADNMP.Checked = Utils.Utils.DataToBool(sqlReader["hasADNMP"].ToString());
                dsMotivoADNMP.Text = sqlReader["dsMotivoADNMP"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idADNMP"].ToString()))
                    idADNMP.SelectedValue = sqlReader["idADNMP"].ToString();

                hasOutrasSindromes.Checked = Utils.Utils.DataToBool(sqlReader["hasOutrasSindromes"].ToString());
                dsQualOutraSindrome.Text = sqlReader["dsQualOutraSindrome"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["hasEncefCronInfantilNaoProgres"].ToString()))
                    hasEncefCronInfantilNaoProgres.SelectedValue = sqlReader["hasEncefCronInfantilNaoProgres"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idClassificacaoTopografica"].ToString()))
                    idClassificacaoTopografica.SelectedValue = sqlReader["idClassificacaoTopografica"].ToString();
                dsclassificacaoClinica.Text = sqlReader["dsclassificacaoClinica"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idNivel"].ToString()))
                    idNivel.SelectedValue = sqlReader["idNivel"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idNivelGMFCS"].ToString()))
                    idNivelGMFCS.SelectedValue = sqlReader["idNivelGMFCS"].ToString();
                dsPatologiasDisturbiosAssoc.Text = sqlReader["dsPatologiasDisturbiosAssoc"].ToString();
                dsMedicamentosEmUso.Text = sqlReader["dsMedicamentosEmUso"].ToString();
                dsExamesComplementares.Text = sqlReader["dsExamesComplementares"].ToString();
                dsProtesesAdaptacoes.Text = sqlReader["dsProtesesAdaptacoes"].ToString();
                dsCaracteristicasSindromicas.Text = sqlReader["dsCaracteristicasSindromicas"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAvalDesenvMotorVisao"].ToString()))
                    idAvalDesenvMotorVisao.SelectedValue = sqlReader["idAvalDesenvMotorVisao"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAvalDesenvMotorAudicao"].ToString()))
                    idAvalDesenvMotorAudicao.SelectedValue = sqlReader["idAvalDesenvMotorAudicao"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAvalDesenvMotorLinguagem"].ToString()))
                    idAvalDesenvMotorLinguagem.SelectedValue = sqlReader["idAvalDesenvMotorLinguagem"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAvalDesenvMotorCognitivo"].ToString()))
                    idAvalDesenvMotorCognitivo.SelectedValue = sqlReader["idAvalDesenvMotorCognitivo"].ToString();
                dsAvalDesenvMotorCognitivoResp.Text = sqlReader["dsAvalDesenvMotorCognitivoResp"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idReflexosPrimitivos"].ToString()))
                    idReflexosPrimitivos.SelectedValue = sqlReader["idReflexosPrimitivos"].ToString();
                dsReflexosPrimitivosQuais.Text = sqlReader["dsReflexosPrimitivosQuais"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSupinoSimetria"].ToString()))
                    idSupinoSimetria.SelectedValue = sqlReader["idSupinoSimetria"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSupinoAlinhamento"].ToString()))
                    idSupinoAlinhamento.SelectedValue = sqlReader["idSupinoAlinhamento"].ToString();
                idSupinoMovimentacaoAtiva.Text = sqlReader["idSupinoMovimentacaoAtiva"].ToString();
                dsSupinoObservacao.Text = sqlReader["dsSupinoObservacao"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idPronoControleServical"].ToString()))
                    idPronoControleServical.SelectedValue = sqlReader["idPronoControleServical"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idPronoControleEscapular"].ToString()))
                    idPronoControleEscapular.SelectedValue = sqlReader["idPronoControleEscapular"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idPronoSimetria"].ToString()))
                    idPronoSimetria.SelectedValue = sqlReader["idPronoSimetria"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idPronoAlinhamento"].ToString()))
                    idPronoAlinhamento.SelectedValue = sqlReader["idPronoAlinhamento"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idPronoMovimentacaoAtiva"].ToString()))
                    idPronoMovimentacaoAtiva.SelectedValue = sqlReader["idPronoMovimentacaoAtiva"].ToString();
                dsPronoObservacao.Text = sqlReader["dsPronoObservacao"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idRolar"].ToString()))
                    idRolar.SelectedValue = sqlReader["idRolar"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idRolaDecubito"].ToString()))
                    idRolaDecubito.SelectedValue = sqlReader["idRolaDecubito"].ToString();
                hasUsoPadraoPatologico.Checked = Utils.Utils.DataToBool(sqlReader["hasUsoPadraoPatologico"].ToString());
                dsUsoPadraoPatologicoQual.Text = sqlReader["dsUsoPadraoPatologicoQual"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idRolarDissociacao"].ToString()))
                    idRolarDissociacao.SelectedValue = sqlReader["idRolarDissociacao"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoControleServical"].ToString()))
                    idSentadoControleServical.SelectedValue = sqlReader["idSentadoControleServical"].ToString();
                idSentadoControleTronco.Text = sqlReader["idSentadoControleTronco"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoSimetria"].ToString()))
                    idSentadoSimetria.SelectedValue = sqlReader["idSentadoSimetria"].ToString();
                idSentadoAlinhamento.Text = sqlReader["idSentadoAlinhamento"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoMovimentacaoAtiva"].ToString()))
                    idSentadoMovimentacaoAtiva.SelectedValue = sqlReader["idSentadoMovimentacaoAtiva"].ToString();
                dsSentadoObservacao.Text = sqlReader["dsSentadoObservacao"].ToString();
                dsTrocaPosturalSupinoSentado.Text = sqlReader["dsTrocaPosturalSupinoSentado"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoPosturaQuadril"].ToString()))
                    idSentadoPosturaQuadril.SelectedValue = sqlReader["idSentadoPosturaQuadril"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoPosturaQuadrilIncl"].ToString()))
                    idSentadoPosturaQuadrilIncl.SelectedValue = sqlReader["idSentadoPosturaQuadrilIncl"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoDeformColuna"].ToString()))
                    idSentadoDeformColuna.SelectedValue = sqlReader["idSentadoDeformColuna"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoDeformColunaPres"].ToString()))
                    idSentadoDeformColunaPres.SelectedValue = sqlReader["idSentadoDeformColunaPres"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoDeformQuadril"].ToString()))
                    idSentadoDeformQuadril.SelectedValue = sqlReader["idSentadoDeformQuadril"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idSentadoDeformQuadrilPres"].ToString()))
                    idSentadoDeformQuadrilPres.SelectedValue = sqlReader["idSentadoDeformQuadrilPres"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idEngatinhar"].ToString()))
                    idEngatinhar.SelectedValue = sqlReader["idEngatinhar"].ToString();
                dsEngatinhar.Text = sqlReader["dsEngatinhar"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idArrastar"].ToString()))
                    idArrastar.SelectedValue = sqlReader["idArrastar"].ToString();
                dsArrastar.Text = sqlReader["dsArrastar"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idOrtostatismo"].ToString()))
                    idOrtostatismo.SelectedValue = sqlReader["idOrtostatismo"].ToString();
                idOrtostatismoPosicPes.Text = sqlReader["idOrtostatismoPosicPes"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idMarcha"].ToString()))
                    idMarcha.SelectedValue = sqlReader["idMarcha"].ToString();
                dsMarcha.Text = sqlReader["dsMarcha"].ToString();
                dsMarchaObservacoes.Text = sqlReader["dsMarchaObservacoes"].ToString();
                hasHipertoniaElastica.Checked = Utils.Utils.DataToBool(sqlReader["hasHipertoniaElastica"].ToString());
                dsHipertoniaElastica.Text = sqlReader["dsHipertoniaElastica"].ToString();
                dsHipertElastSinaisClinicos.Text = sqlReader["dsHipertElastSinaisClinicos"].ToString();
                dsHipertElastAsWorth.Text = sqlReader["dsHipertElastAsWorth"].ToString();
                hasHipertoniaPlastica.Checked = Utils.Utils.DataToBool(sqlReader["hasHipertoniaPlastica"].ToString());
                dsHipertoniaPlasticaLocalizacao.Text = sqlReader["dsHipertoniaPlasticaLocalizacao"].ToString();
                dsHipertPlastSinaisClinicos.Text = sqlReader["dsHipertPlastSinaisClinicos"].ToString();
                hasDiscinesias.Checked = Utils.Utils.DataToBool(sqlReader["hasDiscinesias"].ToString());
                dsDiscinesiasQual.Text = sqlReader["dsDiscinesiasQual"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idMolestiaIncorrencia"].ToString()))
                    idMolestiaIncorrencia.SelectedValue = sqlReader["idMolestiaIncorrencia"].ToString();
                dsDiscinesiasLocalizacao.Text = sqlReader["dsDiscinesiasLocalizacao"].ToString();
                hasHipotonia.Checked = Utils.Utils.DataToBool(sqlReader["hasHipotonia"].ToString());
                dsHipotoniaLocalizacao.Text = sqlReader["dsHipotoniaLocalizacao"].ToString();
                hasIncoordenacaoMov.Checked = Utils.Utils.DataToBool(sqlReader["hasIncoordenacaoMov"].ToString());

                if (!string.IsNullOrEmpty(sqlReader["idDiscinesias"].ToString()))
                    idDiscinesias.SelectedValue = sqlReader["idDiscinesias"].ToString();
                dsTonusDinamico.Text = sqlReader["dsTonusDinamico"].ToString();
                dsEncurtamentoMuscDeform.Text = sqlReader["dsEncurtamentoMuscDeform"].ToString();
                dsForcaMuscular.Text = sqlReader["dsForcaMuscular"].ToString();
                dsDireitoMMSS.Text = sqlReader["dsDireitoMMSS"].ToString();
                dsEsquerdoMMSS.Text = sqlReader["dsEsquerdoMMSS"].ToString();
                dsDireitoMMII.Text = sqlReader["dsDireitoMMII"].ToString();
                dsEsquerdoMMII.Text = sqlReader["dsEsquerdoMMII"].ToString();
                dsReacEndireitPostSentada.Text = sqlReader["dsReacEndireitPostSentada"].ToString();
                dsReacEndireitBipede.Text = sqlReader["dsReacEndireitBipede"].ToString();
                dsReacEquilibrioPostSentada.Text = sqlReader["dsReacEquilibrioPostSentada"].ToString();
                dsReacEquilibrioBipede.Text = sqlReader["dsReacEquilibrioBipede"].ToString();
                dsReacProtecaoPostSentada.Text = sqlReader["dsReacProtecaoPostSentada"].ToString();
                dsReacProtecaoBipede.Text = sqlReader["dsReacProtecaoBipede"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAtivVidaDiariaAlimentacao"].ToString()))
                    idAtivVidaDiariaAlimentacao.SelectedValue = sqlReader["idAtivVidaDiariaAlimentacao"].ToString();
                dsAtivVidaDiariaAlimentacao.Text = sqlReader["dsAtivVidaDiariaAlimentacao"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAtivVidaDiariaHigiene"].ToString()))
                    idAtivVidaDiariaHigiene.SelectedValue = sqlReader["idAtivVidaDiariaHigiene"].ToString();
                dsAtivVidaDiariaHigiene.Text = sqlReader["dsAtivVidaDiariaHigiene"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAtivVidaDiariaVestuario"].ToString()))
                    idAtivVidaDiariaVestuario.SelectedValue = sqlReader["idAtivVidaDiariaVestuario"].ToString();
                dsAtivVidaDiariaVestuario.Text = sqlReader["dsAtivVidaDiariaVestuario"].ToString();

                if (!string.IsNullOrEmpty(sqlReader["idAtivVidaDiariaLocomocao"].ToString()))
                    idAtivVidaDiariaLocomocao.SelectedValue = sqlReader["idAtivVidaDiariaLocomocao"].ToString();
                dsAtivVidaDiariaLocomocao.Text = sqlReader["dsAtivVidaDiariaLocomocao"].ToString();
                dsSistemaRespiratorio.Text = sqlReader["dsSistemaRespiratorio"].ToString();
                dsObjetivos.Text = sqlReader["dsObjetivos"].ToString();
                dsEvolucaoPeriodo.Text = sqlReader["dsEvolucaoPeriodo"].ToString();
            }
            else
            {
                (Master as Site).mostrarErro("Ficha não encontrada!");
                return;
            }

            (Master as Site).ocultarPaineis();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            SalvarDadosCandidato();
            SalvarDadosFicha();


        }
        private void SalvarDadosCandidato()
        {
            Dictionary<string, dynamic> sqlParameters = new Dictionary<string, dynamic>();

            sqlParameters.Add("@idCanditato", idCandidatoVS);
            sqlParameters.Add("@dsNome", dsNome.Text);
            sqlParameters.Add("@isPaciente", isPacienteVS);
            sqlParameters.Add("@idSexo", dsSexo.SelectedValue);
            sqlParameters.Add("@dtNascimento", dtNascimento.Text);
            sqlParameters.Add("@idHistorico", idHistoricoVS);
            sqlParameters.Add("@dsResponsavel", dsResponsavel.Text);
            sqlParameters.Add("@dsParentesco", dsParentesco.Text);
            sqlParameters.Add("@numTelefone", numTelefone.Text);
            sqlParameters.Add("@idEndereco", idEnderecoVS);
            sqlParameters.Add("@dtAlocacao", dtAlocacaoVS);
            sqlParameters.Add("@dsPatologia", dsPatologia.Text);
            sqlParameters.Add("@dsQueixaPrincipal", dsQueixaPrincipal.Text);
            sqlParameters.Add("@dsMedicoResponsavel", dsMedicoResponsavel.Text);
            sqlParameters.Add("@dsDeficitFuncional", dsDeficitFuncional.Text);
            sqlParameters.Add("@dsHospitalProcedencia", dsHospitalProcedencia.Text);
            sqlParameters.Add("@dsTratamentosPrevios", dsTratamentosPrevios.Text);
            sqlParameters.Add("@idIncorrMolestiaAtualProgressa", 0);
            sqlParameters.Add("@dsHistorico", dsHistorico.Text);
            sqlParameters.Add("@numCEP", numCEP.Text);
            sqlParameters.Add("@dsCidade", dsCidade.Text);
            sqlParameters.Add("@dsEstado", dsEstado.Text);
            sqlParameters.Add("@dsLogradouro", dsLogradouro.Text);
            sqlParameters.Add("@numLogradouro", numLogradouro.Text);
            sqlParameters.Add("@dsComplemento", dsComplemento.Text);

            var validacao = ServicosDB.Instancia.ExecutarProcedure("InsertUpdateCandidato", sqlParameters);

            if (validacao <= 0)
            {
                (Master as Site).mostrarErro("Ocorreu um erro ao atualizar candidato!");
                tabelaConteudo.Enabled = true;
                return;
            }

        }

        private void SalvarDadosFicha()
        {

            Dictionary<string, dynamic> sqlParameters = new Dictionary<string, dynamic>();

            sqlParameters.Add("@idFicha", idFichaVS);
            sqlParameters.Add("@idEstagio", idEstagiarioVS);
            sqlParameters.Add("@idPaciente", idCandidatoVS);
            sqlParameters.Add("@hasADNMP", hasADNMP.Text);
            sqlParameters.Add("@dsMotivoADNMP", dsMotivoADNMP.Text);
            sqlParameters.Add("@idADNMP", idADNMP.SelectedValue);
            sqlParameters.Add("@hasOutrasSindromes", hasOutrasSindromes.Text);
            sqlParameters.Add("@dsQualOutraSindrome", dsQualOutraSindrome.Text);
            sqlParameters.Add("@hasEncefCronInfantilNaoProgres", hasEncefCronInfantilNaoProgres.Text);
            sqlParameters.Add("@idClassificacaoTopografica", idClassificacaoTopografica.SelectedValue);
            sqlParameters.Add("@dsclassificacaoClinica", dsclassificacaoClinica.Text);
            sqlParameters.Add("@idNivel", idNivel.SelectedValue);
            sqlParameters.Add("@idNivelGMFCS", idNivelGMFCS.SelectedValue);
            sqlParameters.Add("@dsPatologiasDisturbiosAssoc", dsPatologiasDisturbiosAssoc.Text);
            sqlParameters.Add("@dsMedicamentosEmUso", dsMedicamentosEmUso.Text);
            sqlParameters.Add("@dsExamesComplementares", dsExamesComplementares.Text);
            sqlParameters.Add("@dsProtesesAdaptacoes", dsProtesesAdaptacoes.Text);
            sqlParameters.Add("@dsCaracteristicasSindromicas", dsCaracteristicasSindromicas.Text);
            sqlParameters.Add("@idAvalDesenvMotorVisao", idAvalDesenvMotorVisao.SelectedValue);
            sqlParameters.Add("@idAvalDesenvMotorAudicao", idAvalDesenvMotorAudicao.SelectedValue);
            sqlParameters.Add("@idAvalDesenvMotorLinguagem", idAvalDesenvMotorLinguagem.SelectedValue);
            sqlParameters.Add("@idAvalDesenvMotorCognitivo", idAvalDesenvMotorCognitivo.SelectedValue);
            sqlParameters.Add("@dsAvalDesenvMotorCognitivoResp", dsAvalDesenvMotorCognitivoResp.Text);
            sqlParameters.Add("@idReflexosPrimitivos", idReflexosPrimitivos.SelectedValue);
            sqlParameters.Add("@dsReflexosPrimitivosQuais", dsReflexosPrimitivosQuais.Text);
            sqlParameters.Add("@idSupinoSimetria", idSupinoSimetria.SelectedValue);
            sqlParameters.Add("@idSupinoAlinhamento", idSupinoAlinhamento.SelectedValue);
            sqlParameters.Add("@idSupinoMovimentacaoAtiva", idSupinoMovimentacaoAtiva.Text);
            sqlParameters.Add("@dsSupinoObservacao", dsSupinoObservacao.Text);
            sqlParameters.Add("@idPronoControleServical", idPronoControleServical.SelectedValue);
            sqlParameters.Add("@idPronoControleEscapular", idPronoControleEscapular.SelectedValue);
            sqlParameters.Add("@idPronoSimetria", idPronoSimetria.SelectedValue);
            sqlParameters.Add("@idPronoAlinhamento", idPronoAlinhamento.SelectedValue);
            sqlParameters.Add("@idPronoMovimentacaoAtiva", idPronoMovimentacaoAtiva.SelectedValue);
            sqlParameters.Add("@dsPronoObservacao", dsPronoObservacao.Text);
            sqlParameters.Add("@idRolar", idRolar.SelectedValue);
            sqlParameters.Add("@idRolaDecubito", idRolaDecubito.SelectedValue);
            sqlParameters.Add("@hasUsoPadraoPatologico", hasUsoPadraoPatologico.Text);
            sqlParameters.Add("@dsUsoPadraoPatologicoQual", dsUsoPadraoPatologicoQual.Text);
            sqlParameters.Add("@idRolarDissociacao", idRolarDissociacao.SelectedValue);
            sqlParameters.Add("@idSentadoControleServical", idSentadoControleServical.SelectedValue);
            sqlParameters.Add("@idSentadoControleTronco", idSentadoControleTronco.Text);
            sqlParameters.Add("@idSentadoSimetria", idSentadoSimetria.SelectedValue);
            sqlParameters.Add("@idSentadoAlinhamento", idSentadoAlinhamento.Text);
            sqlParameters.Add("@idSentadoMovimentacaoAtiva", idSentadoMovimentacaoAtiva.SelectedValue);
            sqlParameters.Add("@dsSentadoObservacao", dsSentadoObservacao.Text);
            sqlParameters.Add("@dsTrocaPosturalSupinoSentado", dsTrocaPosturalSupinoSentado.Text);
            sqlParameters.Add("@idSentadoPosturaQuadril", idSentadoPosturaQuadril.SelectedValue);
            sqlParameters.Add("@idSentadoPosturaQuadrilIncl", idSentadoPosturaQuadrilIncl.SelectedValue);
            sqlParameters.Add("@idSentadoDeformColuna", idSentadoDeformColuna.SelectedValue);
            sqlParameters.Add("@idSentadoDeformColunaPres", idSentadoDeformColunaPres.SelectedValue);
            sqlParameters.Add("@idSentadoDeformQuadril", idSentadoDeformQuadril.SelectedValue);
            sqlParameters.Add("@idSentadoDeformQuadrilPres", idSentadoDeformQuadrilPres.SelectedValue);
            sqlParameters.Add("@idEngatinhar", idEngatinhar.SelectedValue);
            sqlParameters.Add("@dsEngatinhar", dsEngatinhar.Text);
            sqlParameters.Add("@idArrastar", idArrastar.SelectedValue);
            sqlParameters.Add("@dsArrastar", dsArrastar.Text);
            sqlParameters.Add("@idOrtostatismo", idOrtostatismo.SelectedValue);
            sqlParameters.Add("@idOrtostatismoPosicPes", idOrtostatismoPosicPes.Text);
            sqlParameters.Add("@idMarcha", idMarcha.SelectedValue);
            sqlParameters.Add("@dsMarcha", dsMarcha.Text);
            sqlParameters.Add("@dsMarchaObservacoes", dsMarchaObservacoes.Text);
            sqlParameters.Add("@hasHipertoniaElastica", hasHipertoniaElastica.Text);
            sqlParameters.Add("@dsHipertoniaElastica", dsHipertoniaElastica.Text);
            sqlParameters.Add("@dsHipertElastSinaisClinicos", dsHipertElastSinaisClinicos.Text);
            sqlParameters.Add("@dsHipertElastAsWorth", dsHipertElastAsWorth.Text);
            sqlParameters.Add("@hasHipertoniaPlastica", hasHipertoniaPlastica.Text);
            sqlParameters.Add("@dsHipertoniaPlasticaLocalizacao", dsHipertoniaPlasticaLocalizacao.Text);
            sqlParameters.Add("@dsHipertPlastSinaisClinicos", dsHipertPlastSinaisClinicos.Text);
            sqlParameters.Add("@hasDiscinesias", hasDiscinesias.Text);
            sqlParameters.Add("@dsDiscinesiasQual", dsDiscinesiasQual.Text);
            sqlParameters.Add("@idMolestiaIncorrencia", idMolestiaIncorrencia.SelectedValue);
            sqlParameters.Add("@dsDiscinesiasLocalizacao", dsDiscinesiasLocalizacao.Text);
            sqlParameters.Add("@hasHipotonia", hasHipotonia.Text);
            sqlParameters.Add("@dsHipotoniaLocalizacao", dsHipotoniaLocalizacao.Text);
            sqlParameters.Add("@hasIncoordenacaoMov", hasIncoordenacaoMov.Text);
            sqlParameters.Add("@idDiscinesias", idDiscinesias.SelectedValue);
            sqlParameters.Add("@dsTonusDinamico", dsTonusDinamico.Text);
            sqlParameters.Add("@dsEncurtamentoMuscDeform", dsEncurtamentoMuscDeform.Text);
            sqlParameters.Add("@dsForcaMuscular", dsForcaMuscular.Text);
            sqlParameters.Add("@dsDireitoMMSS", dsDireitoMMSS.Text);
            sqlParameters.Add("@dsEsquerdoMMSS", dsEsquerdoMMSS.Text);
            sqlParameters.Add("@dsDireitoMMII", dsDireitoMMII.Text);
            sqlParameters.Add("@dsEsquerdoMMII", dsEsquerdoMMII.Text);
            sqlParameters.Add("@dsReacEndireitPostSentada", dsReacEndireitPostSentada.Text);
            sqlParameters.Add("@dsReacEndireitBipede", dsReacEndireitBipede.Text);
            sqlParameters.Add("@dsReacEquilibrioPostSentada", dsReacEquilibrioPostSentada.Text);
            sqlParameters.Add("@dsReacEquilibrioBipede", dsReacEquilibrioBipede.Text);
            sqlParameters.Add("@dsReacProtecaoPostSentada", dsReacProtecaoPostSentada.Text);
            sqlParameters.Add("@dsReacProtecaoBipede", dsReacProtecaoBipede.Text);
            sqlParameters.Add("@idAtivVidaDiariaAlimentacao", idAtivVidaDiariaAlimentacao.SelectedValue);
            sqlParameters.Add("@dsAtivVidaDiariaAlimentacao", dsAtivVidaDiariaAlimentacao.Text);
            sqlParameters.Add("@idAtivVidaDiariaHigiene", idAtivVidaDiariaHigiene.SelectedValue);
            sqlParameters.Add("@dsAtivVidaDiariaHigiene", dsAtivVidaDiariaHigiene.Text);
            sqlParameters.Add("@idAtivVidaDiariaVestuario", idAtivVidaDiariaVestuario.SelectedValue);
            sqlParameters.Add("@dsAtivVidaDiariaVestuario", dsAtivVidaDiariaVestuario.Text);
            sqlParameters.Add("@idAtivVidaDiariaLocomocao", idAtivVidaDiariaLocomocao.SelectedValue);
            sqlParameters.Add("@dsAtivVidaDiariaLocomocao", dsAtivVidaDiariaLocomocao.Text);
            sqlParameters.Add("@dsSistemaRespiratorio", dsSistemaRespiratorio.Text);
            sqlParameters.Add("@dsObjetivos", dsObjetivos.Text);
            sqlParameters.Add("@dsEvolucaoPeriodo", dsEvolucaoPeriodo.Text);

            var validacao = ServicosDB.Instancia.ExecutarProcedure("InsertOrUpdateFicha", sqlParameters);

            if (validacao <= 0)
            {
                (Master as Site).mostrarErro("Ocorreu um erro ao atualizar Ficha!");
                tabelaConteudo.Enabled = true;
                return;
            }

            (Master as Site).mostrarSucesso("Dados atualizados com sucesso!");

        }


        protected void validarCep_Click(object sender, EventArgs e)
        {

        }
    }
}