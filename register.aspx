<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CapstoneWebPage.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="font-size: 60px;">Home</h1>
    
   <asp:Label runat="server" ID="lblUsername" Text="Username: " AssociatedControlID="txtUsername"></asp:Label>
    <asp:TextBox runat="server" ID="txtUsername"></asp:TextBox>
    <br />
   <asp:Label runat="server" ID="lblFirstName" Text="First Name: " AssociatedControlID="txtFirstName"></asp:Label>
    <asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox>
    <br />
    <asp:Label runat="server" ID="lblLastName" Text="Last Name: " AssociatedControlID="txtLastName"></asp:Label>
    <asp:TextBox runat="server" ID="txtLastName"></asp:TextBox>
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Selected="True">Student</asp:ListItem>
        <asp:ListItem>Staff</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Label runat="server" ID="lblPassword" Text="Password: " AssociatedControlID="txtPassword"></asp:Label>
    <asp:TextBox runat="server" ID="txtPassword"></asp:TextBox>

    <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click"/>
</asp:Content>
