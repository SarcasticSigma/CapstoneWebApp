<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="create-account-old.aspx.cs" Inherits="CapstoneWebPage.create_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialogContainer" style="width: 50%; height: 50%; margin: auto;">
        <dialog runat="server" id="diaAccountCreationResult">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

        </dialog>

    </div>
    <div id="register">
        <h2>Create an Account</h2>
        <h3>Please fill all text fields to complete registration</h3>
        <table>
            <tr>

                <!--Username-->
                <td>
                    <asp:Label runat="server" AssociatedControlID="txtUsername" Text="Username: "></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtUsername" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <!--Password-->
            <tr>
                <td>
                    <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Password: "></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </td>

                
            </tr>
            <!--Password Confirm-->
            <tr>
                <td>
                    <asp:Label runat="server" AssociatedControlID="txtPasswordConfirm" Text="Confirm Password: "></asp:Label></td>
                <td>

                    <asp:TextBox runat="server" ID="txtPasswordConfirm" TextMode="Password" CssClass="textbox"></asp:TextBox>
                
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords are not equal!" ControlToValidate="txtPassword" ControlToCompare="txtPasswordConfirm" Type="String"></asp:CompareValidator></td>
            </tr>
            <!--MGA ID-->
            <tr>
                <td>
                    <asp:Label runat="server" AssociatedControlID="txtMGAId" Text="MGA ID (983#): "></asp:Label></td>
                <td>
                    <asp:TextBox runat="server" ID="txtMGAId" CssClass="textbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="MGA ID is required" ControlToValidate="txtMGAId"></asp:RequiredFieldValidator></td>

            </tr>

            <!--TOS-->
            <tr>
                <td>
                    <asp:CheckBox runat="server" ID="TOScheck" OnCheckedChanged="TOScheck_CheckedChanged" AutoPostBack="true" Checked="false"/>
                    <asp:Label runat="server" AssociatedControlID="TOScheck" Text="I accept and understand the terms of service"></asp:Label>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please agree to the TOS!" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>

            </tr>
            <!--Buttons-->
            <tr>
                <td>
                    <a href="javascript:history.go(-1)" />
                    <button>Back</button><!--The empty button is just to make the anchor look like a button-->
                </td>
                <td>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>


    </div>



</asp:Content>
