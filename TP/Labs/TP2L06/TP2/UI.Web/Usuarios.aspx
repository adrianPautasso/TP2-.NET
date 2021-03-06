﻿<%@ Page Title="Usuarios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="UI.Web.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
<asp:Panel ID="grdUsuarios" runat="server">
    <asp:GridView ID="gridView" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="false"
        SelectedRowStyle-BackColor="Black"
        SelectedRowStyle-ForeColor="White"
        DataKeyNames="ID"
        OnSelectedIndexChanged="gridView_SelectedIndexChanged">
        <Columns>
        <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
        <asp:BoundField HeaderText="Apellido" DataField="Apellido" />
        <asp:BoundField HeaderText="EMail" DataField="EMail" />
        <asp:BoundField HeaderText="Usuario" DataField="NombreUsuario" />
        <asp:BoundField HeaderText="Habilitado" DataField="Habilitado" />
        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="true" />
        </Columns>
        </asp:GridView>
</asp:Panel>

<asp:Panel ID="formPanel" Visible="false" runat="server" >
    <asp:Label ID="nombreLabel" runat="server" Text="Nombre: "></asp:Label>
    <asp:TextBox ID="nombreTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="apellidoLabel" runat="server" Text="Apellido: "></asp:Label>
    <asp:TextBox ID="apellidoTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="emailLabel" runat="server" Text="Email: "></asp:Label>
    <asp:TextBox ID="emailTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="habilitadoLabel" runat="server" Text="Habilitado: "></asp:Label>
    <asp:CheckBox ID="habilitadoCheckBox" runat="server"></asp:CheckBox>
    <br />
    <asp:Label ID="nombreUsuarioLabel" runat="server" Text="Usuario: "></asp:Label>
    <asp:TextBox ID="nombreUsuarioTextBox" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="claveLabel" runat="server" Text="Clave: "></asp:Label>
    <asp:TextBox ID="claveTextBox" TextMode="Password" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="repetirClaveLabel" runat="server" Text="Repetir Clave: "></asp:Label>
    <asp:TextBox ID="repetirclaveTextBox" TextMode="Password" runat="server"></asp:TextBox>
    <br />
</asp:Panel>

<asp:Panel ID="gridActionsPanel" runat="server">
<asp:LinkButton ID="editarLinkButton" runat="server">Editar</asp:LinkButton>
<asp:LinkButton ID="elimnarLinkButton" runat="server">Eliminar</asp:LinkButton>
<asp:LinkButton ID="nuevoLinkButton" runat="server">Nuevo</asp:LinkButton>
</asp:Panel>

<asp:Panel ID="formActionPanel" runat="server">
    <asp:LinkButton ID="aceptarLinkButton" runat="server" 
        onclick="aceptarLinkButton_Click">Aceptar</asp:LinkButton>
    <asp:LinkButton ID="cancelarLinkButton" runat="server" 
        onclick="cancelarLinkButton_Click">Cancelar</asp:LinkButton>
</asp:Panel>


</asp:Content>
