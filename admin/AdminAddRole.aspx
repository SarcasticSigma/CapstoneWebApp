<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddRole.aspx.cs" Inherits="CapstoneWebPage.admin.AdminAddRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tc>
                    <tr>
                        <td>
                            <asp:Label ID="lblRoleName" runat="server" Text="Role Name:" AssociatedControlID="txtRoleName"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Add Role" OnClick="btnSubmit_Click" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label></td>
                    </tr>
                </tc>
            </table>
        </div>
    </form>
</body>
</html>
