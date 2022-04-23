<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="add-shipper.aspx.cs" Inherits="CapstoneWebPage.auth.staff.add_shipper" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add a new shipping company:</h2>
            <asp:Label ID="Label1" runat="server" Text="Company Name:"></asp:Label>  <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <br />
            <h3>Currently Supported Companies:</h3>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [ShippingCompanies]"></asp:SqlDataSource>
            <asp:GridView ID="gvCompanies" runat="server" AutoGenerateColumns="False" DataKeyNames="CompanyId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="CompanyId" HeaderText="CompanyId" ReadOnly="True" SortExpression="CompanyId" />
                    <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
                </Columns>
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>
