<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Neuropediatria.Login.Login" %>

<asp:Content ID="paginaLogin" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <style>
        .separar {
            height: 10px;
        }
    </style>

    <br />
    <br />
    <h2 style="text-align: center;">Entrar no sistema</h2>
    <br />
    <hr />

    <asp:Table runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                 <asp:Label runat="server" Text="Usuário: " Width="70px"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow CssClass="separar">
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                        <asp:Label runat="server" Text="Senha: " Width="70px"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtSenha" runat="server" TextMode="Password"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow CssClass="separar">
            <asp:TableCell></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnEntrar" runat="server" CssClass="btn btn-primary" Text="Entrar" OnClick="btnEntrar_Click"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
                    <p class="text-danger">
                        <asp:Literal runat="server" ID="Literal1" Text="Erro" />
                    </p>
                </asp:PlaceHolder>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
