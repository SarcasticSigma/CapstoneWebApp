<%@ Page Title="Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="user-home.aspx.cs" Inherits="CapstoneWebPage.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .homepage {
            background-color: #f1f1f1;
        }

        table {
            width: 80%;
            margin: auto;
            margin-top: 5%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="colorize" style="background-color: #f1f1f1">
        <h1 style="font-size: 45px; text-align: center; height: 100%; padding: 10px; margin: 0; margin-bottom: 15px; margin-top: 15px;" class="auto-style1">Your packages</h1>


            <asp:SqlDataSource ID="sdsPackages" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Packages] 
INNER JOIN ShippingCompanies ON  Packages.ShippingCompanyId = ShippingCompanies.CompanyId 
INNER JOIN aspnet_Users ON Packages.OwnerId = aspnet_Users.UserId WHERE Username = @Username ORDER BY HasArrived DESC
">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="UserName" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:GridView ID="gvPackages" ShowHeaderWhenEmpty="True" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId,CompanyId,ApplicationId,LoweredUserName" DataSourceID="sdsPackages" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
                <Columns>

                    <asp:BoundField DataField="PackageId" HeaderText="PackageId" InsertVisible="False" ReadOnly="True" SortExpression="PackageId" />
                    <asp:BoundField DataField="TrackingNumber" HeaderText="Tracking Number" SortExpression="TrackingNumber" />
                    <asp:BoundField DataField="ExpectedArrivalDate" HeaderText="Expected Arrival Date" SortExpression="ExpectedArrivalDate" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="LockerNumber" HeaderText="Locker Number" SortExpression="LockerNumber" />
                    <asp:BoundField DataField="HasArrived" HeaderText="Has Arrived?" SortExpression="PackageId" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
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

   
</div>
</asp:Content>
