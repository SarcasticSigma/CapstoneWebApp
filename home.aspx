<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CapstoneWebPage.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Home</h2>
    <asp:Label runat="server" AssociatedControlID="txtSearch" Text="Search: "></asp:Label>
    <asp:TextBox runat="server" ID="txtSearch"></asp:TextBox>
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" />

    <asp:SqlDataSource ID="sdsPackages" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
    
    <!--
        https://stackoverflow.com/questions/14472016/how-to-make-gridview-in-asp-net-scrollable
        Make GV scrollable
        -->
    <asp:GridView ID="gvPackages" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId" DataSourceID="sdsPackages">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="PackageId" HeaderText="PackageId" InsertVisible="False" ReadOnly="True" SortExpression="PackageId" />
            <asp:BoundField DataField="OwnerId" HeaderText="OwnerId" SortExpression="OwnerId" />
            <asp:BoundField DataField="TrackingNumber" HeaderText="TrackingNumber" SortExpression="TrackingNumber" />
            <asp:BoundField DataField="ExpectedArrivalDate" HeaderText="ExpectedArrivalDate" SortExpression="ExpectedArrivalDate" />
            <asp:BoundField DataField="ArrivalDate" HeaderText="ArrivalDate" SortExpression="ArrivalDate" />
            <asp:BoundField DataField="RetrievalDate" HeaderText="RetrievalDate" SortExpression="RetrievalDate" />
            <asp:BoundField DataField="StorageLockerNumber" HeaderText="StorageLockerNumber" SortExpression="StorageLockerNumber" />
            <asp:BoundField DataField="AccruedFees" HeaderText="AccruedFees" SortExpression="AccruedFees" />
        </Columns>
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
    

</asp:Content>
