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
            text-align: center;
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
        <table style="width: 90%;">
            <tc>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text="Tracking Number"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ValidationGroup="Submission" ID="txtTrackingNumber" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:CustomValidator ValidationGroup="Submission" ID="TrackingNumberValidator" CssClass="requiredAstrisk" runat="server" ErrorMessage="*" ControlToValidate="txtTrackingNumber" OnServerValidate="TrackingNumberValidator_ServerValidate"></asp:CustomValidator>
                        
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label runat="server" ID="LabelShipping" Text="Shipping Company" AssociatedControlID="ddlShippingCompany"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:DropDownList ValidationGroup="Submission" ID="ddlShippingCompany" runat="server" DataSourceID="SqlDataSource1"
                            DataTextField="CompanyName" CssClass="submitButton Loginbutton" AppendDataBoundItems="true" DataValueField="CompanyId">

                            <asp:ListItem Selected="True" Text="(Select one)" Value="none"></asp:ListItem>

                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ValidationGroup="Submission" ID="RequiredFieldValidator2" CssClass="requiredAstrisk" runat="server"
                            ControlToValidate="ddlShippingCompany" InitialValue="none" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td align="center">
                        <asp:Label ID="Label3" runat="server" Text="Expected Date"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ValidationGroup="Submission" ID="txtExpectedDate" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CustomValidator ValidationGroup="Submission" ID="CustomValidator1" runat="server" CssClass="requiredAstrisk" ControlToValidate="txtExpectedDate" ErrorMessage="*" ValidateEmptyText="true" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>

                    </td>
                </tr>

                <tr>

                    <td align="center">
                        <asp:Button CausesValidation="true" ValidationGroup="Submission" ID="btnSubmit" runat="server" Text="Submit" CssClass="submitButton Loginbutton" OnClick="btnSubmit_Click" /></td>
                </tr>
            </tc>



        </table>
        <asp:Label ID="LabelOutput" runat="server" Text=""></asp:Label>

    </div>



</asp:Content>
