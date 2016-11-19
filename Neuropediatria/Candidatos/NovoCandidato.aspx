<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NovoCandidato.aspx.cs" Inherits="Neuropediatria.Candidatos.NovoCandidato" %>

<asp:Content ID="paginaNovoCandidato" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <style>
        .separar input[type="radio"] {
            margin-left: 15px;
            margin-right: 2px;
        }
        
        .centralizar {
            text-align: center;
        }
    </style>

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
                            <asp:Label Text="Nome completo: " runat="server" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>                        
                        <asp:TableCell>
                            <asp:Label Text="Data de Nascimento: " runat="server"/>
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Telefone: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="dsNome" runat="server" Width="350px"/>
                            <asp:RequiredFieldValidator ID="validNomeReq" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="dsNome" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>                        
                        <asp:TableCell>
                            <asp:TextBox ID="dtNascimento" runat="server" Width="140px" TextMode="Date"/>
                            <asp:RequiredFieldValidator ID="validIdade" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="dtNascimento" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="numTelefone" runat="server"  Width="150px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="numTelefone" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>


                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Responsável: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>

                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="dsResponsavel" runat="server"  Width="350px" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="dsResponsavel" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />

                <asp:Table runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label Text="Patologia: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:TextBox ID="dsPatologia" runat="server" Width="350px" />
                            <asp:RequiredFieldValidator ID="validPatologia" runat="server" ErrorMessage=" ! " Display="Static"
                                ControlToValidate="dsPatologia" ValidationGroup="validCandidato" 
                                ForeColor="White" Font-Bold="true" BackColor="Red"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <hr />
                <asp:Table ID="alocacao" runat="server" HorizontalAlign="Left" Visible="false">
                    <asp:TableRow>                        
                        <asp:TableCell>
                            <asp:Label Text="Estagiário: " runat="server"/>
                        </asp:TableCell>                        
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label Text="Data alocação: " runat="server"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>                        
                        <asp:TableCell>
                            <asp:DropDownList ID="ddEstagiario" runat="server" CssClass="ladoAlado" />
                        </asp:TableCell>  
                        <asp:TableCell Width="20px"> </asp:TableCell>                      
                        <asp:TableCell>                            
                            <asp:TextBox ID="dtAlocacao" runat="server" Width="140px" TextMode="Date"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <asp:Table runat="server" HorizontalAlign="Right">
                    <asp:TableRow>  
                        <asp:TableCell>
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancelar" />
                        </asp:TableCell>
                        <asp:TableCell Width="20px"> </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Salvar" OnClick="btnSalvar_Click" />
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
