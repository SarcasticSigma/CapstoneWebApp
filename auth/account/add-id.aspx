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

            <asp:RegularExpressionValidator ValidationGroup="submission" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only numbers are allowed!" ControlToValidate="txtMGAId" ValidationExpression="\d+">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator  ValidationGroup="submission" ControlToValidate="txtMGAId" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter an ID!"></asp:RequiredFieldValidator>
            <asp:CustomValidator ValidationGroup="submission" ID="SWORDSIdValidator" runat="server" ErrorMessage="This is not a valid MGA ID!" ControlToValidate="txtMGAId" OnServerValidate="SWORDSIdValidator_ServerValidate"></asp:CustomValidator>
            <asp:CustomValidator ValidationGroup="submission" ID="UniqueIdValidator" runat="server" ErrorMessage="This ID has already been associated with a SQUIRE account!" ControlToValidate="txtMGAId" OnServerValidate="UniqueIdValidator_ServerValidate"></asp:CustomValidator>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

        </tr>
        <tr>
            <td>
                <asp:Button ValidationGroup="submission" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
        </tr>
    </table>
</asp:Content>
