<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDebug.aspx.cs" Inherits="CapstoneWebPage.admin.Debu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Literal ID="txtUser" runat="server"></asp:Literal><br /><br />
    <asp:Literal ID="txtUserRoles" Text="Roles: " runat="server"></asp:Literal><br /><br />
    <asp:TextBox ID="txtUserProfileProperties" runat="server" Columns="30" Rows="8" TextMode="MultiLine"></asp:TextBox>
    
</asp:Content>
