<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="add-id.aspx.cs" Inherits="CapstoneWebPage.auth.account.add_id" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Please enter your MGA ID number</h3>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="MGA ID:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtMGAId" runat="server"></asp:TextBox></td>

        </tr>
        <tr >
            <td >
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
    </table>
</asp:Content>
