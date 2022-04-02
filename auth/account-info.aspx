<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="account-info.aspx.cs" Inherits="CapstoneWebPage.account_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <center>
            <h1 style="font-size: 60px;">Account Information</h1>
        </center>
    </header>
    <p><strong>Username</strong></p>
    <p><strong>E-Mail</strong></p>
    <p><strong>Phone</strong></p>
    <p><strong>Change Password</strong></p>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Login ID="Login1" runat="server"></asp:Login>
</asp:Content>
