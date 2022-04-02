<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestLogin.aspx.cs" Inherits="CapstoneWebPage.uauth.TestLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Login ID="Login1" runat="server"></asp:Login>
        </div>


        <h2>Login Status:</h2>
        <asp:Literal ID="userOutput" runat="server"></asp:Literal>
        <asp:Literal ID="logged" runat="server"></asp:Literal>
    </form>
</body>
</html>
