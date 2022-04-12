<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="CapstoneWebPage.account_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <center>
            <h1 style="font-size: 60px;">Account Information</h1>
        </center>
    </header>

    <table>
        <tc>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Username:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="MGA ID:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMGAId" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Phone Number:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
                </td>



            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Student Type:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtStudentType" Text="Residential" runat="server" Enabled="false"></asp:TextBox>

                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Note: Squire is currently only available for residential students"></asp:Label></td>

            </tr>
            <tr>

                <td>

                    <asp:HyperLink ID="hyperChangePassword" runat="server">Change Password</asp:HyperLink>
                </td>

            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Reset" /></td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Save Changes" />
                </td>
            </tr>
        </tc>

    </table>



</asp:Content>
