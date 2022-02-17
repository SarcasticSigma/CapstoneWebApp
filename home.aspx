<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="CapstoneWebPage.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <h1 style="font-size: 60px;">Home</h1>
    </center>
    <asp:SqlDataSource ID="sdsPackages" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
    <asp:GridView ID="gvPackages" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId" DataSourceID="sdsPackages">
        <Columns>
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
   
</asp:Content>
