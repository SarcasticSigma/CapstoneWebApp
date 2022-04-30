<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="add-id.aspx.cs" Inherits="CapstoneWebPage.auth.account.add_id" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .centering {
            margin: auto;
        }

        .errorMessage {
            color: red;
        }

        input[type=text], input[type=password] {
            width: 80%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .myButton {
            background-color: #9B59B6;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 10px;
            font-size: 16px;
            width: 50vh;
        }

            .myButton:hover {
                opacity: 0.8;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="centering">

        <table class="centering">
            <tc>
                <tr>
                    <td>
                        <h3>Please enter your MGA ID number</h3>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label1" runat="server" Text="MGA ID"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:TextBox ID="txtMGAId" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ValidationGroup="submission" ControlToValidate="txtMGAId"
                            ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="*" CssClass="errorMessage"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:CustomValidator ValidationGroup="submission" ID="SWORDSIdValidator"
                            runat="server" ErrorMessage="This is not a valid MGA ID!"
                            ControlToValidate="txtMGAId" OnServerValidate="SWORDSIdValidator_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button CssClass="myButton" ValidationGroup="submission" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </tc>
        </table>
    </div>
</asp:Content>
