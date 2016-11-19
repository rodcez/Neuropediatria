<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Neuropediatria.Default" %>

<asp:Content ID="paginaDefault" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    
    <h2 style="text-align:center;">Módulos de acesso</h2>
    <hr /><br />

    <asp:Table runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btRelatorio" runat="server" Text="Relatorios" CssClass="btn btn-warning btn-lg" OnClick="btRelatorio_Click"/>
            </asp:TableCell>
            <asp:TableCell Width="20px"></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btCandidatos" runat="server" Text="Candidatos" CssClass="btn btn-info btn-lg" OnClick="btCandidatos_Click"/>
            </asp:TableCell>
            <asp:TableCell Width="20px"></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btPacientes" runat="server" Text="Pacientes" CssClass="btn btn-primary btn-lg" OnClick="btPacientes_Click"/>
            </asp:TableCell>
            <asp:TableCell Width="20px"></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btMeusPacientes" runat="server" Text="Meus Pacientes" CssClass="btn btn-success btn-lg" OnClick="btMeusPacientes_Click"/>
            </asp:TableCell>
            <asp:TableCell Width="20px"></asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btUsuarios" runat="server" Text="Usuarios" CssClass="btn btn-danger btn-lg" OnClick="btUsuarios_Click"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>