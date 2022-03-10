<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CapstoneWebPage.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label runat="server" id="lblUsername" AssociatedControlID="txtUsername">Username: </asp:Label>
    <asp:TextBox id="txtUsername" runat="server"></asp:TextBox>
    <br />
    <asp:Label runat="server" id="Label1" AssociatedControlID="txtPassword">Password: </asp:Label>
    <asp:TextBox id="txtPassword" runat="server" TextMode="Password"></asp:TextBox><br />
    <asp:Button runat="server" ID="btnSubmit" text="Submit" OnClick="btnSubmit_Click"/>
    <asp:Label runat="server" ID="lblOutput" Text="..."></asp:Label>
</asp:Content>
