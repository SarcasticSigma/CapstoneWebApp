<%@ Page Title="" Language="C#" MasterPageFile="~/uauth/uauth-master.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="CapstoneWebPage.uauth.forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <style>
        .flexContainer {
            margin: 10% auto auto auto;
            width: 50%;
        }

        .logbutt1{
            display:block;
            float:left;

        }
        .logbutt2{
            display:block;
            float:right;
        }

        .Loginbutton {
            background-color: #9B59B6;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 33%;
            border-radius: 10px;
            font-size: 16px;
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
    </style>
    <link rel="stylesheet" href="../CSS/CapstoneStyle.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1" >

    <div class="flexContainer">
        <h2 style="text-align: center;">Forgot Password</h2>



        <table width="100%">
            <tc>
                <tr>
                    <td colspan="3" align="center" style="padding-bottom: 1em;">
                        <asp:Label ID="Label2" runat="server" Text="Please enter your username and a reset link will be sent your email associated with your account."></asp:Label></td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
                    </td>
                </tr>
                <tr>

                    <td align="center">
                        <asp:TextBox ID="TextBox1" runat="server"> </asp:TextBox>

                    </td>

                </tr>
                <tr>
                    <td >
                        <asp:Button ID="Button2" runat="server" Text="Back" CssClass="Loginbutton logbutt1" OnClick="Button2_Click" />
                        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="Loginbutton logbutt2" />
                    </td>
             
                </tr>
                <tr>
                    <td align="center">
                        <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </tc>
        </table>
        
    </div>
        </asp:Panel>

</asp:Content>
