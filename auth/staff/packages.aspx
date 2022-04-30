<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="packages.aspx.cs" Inherits="CapstoneWebPage.auth.staff.packages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Packages] WHERE ([HasArrived] NOT LIKE '%' + @HasArrived + '%')">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Yes" Name="HasArrived" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="PackageId" HeaderText="PackageId" InsertVisible="False" ReadOnly="True" SortExpression="PackageId" />
                    <asp:BoundField DataField="OwnerId" HeaderText="OwnerId" SortExpression="OwnerId" />
                    <asp:BoundField DataField="TrackingNumber" HeaderText="TrackingNumber" SortExpression="TrackingNumber" />
                    <asp:BoundField DataField="ShippingCompanyId" HeaderText="ShippingCompanyId" SortExpression="ShippingCompanyId" />
                    <asp:BoundField DataField="ExpectedArrivalDate" HeaderText="ExpectedArrivalDate" SortExpression="ExpectedArrivalDate" />
                    <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" SortExpression="ArrivalDate" />
                    <asp:BoundField DataField="LockerNumber" HeaderText="LockerNumber" SortExpression="LockerNumber" />
                    <asp:BoundField DataField="HasArrived" HeaderText="HasArrived" SortExpression="HasArrived" />
                    <asp:ButtonField AccessibleHeaderText="Confirm Package Arrival" ButtonType="Button" CausesValidation="True" ValidationGroup="PackageArrival" Text="Arrived" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="Label1" runat="server" Text="Locker Number"></asp:Label>
            <asp:TextBox ID="txtLockerNumber"  ValidationGroup="PackageArrival"  runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ValidationGroup="PackageArrival" ControlToValidate="txtLockerNumber" ValidationExpression="^[0-9]+$" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter only numbers!"></asp:RegularExpressionValidator>
            <asp:CustomValidator ControlToValidate="txtLockerNumber" ValidateEmptyText="false" ValidationGroup="PackageArrival" ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate" ErrorMessage="CustomValidator"></asp:CustomValidator>
        </div>
    </form>
</body>
</html>
