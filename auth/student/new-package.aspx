<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="new-package.aspx.cs" Inherits="CapstoneWebPage.auth.student.new_package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        .requiredAstrisk {
            color: red;
        }

        .Loginbutton {
            background-color: #9B59B6;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
            border-radius: 10px;
            font-size: 16px;
            text-align:center;
        }

            .Loginbutton:hover {
                opacity: 0.8;
            }

        input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }


        .calendar {
            position: absolute;
            visibility: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT [CompanyName], [CompanyId] FROM [ShippingCompanies]"></asp:SqlDataSource>
    <header>
        <center>
            <h1 style="font-size: 45px;">Add New Package</h1>
        </center>
    </header>
    <div class="container">
        <table style="width:90%;">
            <tc>



                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text="Tracking Number"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtTrackingNumber" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label runat="server" ID="LabelShipping" Text="Shipping Company" AssociatedControlID="ddlShippingCompany"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">

                        <asp:DropDownList ID="ddlShippingCompany" runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName" CSSClass="submitButton Loginbutton" DataValueField="CompanyId">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td  align="center">
                        <asp:Label ID="Label3" runat="server" Text="Expected Date"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtExpectedDate" runat="server"></asp:TextBox></td>
                </tr>

                <tr>

                    <td align="center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="submitButton Loginbutton" OnClick="btnSubmit_Click" /></td>
                </tr>
            </tc>



        </table>
        <asp:Label ID="lblOutput" runat="server" Text="You'll recieve an email containing the password required to retrieve your package when it arrives. "></asp:Label>

    </div>



</asp:Content>
