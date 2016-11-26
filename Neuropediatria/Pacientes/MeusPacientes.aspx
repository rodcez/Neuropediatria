<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MeusPacientes.aspx.cs" Inherits="Neuropediatria.Pacientes.MeusPacientes" %>

<asp:Content ID="paginaListaPacientes" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <br />
    <br />
    <h2 style="text-align: center;">MeusPacientes</h2>
    <hr />

    <div class="pull-right">
        <h5>Ordenação: </h5>

        <asp:DropDownList ID="ordenaLista" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ordenaLista_SelectedIndexChanged">
            <asp:ListItem Text="Selecione..." Value="" />
            <asp:ListItem Text="Nome" Value="dsNomeAluno" />
            <asp:ListItem Text="Idade" Value="dtNascimento" />
            <asp:ListItem Text="Patologia" Value="dsPatologia" />
            <asp:ListItem Text="Alocação" Value="dtAlocacao" />
        </asp:DropDownList>
        <br />
        <br />
    </div>
    
    <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="false" 
        OnRowCommand="gvPacientes_RowCommand" DataKeyNames="idCandidato, dsNome, idFicha" CssClass="table table-bordered">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:ButtonField CommandName="fichaCandidato" ItemStyle-Width="130px"
                HeaderText="Ficha" Text="Ficha" 
                ControlStyle-CssClass="btn btn-info" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField HeaderText="Nome Paciente" DataField="dsNome" />
            <asp:TemplateField HeaderText="Idade" SortExpression="isPaciente">
                <ItemTemplate><%# Math.Abs((int.Parse(Convert.ToDateTime(Eval("dtNascimento").ToString()).ToString("yyyyMMdd")) - int.Parse(DateTime.Today.ToString("yyyyMMdd"))) / 10000) %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Patologia" DataField="dsPatologia" />
        </Columns>
    </asp:GridView>
    <br />
    <br />

</asp:Content>