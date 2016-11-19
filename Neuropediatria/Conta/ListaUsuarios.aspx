<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="Neuropediatria.Conta.ListaUsuarios" %>

<asp:Content ID="paginaListaUsuarios" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <br />
    <br />
    <h2 style="text-align: center;">Usuarios</h2>
    <hr />
    
    <div class="pull-right">
        <h5>Ordenação: </h5>

        <asp:DropDownList ID="ordenaLista" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ordenaLista_SelectedIndexChanged">
            <asp:ListItem Text="Selecione..." Value="idUsuario" />            
            <asp:ListItem Text="Nome" Value="nome" />
            <asp:ListItem Text="Perfil" Value="dsPerfil" />
            <asp:ListItem Text="Usuario" Value="dsUsuario" />
            <asp:ListItem Text="Ativo" Value="ativo" />
        </asp:DropDownList>
        <br />
        <br />
    </div>
    
    <br />
    <asp:Button ID="maisUsuario" runat="server" Text="+ Usuario" CssClass="btn btn-success" OnClick="maisUsuario_Click" />

    <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="false" 
        OnRowCommand="gvUsuarios_RowCommand" DataKeyNames="idUsuario"
        OnRowDataBound="gvUsuarios_RowDataBound" CssClass="table table-bordered">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField HeaderText="Ativo" DataField="ativo" ItemStyle-Width="50px"/>
            <asp:ButtonField CommandName="visuUsuario" ItemStyle-Width="130px"
                HeaderText="Visualizar" Text="Visualizar" 
                ControlStyle-CssClass="btn btn-primary" ItemStyle-HorizontalAlign="Center"/>            
            <asp:TemplateField HeaderText="Nome completo" SortExpression="nome">
                <ItemTemplate><%# !string.IsNullOrWhiteSpace(Eval("dsNomeFuncionario").ToString()) ? Eval("dsNomeFuncionario").ToString() : Eval("dsNomeAluno").ToString() %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Usuário" DataField="dsUsuario" />                     
            <asp:BoundField HeaderText="Perfil do usuário" DataField="dsPerfil" />                     
        </Columns>
    </asp:GridView>
    <br />
    <br />

</asp:Content>