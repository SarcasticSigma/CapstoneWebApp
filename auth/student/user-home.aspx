<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="user-home.aspx.cs" Inherits="CapstoneWebPage.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="homepage">
    <h2>Home</h2>
    <asp:Label runat="server" AssociatedControlID="txtSearch" Text="Search: "></asp:Label>
    <asp:TextBox runat="server" ID="txtSearch"></asp:TextBox>
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" />

    <asp:SqlDataSource ID="sdsPackages" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Packages] 
INNER JOIN ShippingCompanies ON  Packages.ShippingCompanyId = ShippingCompanies.CompanyId 
INNER JOIN aspnet_Users ON Packages.StudentId = aspnet_Users.UserId WHERE Username = @Username
">
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="UserName" />
        </SelectParameters>
        </asp:SqlDataSource>

    <asp:GridView ID="gvPackages" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId,CompanyId,ApplicationId,LoweredUserName" DataSourceID="sdsPackages" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
        <Columns>
            
            <asp:BoundField DataField="PackageId" HeaderText="PackageId" InsertVisible="False" ReadOnly="True" SortExpression="PackageId" />
            <asp:BoundField DataField="StudentId" HeaderText="StudentId" SortExpression="StudentId" />
            <asp:BoundField DataField="TrackingNumber" HeaderText="TrackingNumber" SortExpression="TrackingNumber" />
            <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" SortExpression="ArrivalDate" />
            <asp:BoundField DataField="DisposalDate" HeaderText="DisposalDate" SortExpression="DisposalDate" />
            <asp:BoundField DataField="LockerNumber" HeaderText="LockerNumber" SortExpression="LockerNumber" />
            <asp:BoundField DataField="AccruedFees" HeaderText="AccruedFees" SortExpression="AccruedFees"/>
            <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
        </Columns>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Package] WHERE ([PackageId] = @PackageId)">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvPackages" Name="PackageId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="PackageId" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="PackageId" HeaderText="PackageId" InsertVisible="False" ReadOnly="True" SortExpression="PackageId" />
            <asp:BoundField DataField="OwnerId" HeaderText="OwnerId" SortExpression="OwnerId" />
            <asp:BoundField DataField="TrackingNumber" HeaderText="TrackingNumber" SortExpression="TrackingNumber" />
            <asp:BoundField DataField="ExpectedArrivalDate" HeaderText="ExpectedArrivalDate" SortExpression="ExpectedArrivalDate" />
            <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" SortExpression="ArrivalDate" />
            <asp:BoundField DataField="RetrievalDate" HeaderText="RetrievalDate" SortExpression="RetrievalDate" />
            <asp:BoundField DataField="StorageLockerNumber" HeaderText="StorageLockerNumber" SortExpression="StorageLockerNumber" />
            <asp:BoundField DataField="AccruedFees" HeaderText="AccruedFees" SortExpression="AccruedFees" />
        </Fields>
    </asp:DetailsView>
    </div>

</asp:Content>
