<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NovoUsuario.aspx.cs" Inherits="Neuropediatria.Conta.NovoUsuario" %>

<asp:Content ID="paginaNovoUsuario" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <style>
        .separar {
            margin-left: 15px;
            margin-right: 2px;
        }
        
        .centralizar {
            text-align: center;
        }
    </style>

    <br />
    <div id="btnsConfirmar" runat="server" visible="false" style="text-align: center;">
        <asp:Button ID="btnSim" runat="server" CssClass="btn btn-success" Text="Sim" OnClick="btnSim_Click"  />
        <asp:Button ID="btnNao" runat="server" CssClass="btn btn-danger" Text="Não" OnClick="btnNao_Click"  />
    </div>

    <br />
    <asp:Label ID="cabecalho" runat="server" CssClass="centralizar"/>
    <hr />
    <br />

    <asp:Table ID="tabelaConteudo" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Nome completo: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Perfil: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="dsNome" runat="server"  Width="315px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="dsNome" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>                            
                            <asp:DropDownList ID="ddPerfil" runat="server" AutoPostBack="true" Width="149px" OnSelectedIndexChanged="ddPerfil_SelectedIndexChanged">
                                <asp:ListItem Text="Selecione..." Value="" />
                                <asp:ListItem Text="Administrador" Value="admin" />
                                <asp:ListItem Text="Coordenador" Value="coordenador" />
                                <asp:ListItem Text="Auxiliar" Value="auxiliar" />
                                <asp:ListItem Text="Estagiário" Value="estagiario" />
                            </asp:DropDownList>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />

                <asp:Table ID="tbAdmin" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Administrador - Módulos acessíveis: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Enabled="false">
                            <asp:CheckBox Text="Candidatos" runat="server" Checked="true"/>
                            <asp:CheckBox Text="Pacientes" runat="server" Checked="true" CssClass="separar"/>
                            <asp:CheckBox Text="Meus Pacientes" runat="server" Checked="true" CssClass="separar"/>
                            <%--<asp:CheckBox Text="Relatorios" runat="server" Checked="true" CssClass="separar"/>--%>
                            <asp:CheckBox Text="Usuarios" runat="server" Checked="true" CssClass="separar"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="tbCoord" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Coordenador - Módulos acessíveis: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="60px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Acesso: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Enabled="false">
                            <asp:CheckBox Text="Candidatos" runat="server" Checked="true"/>
                            <asp:CheckBox Text="Pacientes" runat="server" Checked="true" CssClass="separar"/>
                            <%--<asp:CheckBox Text="Relatorios" runat="server" Checked="true" CssClass="separar"/>--%>
                        </asp:TableCell>
                        <asp:TableCell Width="60px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="cAtivo" Text="Ativo: " runat="server" Checked="true"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

                <asp:Table ID="tbAux" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Auxiliar - Módulos acessíveis: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="162px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Acesso: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Enabled="false">
                            <asp:CheckBox Text="Candidatos" runat="server" Checked="true"/>
                        </asp:TableCell>
                        <asp:TableCell Width="162px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:CheckBox ID="aAtivo" Text="Ativo: " runat="server" Checked="true"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                
                <asp:Table ID="tbEstagiario" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Estagiário - Módulos acessíveis: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="60px"> </asp:TableCell>
                        <asp:TableCell Width="35px"> </asp:TableCell>  
                        <asp:TableCell>
                            <asp:Label Text="Acesso: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell Enabled="false">
                            <asp:CheckBox Text="Meus Candidatos" runat="server" Checked="true"/>
                        </asp:TableCell>
                        <asp:TableCell Width="60px"> </asp:TableCell>
                        <asp:TableCell Width="35px"> </asp:TableCell>  
                        <asp:TableCell>
                            <asp:CheckBox ID="eAtivo" Text="Ativo: " runat="server" Checked="true"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="RGM" runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Supervisor" runat="server"/>
                        </asp:TableCell> 
                        <asp:TableCell Width="10px"> </asp:TableCell>  
                        <asp:TableCell>
                            <asp:Label Text="Estágio - Inicio/Fim" runat="server"/>
                        </asp:TableCell> 
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="idRGM" runat="server" Width="140px"/>                           
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:DropDownList ID="ddCoordenador" runat="server" AutoPostBack="true" Width="110px" />
                        </asp:TableCell>
                        <asp:TableCell Width="10px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dtEstagioInicio" runat="server" Width="140px" TextMode="Date" /><br />
                            <asp:TextBox ID="dtEstagioTermino" runat="server" Width="140px" TextMode="Date" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                
                <asp:Table ID="tbUsuario" runat="server" Visible="false">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Usuário: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>                        
                        <asp:TableCell>
                            <asp:Label Text="Senha: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Confirmação: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="dsUsuario" runat="server" Width="140px"/>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="dsUsuario" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>                        
                        <asp:TableCell>
                            <asp:TextBox ID="dsSenha" runat="server" Width="140px" TextMode="Password"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="dsSenhaConf" runat="server"  Width="150px" TextMode="Password"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <asp:Table runat="server" HorizontalAlign="Right">
                    <asp:TableRow Height="30px">
                        <asp:TableCell>
                            <asp:Button ID="btnCancelar" runat="server" CssClass="btn btn-danger" Text="Cancelar" OnClick="btnCancelar_Click" />
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
