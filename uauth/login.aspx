<%@ Page Title="" Language="C#" MasterPageFile="~/uauth/uauth-master.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CapstoneWebPage.login" %>

<%@ Import Namespace="System.ComponentModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            border: 3px solid #f1f1f1;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .Loginbutton {
            background-color: #9B59B6;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            .Loginbutton:hover {
                opacity: 0.8;
            }


        .createAccountButton {
            width: auto;
            padding: 10px 18px;
            background-color: #909497;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .requiredAstrisk {
            color: red;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }

        .loginTable {
            width: 100%;
        }
    </style>



    <div class="imgcontainer">

        <img src="/images/MGA Logo.png" alt="Avatar" class="avatar" style="width: 250px; height: 210px;">
    </div>
    <div class="container">
        <asp:Login ID="Login1" runat="server" OnLoginError="Login1_LoginError" DestinationPageUrl="~/auth/account/info.aspx" OnLoggedIn="Login1_LoggedIn" CssClass="loginTable">
            <LayoutTemplate>
                <asp:Panel runat="server" DefaultButton="LoginButton">
                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;" class="loginTable">
                        <tr>
                            <td>
                                <table class="login loginTable" cellpadding="0">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username</asp:Label><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1" CssClass="requiredAstrisk">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label><asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" CssClass="requiredAstrisk">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="2" style="color: Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                            </td>
                            <td align="right" colspan="1">
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" CssClass="Loginbutton" />
                            </td>
                        </tr>

                    </table>
                    </td>
                </tr>
            </table>
                </asp:Panel>
            </LayoutTemplate>
        </asp:Login>
    </div>

    <div class="container" style="background-color: #f1f1f1">
        <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" CssClass="createAccountButton" />
        <span class="psw">Forgot <a href="~/uauth/forgot-password.aspx">password?</a></span>
    </div>
</asp:Content>
