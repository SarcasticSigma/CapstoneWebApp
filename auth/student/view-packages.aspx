<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="view-packages.aspx.cs" Inherits="CapstoneWebPage.view_packages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Packages</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <header>
            <center>
                <h1 style="font-size: 60px;">Packages</h1>
            </center>
        </header>


        <table class="viewPackages" style="width: 100%">
            <tr>
                <th>On the way</th>
                <th>Recieved</th>
                <th>Past Transactions</th>
            </tr>
            <tr>
                <td>Amazon: 1</td>
                <td>Amazon: 1</td>
                <td>Amazon: 1</td>
        </table>
    </div>
</asp:Content>
