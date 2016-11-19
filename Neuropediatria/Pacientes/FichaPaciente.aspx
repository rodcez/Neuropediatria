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
                            <asp:TextBox ID="TextBox1" runat="server" Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox2" runat="server" Width="120px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox3" runat="server" Width="140px" TextMode="Date" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell Width="100px">
                            <asp:TextBox ID="TextBox4" runat="server" Width="140px" TextMode="Date" />
                            <asp:TextBox ID="TextBox5" runat="server" Width="140px" TextMode="Date" />
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
                            <asp:TextBox ID="candNome" runat="server" Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="TextBox6" runat="server" Width="70px" TextMode="Number" />
                        </asp:TableCell>
                        <asp:TableCell Width="80px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="M" />
                                <asp:ListItem Text="F" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="80px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="140px" TextMode="Date"/>
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
                            <asp:Label Text="Telefone (Opcional): " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="100px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="140px" />
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
                            <asp:TextBox runat="server"  Width="100px" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="validarCep" runat="server" CssClass="btn-xs btn-link" Text="Validar CEP" OnClick="validarCep_Click" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="100px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="70px" />
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
                            <asp:TextBox runat="server"  Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="70px" />
                        </asp:TableCell>
                        <asp:TableCell Width="70px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="150px" />
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
                            <asp:TextBox ID="candPatologia" runat="server" Width="320px" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="290px" />
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
                            <asp:TextBox runat="server" Width="320px"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" Width="290px"/>
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
                            <asp:TextBox runat="server" Width="320px"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" Width="290px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox Text="ADNPM" runat="server" />
                            <asp:TableCell Width="100px"> </asp:TableCell>
                            <span> Motivo: </span>
                            <asp:TextBox runat="server" Width="660px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Sindrome de Down" />
                                <asp:ListItem Text="Paralisia Braquial congênita" />
                                <asp:ListItem Text="Mielomengocele" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox Text="Outras síndomes" runat="server" />
                            <asp:TableCell Width="100px"> </asp:TableCell>
                            <span> Qual?: </span>
                            <asp:TextBox runat="server" Width="600px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Encefalopatia Crônica infantil não progressiva: " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Sim" />
                                <asp:ListItem Text="Não" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Classificação topográfica " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Tetraparesia" />
                                <asp:ListItem Text="Disaparesia" />
                                <asp:ListItem Text="Hemiparesia" />
                                <asp:ListItem Text="Dupla Hemiparesia" />
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
                            <asp:TextBox runat="server"  Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Nível: " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Leve" />
                                <asp:ListItem Text="Moderado" />
                                <asp:ListItem Text="Grave" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="GMFCS nível: " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="1" />
                                <asp:ListItem Text="2" />
                                <asp:ListItem Text="3" />
                                <asp:ListItem Text="4" />
                                <asp:ListItem Text="5" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="pré natal" />
                                <asp:ListItem Text="peri natal" />
                                <asp:ListItem Text="pos natal" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <strong>Avaliação do Desenvolvimento Motor</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Visão " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Parcial - Acompanha o objeto mas não fixa" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Audição " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Parcial - Acompanha o som" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Linguagem " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Se comunica olhar" />
                                <asp:ListItem Text="Se comunica gestos" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Cognitivo " runat="server"/>
                            <asp:RadioButtonList runat="server" Width="780px" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Adequado" />
                                <asp:ListItem Text="Inadequado" />
                                <asp:ListItem Text="Entende ordens" />
                                <asp:ListItem Text="Não contactua" />
                                <asp:ListItem Text="Contactua - Qual resposta? " />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px" HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="230px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Reflexos primitivos: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" />
                                <asp:ListItem Text="Presentes" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Quais? " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="205px" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" />
                                <asp:ListItem Text="Presentes" />
                                <asp:ListItem Text="Hipoativa" />
                                <asp:ListItem Text="Agitação" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Observação: " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="640px" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Incompleto" />
                                <asp:ListItem Text="Presente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Controle escapular: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Incompleto" />
                                <asp:ListItem Text="Presente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Simetria: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Alinhamento: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Movimentação ativa: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" />
                                <asp:ListItem Text="Presentes" />
                                <asp:ListItem Text="Hipoativa" />
                                <asp:ListItem Text="Agitação" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Observação: " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="640px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Rolar</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Realiza" />
                                <asp:ListItem Text="Não realiza" />
                                <asp:ListItem Text="Inicia, porém incompleto" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Decúbito: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="D" />
                                <asp:ListItem Text="E" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:CheckBox Text=" Uso de padrão patológico - Qual? " runat="server" />  
                            <span>  </span>
                            <asp:TextBox runat="server"  Width="120px" />                            
                        </asp:TableCell>
                        <asp:TableCell>
                        </asp:TableCell>
                        <asp:TableCell Width="50px"> </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Com dissociação" />
                                <asp:ListItem Text="Sem dissociação" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Incompleto" />
                                <asp:ListItem Text="Presente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Controle de tronco: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Incompleto" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Simetria: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Alinhamento: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente" />
                                <asp:ListItem Text="Ausente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Movimentação ativa: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Integrados" />
                                <asp:ListItem Text="Presentes" />
                                <asp:ListItem Text="Hipoativa" />
                                <asp:ListItem Text="Agitação" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Observação: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="620px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="150px">
                            <asp:Label Text="Troca postural de supino para sentado: " runat="server"/> </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="620px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Postura de quadril: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Alinhada" />
                                <asp:ListItem Text="Inclinada - " />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="D" />
                                <asp:ListItem Text="E" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Deformidade Coluna: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Presente - Qual?" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Postural" />
                                <asp:ListItem Text="Fixa" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Deformidade de quadril: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Presente - galeazzi" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="D" />
                                <asp:ListItem Text="E" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Sim" />
                                <asp:ListItem Text="Não" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Descrição: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="660px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Arrastar</strong>


                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Sim" />
                                <asp:ListItem Text="Não" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Descrição: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="660px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />
                <strong>Ortostatismo</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Presente " />
                                <asp:ListItem Text="Ausente" />
                                <asp:ListItem Text="Sustento pacial" />
                                <asp:ListItem Text="Base de apoio aumentada" />
                                <asp:ListItem Text="Base de apoio diminuída" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Posicionamento dos pés: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="610px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <hr />
                <strong>Marcha</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Não realiza" />
                                <asp:ListItem Text="Realiza" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Descrição: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="590px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <strong>Observações</strong>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:CheckBox Text="Hipertonia elástica (grupos musculares)" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server"  Width="670px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Asworth: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="670px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox Text="Hipertonia plástica" runat="server" />
                            <asp:Label Text=" Localização: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server"  Width="480px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox Text="Discinesias (flutuações tônicas) Qual?" runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="480px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Atetose" />
                                <asp:ListItem Text="Coréia" />
                                <asp:ListItem Text="Distonia" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="3" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox Text="Hipotonia" runat="server" />
                            <asp:Label Text=" Localização: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:CheckBox Text="Incoordenação de movimentos" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table runat="server">
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar correcaoDoPrimeiro">
                                <asp:ListItem Text="Ataxia" />
                                <asp:ListItem Text="Dismetria" />
                                <asp:ListItem Text="Hipometria" />
                                <asp:ListItem Text="Hipermetria" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="3" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="5" Width="780px" />
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
                            <asp:TextBox runat="server"  Width="660px" />
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
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="MMII" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
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
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Reações de Equilíbrio (A,I,C)" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Label Text="Reações de Proteção (A,P)" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
                        </asp:TableCell>
                        <asp:TableCell Width="40px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server"  Width="250px" />
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
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" />
                                <asp:ListItem Text="Semi-dependente" />
                                <asp:ListItem Text="Independente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Higiene: " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" />
                                <asp:ListItem Text="Semi-dependente" />
                                <asp:ListItem Text="Independente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Vestuário: " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" />
                                <asp:ListItem Text="Semi-dependente" />
                                <asp:ListItem Text="Independente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="750px" />
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow Height="50px">
                        <asp:TableCell Width="780px">
                            <asp:Label Text="Locomoção: " runat="server"/>
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" CssClass="separar">
                                <asp:ListItem Text="Dependente" />
                                <asp:ListItem Text="Semi-dependente" />
                                <asp:ListItem Text="Independente" />
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="50px">
                        <asp:TableCell>
                            <asp:Label Text="Obs: " runat="server"/>
                        <asp:TableCell Width="100px"> </asp:TableCell>
                            <asp:TextBox runat="server"  Width="750px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="3" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="15" Width="780px" />
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
                            <asp:TextBox runat="server" TextMode="MultiLine" Columns="50" Rows="10" Width="780px" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <hr />
                <asp:Table runat="server">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <strong>Estagiário:</strong>
                            <asp:Label Text="Estagiário X: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <strong>Supervisor:</strong>
                            <asp:Label Text="Obs: " runat="server"/>
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