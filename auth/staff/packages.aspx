<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="CapstoneWebPage.auth.staff.packages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" DataSourceID="sdsStudents">
                <Columns>
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="sdsPackagesAssignedStudents" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsStudents" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT Username FROM aspnet_Users 
INNER JOIN aspnet_UsersInRoles ON aspnet_UsersInRoles.UserId = aspnet_Users.UserId
INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId
WHERE aspnet_Roles.RoleName = 'student' ORDER BY Username"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsPackages" runat="server"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
