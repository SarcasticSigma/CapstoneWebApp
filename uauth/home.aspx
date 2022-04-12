<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CapstoneWebPage.uauth.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Welcome to Squire!</h1>
    <h2></h2>
    <asp:LoginView ID="LoginView1" runat="server"></asp:LoginView>
    

</asp:Content>
