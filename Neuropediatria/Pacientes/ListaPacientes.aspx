<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPacientes.aspx.cs" Inherits="Neuropediatria.Pacientes.ListaPacientes" %>

<asp:Content ID="paginaListaPacientes" runat="server" ContentPlaceHolderID="ConteudoPrincipal">

    <br />
    <div id="btnsConfirmar" runat="server" visible="false" style="text-align: center;">
        <asp:Button ID="btnSim" runat="server" CssClass="btn btn-success" Text="Sim" OnClick="btnSim_Click"  />
        <asp:Button ID="btnNao" runat="server" CssClass="btn btn-danger" Text="Não" OnClick="btnNao_Click"  />
    </div>

    <div id="btnsConfirmar2" runat="server" visible="false" style="text-align: center;">
        <asp:Button ID="btnSim2" runat="server" CssClass="btn btn-success" Text="Sim" OnClick="btnSim_Click2"  />
        <asp:Button ID="btnNao2" runat="server" CssClass="btn btn-danger" Text="Não" OnClick="btnNao_Click2"  />
    </div>

    <br />
    <br />
    <h2 style="text-align: center;">Pacientes</h2>
    <hr />

    <div class="pull-left">
        Mostrar somente fichas ativas: 
        <asp:CheckBox ID="visuTodos" runat="server" OnCheckedChanged="visuTodos_CheckedChanged" AutoPostBack="true"/>
        <br />
        <asp:Button ID="btExportar" Visible="false" runat="server" CssClass="btn btn-warning" Text="Exportar Lista" OnClick="btExportar_Click"/>
    </div>

    <div class="pull-right">
        <h5>Ordenação: </h5>

        <asp:DropDownList ID="ordenaLista" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ordenaLista_SelectedIndexChanged">
            <asp:ListItem Text="Selecione..." Value="" />
            <asp:ListItem Text="Paciente" Value="dsNome" />
            <asp:ListItem Text="Idade" Value="dtNascimento" />
            <asp:ListItem Text="Patologia" Value="dsPatologia" />
            <asp:ListItem Text="Aluno" Value="dsNomeAluno" />
            <asp:ListItem Text="Alocação" Value="dtAlocacao" />
        </asp:DropDownList>
        <br />
        <br />
    </div>
    
    <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="false" 
        OnRowCommand="gvPacientes_RowCommand" DataKeyNames="idCandidato, dsNome, idFicha"
        OnRowDataBound="gvPacientes_RowDataBound" CssClass="table table-bordered">
        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField HeaderText="Ativo" DataField="ativo"/>
            <asp:ButtonField CommandName="visuCandidato" ItemStyle-Width="130px"
                HeaderText="Visualizar" Text="Visualizar" 
                ControlStyle-CssClass="btn btn-primary" ItemStyle-HorizontalAlign="Center"/>            
            <asp:ButtonField CommandName="fichaCandidato" ItemStyle-Width="130px"
                HeaderText="Ficha" Text="Ficha" 
                ControlStyle-CssClass="btn btn-info" ItemStyle-HorizontalAlign="Center"/>
            <asp:BoundField HeaderText="Nome Paciente" DataField="dsNome" />
            <asp:TemplateField HeaderText="Idade" SortExpression="isPaciente">
                <ItemTemplate><%# Math.Abs((int.Parse(Convert.ToDateTime(Eval("dtNascimento").ToString()).ToString("yyyyMMdd")) - int.Parse(DateTime.Today.ToString("yyyyMMdd"))) / 10000) %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Patologia" DataField="dsPatologia" />
            <asp:BoundField HeaderText="Alocação" DataField="dtAlocacao" DataFormatString="{0:dd/MM/yyyy}"/>
            <asp:BoundField HeaderText="Estagiario" DataField="dsNomeAluno" />                     
            <asp:ButtonField HeaderText="Excluir" CommandName="excluirPaciente" ItemStyle-Width="100px" Text="Excluir" 
                ControlStyle-CssClass="btn btn-danger"  ItemStyle-HorizontalAlign="Center"/>
        </Columns>
    </asp:GridView>
    <br />
    <br />

</asp:Content>