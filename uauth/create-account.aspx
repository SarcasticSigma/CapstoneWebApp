<%@ Page Title="" Language="C#" MasterPageFile="~/uauth/uauth-master.Master" AutoEventWireup="true" CodeBehind="create-account.aspx.cs" Inherits="CapstoneWebPage.uauth.create_account1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .requiredAstrisk {
            color: red;
        }

        .centerItems {
            display: flex;
            align-content: center;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        .bigTable {
            width: 100%;
            background-color: #f1f1f1;
            height: 60vh;
            padding-top: 50px;
        }

            .bigTable br {
                background-color: #a1a8ab;
            }

        body {
            margin: 0px;
        }

        table {
            align-content: center;
            justify-content: center;
               font-family: Arial, Helvetica, sans-serif;
        }

        .colorButton {
            background-color: #9B59B6;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius:10px;
            font-size:16px;
            width:50vh;
        }

            .Loginbutton:hover {
                opacity: 0.8;
            }

     
        input[type=text], input[type=password] {
            width: 90%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .auto-style1 {
            margin-bottom: 19px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
                                    <h1 style="font-size: 45px; text-align:center; height:100%; padding:10px; margin:0; padding-top:10px; background-color: #633394;" class="auto-style1">Create Account</h1>
     <div class="centerItems">
        <asp:CreateUserWizard CssClass="bigTable" ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser" RequireEmail="False" CancelButtonDestinationPageUrl="~/uauth/home.aspx" ContinueDestinationPageUrl="~/auth/user-home.aspx">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
                        <table class="bigTable">
                            <tr>
                                <td align="center">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." CssClass="requiredAstrisk" ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." CssClass="requiredAstrisk" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password</asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" CssClass="requiredAstrisk" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="1">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color: Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width: 100%; height: 100%; justify-content: center; display: flex;">
                            <tr>
                                <td align="right" style="width: 50%;" colspan="1" >
                                    <asp:Button ID="Button1" runat="server" Text="Back" OnClick="Button1_Click" class="colorButton" /></td>
                                <td align="left" colspan="1" style="width: 50%;">
                                    <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User" ValidationGroup="CreateUserWizard1"  class="colorButton"/>
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
