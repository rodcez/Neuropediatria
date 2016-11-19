<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaCandidatos.aspx.cs" Inherits="Neuropediatria.Candidatos.ListaCandidatos" %>

<asp:Content ID="paginaListaCandidatos" runat="server" ContentPlaceHolderID="ConteudoPrincipal">
    
    <br />
    <div id="btnsConfirmar" runat="server" visible="false" style="text-align: center;">
        <asp:Button ID="btnSim" runat="server" CssClass="btn btn-success" Text="Sim" OnClick="btnSim_Click"  />
        <asp:Button ID="btnNao" runat="server" CssClass="btn btn-danger" Text="Não" OnClick="btnNao_Click"  />
    </div>

    <br />
    <br />
    <h2 style="text-align: center;">Candidatos</h2>
    <hr />

    <div class="pull-right">
        <h5>Ordenação: </h5>

        <asp:DropDownList ID="ordenaLista" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ordenaLista_SelectedIndexChanged">
            <asp:ListItem Text="Selecione..." Value="" />
            <asp:ListItem Text="Nome" Value="nome" />
            <asp:ListItem Text="Idade" Value="idade" />
            <asp:ListItem Text="Patologia" Value="patologia" />
        </asp:DropDownList>
        <br />
        <br />
    </div>

    <br />
    <asp:Button ID="maisCandidato" runat="server" Text="+ Candidato" CssClass="btn btn-success" OnClick="maisCandidato_Click" />

    <asp:GridView ID="gvCandidatos" runat="server" AutoGenerateColumns="false" 
        OnRowCommand="gvCandidatos_RowCommand" DataKeyNames="idCandidato, dsNome"
        CssClass="table table-bordered">
        <Columns>
            <asp:BoundField HeaderText="Nome" DataField="id" Visible="false" />
            <asp:ButtonField CommandName="visuCandidato" ItemStyle-Width="130px"
                HeaderText="Visualizar" Text="Visualizar" 
                ControlStyle-CssClass="btn btn-primary" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField HeaderText="Nome" DataField="dsNome" />
            <asp:TemplateField HeaderText="Idade" SortExpression="isPaciente">
                <ItemTemplate><%# Math.Abs((int.Parse(Convert.ToDateTime(Eval("dtNascimento").ToString()).ToString("yyyyMMdd")) - int.Parse(DateTime.Today.ToString("yyyyMMdd"))) / 10000) %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Patologia" DataField="dsPatologia" />
            <asp:TemplateField HeaderText="Status" SortExpression="isPaciente">
                <ItemTemplate><%# (Convert.ToBoolean(int.Parse(Eval("isPaciente").ToString()))) ? "Paciente" : "Candidato" %></ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField CommandName="candPaciente" ItemStyle-Width="130px"
                HeaderText="Transformar em" Text="Paciente" 
                ControlStyle-CssClass="btn btn-warning"  ItemStyle-HorizontalAlign="Center"/>
        </Columns>
    </asp:GridView>
    <br />
    <br />

</asp:Content>
