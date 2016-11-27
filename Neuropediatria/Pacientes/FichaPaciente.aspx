<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FichaPaciente.aspx.cs" Inherits="Neuropediatria.Pacientes.FichaPaciente" %>

<asp:Content ID="paginaNovoCandidato" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <style>
        .separar input[type="radio"] {
            margin-left: 15px;
            margin-right: 2px;
        }

        .correcaoDoPrimeiro {
            margin-left: -15px;
        }
    </style>

    <br />
    <h2 style="text-align: center;">Ficha Paciente</h2>
    <hr />
    <br />

    <asp:Table ID="tabelaConteudo" runat="server" HorizontalAlign="Center">
        <asp:TableRow Height="30px">
            <asp:TableCell>

                <%-- Dados Estagiário --%>


                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Nome Estagiário: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="RGM: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Data de avaliação: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Período de estágio: " runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsNomeAluno" runat="server" Width="320px" Enabled="false" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="idRGM" runat="server" Width="120px" Enabled="false" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dtAvaliacao" runat="server" Width="140px" TextMode="Date" Enabled="false"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell Width="100px">
                            <asp:TextBox ID="dtEstagioInicio" runat="server" Width="140px" TextMode="Date" Enabled="false" />
                            <asp:TextBox ID="dtEstagioTermino" runat="server" Width="140px" TextMode="Date" Enabled="false"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <%-- Dados Pessoais Paciente --%>

                <hr />
                <h4>Dados Pessoais</h4>
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Nome do Paciente: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Idade: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Sexo: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Data de Nascimento: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsNome" runat="server" Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsIdade" runat="server" Width="70px" TextMode="Number" />
                        </asp:TableCell>
                        <asp:TableCell Width="80px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="dsSexo" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="M" Value="2" />
                                <asp:ListItem Text="F" Value="1"  />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="80px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dtNascimento" runat="server"  Width="140px" TextMode="Date"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <%-- Dados Pessoais Responsavel --%>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Responsável: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Parentesco: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Telefone: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsResponsavel" runat="server"  Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsParentesco" runat="server"  Width="100px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="numTelefone" runat="server"  Width="140px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />

                <%-- Dados Localização --%>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="CEP: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Cidade: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Estado: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="numCEP" runat="server"  Width="100px" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="validarCep" runat="server" CssClass="btn-xs btn-link" Text="Validar CEP" OnClick="validarCep_Click" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsCidade" runat="server"  Width="100px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsEstado" runat="server"  Width="70px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Endereço: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Número: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Complemento: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsLogradouro" runat="server"  Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="numLogradouro" runat="server"  Width="70px" />
                        </asp:TableCell>
                        <asp:TableCell Width="70px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsComplemento" runat="server"  Width="150px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Patologia: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Queixa principal: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsPatologia" runat="server" Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsQueixaPrincipal" runat="server"  Width="290px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Médico responsável : " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Defict funcional : " runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsMedicoResponsavel" runat="server" Width="320px"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsDeficitFuncional" runat="server" Width="290px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Hospital de procedência: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Tratamentos prévios/cirurgias: " runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsHospitalProcedencia" runat="server" Width="320px"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsTratamentosPrevios" runat="server" Width="290px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Histórico Paciente" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsHistoricoAnterior" runat="server"  Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsHistorico" runat="server"  Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasADNMP" Text="ADNPM" runat="server" />
                            <asp:TableCell Width="100px"> </asp:TableCell>
                            <span> Motivo: </span>
                            <asp:TextBox ID="dsMotivoADNMP" runat="server" Width="660px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idADNMP" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Sindrome de Down" Value="1" />
                                <asp:ListItem Text="Paralisia Braquial congênita"  Value="2" />
                                <asp:ListItem Text="Mielomengocele"  Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasOutrasSindromes" Text="Outras síndomes" runat="server" />
                            <asp:TableCell Width="100px"> </asp:TableCell>
                            <span> Qual?: </span>
                            <asp:TextBox ID="dsQualOutraSindrome" runat="server" Width="600px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Encefalopatia Crônica infantil não progressiva: " runat="server"/>
                            <asp:RadioButtonList ID="hasEncefCronInfantilNaoProgres" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Sim" Value="2" />
                                <asp:ListItem Text="Não" Value="1"/>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Classificação topográfica " runat="server"/>
                            <asp:RadioButtonList ID="idClassificacaoTopografica" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Tetraparesia" Value="1" />
                                <asp:ListItem Text="Disaparesia" Value="2"/>
                                <asp:ListItem Text="Hemiparesia" Value="3"/>
                                <asp:ListItem Text="Dupla Hemiparesia" Value="4"/>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Classificação clínica: " runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsclassificacaoClinica" runat="server"  Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Nível: " runat="server"/>
                            <asp:RadioButtonList ID="idNivel" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Leve" Value="1" />
                                <asp:ListItem Text="Moderado" Value="2"/>
                                <asp:ListItem Text="Grave" Value="3"/>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="GMFCS nível: " runat="server"/>
                            <asp:RadioButtonList ID="idNivelGMFCS" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="1" Value="1" />
                                <asp:ListItem Text="2" Value="2"/>
                                <asp:ListItem Text="3" Value="3"/>
                                <asp:ListItem Text="4" Value="4"/>
                                <asp:ListItem Text="5" Value="5"/>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="História da moléstia atual/progressa: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Incorrência: " runat="server" />
                            <asp:RadioButtonList ID="idMolestiaIncorrencia" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="pré natal"  Value="1" />
                                <asp:ListItem Text="peri natal"  Value="2" />
                                <asp:ListItem Text="pos natal"  Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsMolestiaIncorrencia" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Patologias ou disturbios associados: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsPatologiasDisturbiosAssoc" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Medicamentos em uso: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsMedicamentosEmUso" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Exames complementares: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsExamesComplementares" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="/Proteses e Adaptações: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsProtesesAdaptacoes" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Características Sindrômicas: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsCaracteristicasSindromicas" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <strong>Avaliação do Desenvolvimento Motor</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Visão " runat="server"/>
                            <asp:RadioButtonList ID="idAvalDesenvMotorVisao" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente"  Value="1" />
                                <asp:ListItem Text="Ausente"  Value="2" />
                                <asp:ListItem Text="Parcial - Acompanha o objeto mas não fixa"  Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label  Text="Audição " runat="server"/>
                            <asp:RadioButtonList ID="idAvalDesenvMotorAudicao" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente"  Value="1" />
                                <asp:ListItem Text="Ausente"  Value="2" />
                                <asp:ListItem Text="Parcial - Acompanha o som"  Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Linguagem " runat="server"/>
                            <asp:RadioButtonList ID="idAvalDesenvMotorLinguagem" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente"  Value="1" />
                                <asp:ListItem Text="Ausente"  Value="2" />
                                <asp:ListItem Text="Se comunica olhar"  Value="3" />
                                <asp:ListItem Text="Se comunica gestos"  Value="4" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Cognitivo " runat="server"/>
                            <asp:RadioButtonList ID="idAvalDesenvMotorCognitivo" runat="server" Width="780px" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Adequado"  Value="1" />
                                <asp:ListItem Text="Inadequado"  Value="2" />
                                <asp:ListItem Text="Entende ordens"  Value="3" />
                                <asp:ListItem Text="Não contactua"  Value="4" />
                                <asp:ListItem Text="Contactua - Qual resposta? "  Value="5" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px" HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:TextBox ID="dsAvalDesenvMotorCognitivoResp" runat="server"  Width="230px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Reflexos primitivos: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idReflexosPrimitivos" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados"  Value="1" />
                                <asp:ListItem Text="Presentes"  Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Quais? " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsReflexosPrimitivosQuais" runat="server"  Width="205px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <strong>Supino</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Simetria: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSupinoSimetria" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente"  Value="1" />
                                <asp:ListItem Text="Ausente"  Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Alinhamento: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSupinoAlinhamento" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Movimentação ativa: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSupinoMovimentacaoAtiva" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" Value="1" />
                                <asp:ListItem Text="Presentes" Value="2" />
                                <asp:ListItem Text="Hipoativa" Value="3" />
                                <asp:ListItem Text="Agitação" Value="4" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Observação: " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsSupinoObservacao" runat="server"  Width="640px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />
                <strong>Prono</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Controle servical: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idPronoControleServical" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" Value="1" />
                                <asp:ListItem Text="Incompleto" Value="2" />
                                <asp:ListItem Text="Presente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Controle escapular: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idPronoControleEscapular" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" Value="1" />
                                <asp:ListItem Text="Incompleto" Value="2" />
                                <asp:ListItem Text="Presente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Simetria: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idPronoSimetria" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Alinhamento: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idPronoAlinhamento" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Movimentação ativa: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idPronoMovimentacaoAtiva" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" Value="1" />
                                <asp:ListItem Text="Presentes" Value="2" />
                                <asp:ListItem Text="Hipoativa" Value="3" />
                                <asp:ListItem Text="Agitação" Value="4" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Observação: " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsPronoObservacao" runat="server"  Width="640px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Rolar</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idRolar" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Realiza" Value="1" />
                                <asp:ListItem Text="Não realiza" Value="2" />
                                <asp:ListItem Text="Inicia, porém incompleto" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Decúbito: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idRolaDecubito" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="D" Value="1" />
                                <asp:ListItem Text="E" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasUsoPadraoPatologico" Text=" Uso de padrão patológico - Qual? " runat="server" />  
                            <span>  </span>
                            <asp:TextBox ID="dsUsoPadraoPatologicoQual" runat="server"  Width="120px" />                            
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell Width="50px"> </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idRolarDissociacao" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Com dissociação" Value="2" />
                                <asp:ListItem Text="Sem dissociação" Value="1" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Sentado</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Controle servical: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoControleServical" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" Value="1" />
                                <asp:ListItem Text="Incompleto" Value="2" />
                                <asp:ListItem Text="Presente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Controle de tronco: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoControleTronco" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                                <asp:ListItem Text="Incompleto" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Simetria: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoSimetria" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Alinhamento: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoAlinhamento" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Movimentação ativa: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoMovimentacaoAtiva" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" Value="1" />
                                <asp:ListItem Text="Presentes" Value="2" />
                                <asp:ListItem Text="Hipoativa" Value="3"  />
                                <asp:ListItem Text="Agitação" Value="4" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Observação: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsSentadoObservacao" runat="server"  Width="620px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="150px">
                            <asp:Label Text="Troca postural de supino para sentado: " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell> </asp:TableCell>
                            <asp:TextBox ID="dsTrocaPosturalSupinoSentado" runat="server"  Width="620px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Postura de quadril: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoPosturaQuadril" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Alinhada" Value="1" />
                                <asp:ListItem Text="Inclinada - " Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoPosturaQuadrilIncl" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="D" Value="1" />
                                <asp:ListItem Text="E" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Deformidade Coluna: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoDeformColuna" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Ausente" Value="1" />
                                <asp:ListItem Text="Presente - Qual?" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoDeformColunaPres" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Postural" Value="2" />
                                <asp:ListItem Text="Fixa" Value="1" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Deformidade de quadril: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoDeformQuadril" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" Value="1" />
                                <asp:ListItem Text="Presente - galeazzi" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idSentadoDeformQuadrilPres" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="D" Value="1" />
                                <asp:ListItem Text="E" Value="2" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />
                <strong>Engatinhar</strong>


                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idEngatinhar" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Sim" Value="2" />
                                <asp:ListItem Text="Não" Value="1" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Descrição: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsEngatinhar" runat="server"  Width="660px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Arrastar</strong>


                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idArrastar" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Sim" Value="2" />
                                <asp:ListItem Text="Não" Value="1" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Descrição: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsArrastar" runat="server"  Width="660px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />
                <strong>Ortostatismo</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:RadioButtonList ID="idOrtostatismo" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente " Value="1" />
                                <asp:ListItem Text="Ausente" Value="2" />
                                <asp:ListItem Text="Sustento pacial" Value="3" />
                                <asp:ListItem Text="Base de apoio aumentada" Value="4" />
                                <asp:ListItem Text="Base de apoio diminuída" Value="5" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Posicionamento dos pés: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="idOrtostatismoPosicPes" runat="server"  Width="610px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />
                <strong>Marcha</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idMarcha" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Realiza" Value="2" />
                                <asp:ListItem Text="Não realiza" Value="1" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Descrição: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsMarcha" runat="server"  Width="590px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Observações</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsMarchaObservacoes" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Avaliação do Tônus</strong>

                <br />
                <br />
                <br />
                <strong>Tônus de base</strong>

                <br />
                <br />

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasHipertoniaElastica" Text="Hipertonia elástica (grupos musculares)" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsHipertoniaElastica" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Sinais clínicos: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsHipertElastSinaisClinicos" runat="server"  Width="670px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Asworth: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsHipertElastAsWorth" runat="server"  Width="670px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasHipertoniaPlastica" Text="Hipertonia plástica" runat="server" />
                            <asp:Label Text=" Localização: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsHipertoniaPlasticaLocalizacao" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Sinais clínicos: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsHipertPlastSinaisClinicos" runat="server"  Width="480px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasDiscinesias" Text="Discinesias (flutuações tônicas) Qual?" runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsDiscinesiasQual" runat="server"  Width="480px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idDiscinesias" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Atetose" Value="1" />
                                <asp:ListItem Text="Coréia" Value="2" />
                                <asp:ListItem Text="Distonia" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Localização: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsDiscinesiasLocalizacao" runat="server" TextMode="MultiLine" Columns="50" Rows="3" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasHipotonia" Text="Hipotonia" runat="server" />
                            <asp:Label Text=" Localização: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsHipotoniaLocalizacao" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox ID="hasIncoordenacaoMov" Text="Incoordenação de movimentos" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList ID="idIncoordenacaoMov" runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Ataxia" Value="1" />
                                <asp:ListItem Text="Dismetria" Value="2" />
                                <asp:ListItem Text="Hipometria" Value="3" />
                                <asp:ListItem Text="Hipermetria" Value="4" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Tônus dinâmico: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsTonusDinamico" runat="server" TextMode="MultiLine" Columns="50" Rows="3" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <strong>Encurtamentos Musculares e Deformidades:</strong>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsEncurtamentoMuscDeform" runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Força muscular: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsForcaMuscular" runat="server"  Width="660px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />

                
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Grupos musculares: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="D: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="E: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="MMSS" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsDireitoMMSS" runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsEsquerdoMMSS" runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="MMII" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsDireitoMMII" runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsEsquerdoMMII" runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />

                <strong>Mecanismo Reflexo Postural:</strong>
                <br />
                <br />

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Reações posturais: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Postura sentada: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Bípede: " runat="server" Font-Bold="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Reações de Endireitamento (A,I,C)" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsReacEndireitPostSentada" runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsReacEndireitBipede" runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Reações de Equilíbrio (A,I,C)" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsReacEquilibrioPostSentada" runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsReacEquilibrioBipede" runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Reações de Proteção (A,P)" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsReacProtecaoPostSentada" runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsReacProtecaoBipede" runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>



                <hr />

                <strong>Atividades de Vida Diária:</strong>
                <br />
                <br />

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Alimentação: " runat="server"/>
                            <asp:RadioButtonList ID="idAtivVidaDiariaAlimentacao" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" Value="1" />
                                <asp:ListItem Text="Semi-dependente" Value="2" />
                                <asp:ListItem Text="Independente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsAtivVidaDiariaAlimentacao" runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Higiene: " runat="server"/>
                            <asp:RadioButtonList ID="idAtivVidaDiariaHigiene" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" Value="1" />
                                <asp:ListItem Text="Semi-dependente" Value="2" />
                                <asp:ListItem Text="Independente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsAtivVidaDiariaHigiene" runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Vestuário: " runat="server"/>
                            <asp:RadioButtonList ID="idAtivVidaDiariaVestuario" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" Value="1" />
                                <asp:ListItem Text="Semi-dependente" Value="2" />
                                <asp:ListItem Text="Independente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsAtivVidaDiariaVestuario" runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Locomoção: " runat="server"/>
                            <asp:RadioButtonList ID="idAtivVidaDiariaLocomocao" runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" Value="1" />
                                <asp:ListItem Text="Semi-dependente" Value="2" />
                                <asp:ListItem Text="Independente" Value="3" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox ID="dsAtivVidaDiariaLocomocao" runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <strong>Sistema respiratório:</strong>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsSistemaRespiratorio" runat="server" TextMode="MultiLine" Columns="50" Rows="3" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <strong>Objetivos:</strong>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsObjetivos" runat="server" TextMode="MultiLine" Columns="50" Rows="15" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <strong>Evolução do período:</strong>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox ID="dsEvolucaoPeriodo" runat="server" TextMode="MultiLine" Columns="50" Rows="10" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <asp:Table runat="server" HorizontalAlign="Right">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancelar" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnSalvar" runat="server" CssClass="btn btn-success" Text="Salvar" OnClick="btnSalvar_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>