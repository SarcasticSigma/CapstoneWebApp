<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="info.aspx.cs" Inherits="CapstoneWebPage.account_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .paddingBetweenCols td {
            padding: 10px 15px;
            
        }

            .paddingBetweenCols td:nth-child(even) {
                border-bottom: outset dotted black 1px;
            }

            .paddingBetweenCols td:nth-child(1) {
                text-align: right;
                border-right: outset black 1px;
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header>
        <center>
            <h1 style="font-size: 45px;">Account Information</h1>
        </center>
    </header>
    <div class="container">
        <table class="paddingBetweenCols">
            <tc>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtUsername" runat="server" ReadOnly="true" CssClass="infoField"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtEmail" ReadOnly="true" runat="server"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="MGA ID"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtMGAId" ReadOnly="true" runat="server"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtName" ReadOnly="true" runat="server"></asp:Label>
                    </td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Phone Number"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtPhoneNumber" ReadOnly="true" runat="server"></asp:Label>
                    </td>



                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Student Type"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="txtStudentType" Text="Residential" runat="server"></asp:Label>

                    </td>

                </tr>


            </tc>

        </table>

    </div>

</asp:Content>
