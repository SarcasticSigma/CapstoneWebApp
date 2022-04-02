<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="create-account-old.aspx.cs" Inherits="CapstoneWebPage.create_account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="dialogContainer" style="width:50%;height:50%;margin: auto;">
    <dialog runat="server" id="diaAccountCreationResult">
        <p id="pDialogOutput" runat="server"></p>
        
    </dialog>

        </div>
    <div id="register">
        <h2>Create an Account</h2>
        <h3>Please fill all text fields to complete registration</h3>
        <!--Username-->
        <asp:Label runat="server" AssociatedControlID="txtUsername" Text="Username: "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtUsername" CssClass="textbox"></asp:TextBox><br /><br />
        <!--Email add @mga.edu validation-->
        <asp:Label runat="server" AssociatedControlID="txtEmail" Text="MGA Email: "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtEmail" AutoCompleteType="Email" CssClass="textbox"></asp:TextBox><br /><br />
        <!--First Name-->
        <asp:Label runat="server" AssociatedControlID="txtFirstName" Text="First Name: "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtFirstName" AutoCompleteType="FirstName" CssClass="textbox"></asp:TextBox><br /><br />
        <!--Last Name-->
        <asp:Label runat="server" AssociatedControlID="txtLastName" Text="Last Name: "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtLastName" AutoCompleteType="LastName" CssClass="textbox"></asp:TextBox><br /><br />
        <!--Password-->
        <asp:Label runat="server" AssociatedControlID="txtPassword" Text="Password: "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="textbox"></asp:TextBox><br /><br />
        <!--Confirm Password-->
        <asp:Label runat="server" AssociatedControlID="txtPasswordConfirm" Text="Confirm Password: "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtPasswordConfirm" TextMode="Password" CssClass="textbox"></asp:TextBox><br /><br />
        <!--MGA ID-->
        <asp:Label runat="server" AssociatedControlID="txtMGAId" Text="MGA ID (983#): "></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtMGAId" CssClass="textbox"></asp:TextBox><br /><br />
        <!--Phone Number-->
        <asp:Label runat="server" AssociatedControlID="txtPhoneNumber" Text="Phone Number:"></asp:Label><br /><br />
        <asp:TextBox runat="server" ID="txtPhoneNumber" CssClass="textbox"></asp:TextBox><br /><br />
        <!--TOS checkbox-->
        <asp:CheckBox runat="server" ID="TOScheck" /><br />
        <asp:Label runat="server" AssociatedControlID="TOScheck" Text="I accept and understand the terms of service"></asp:Label><br />
        <!--Buttons-->
        <asp:Button runat="server" id="btnCancel" Text="Cancel" />
        <asp:Button runat="server" id="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
        <asp:SqlDataSource ID="sdsDatabase" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
    </div>
    


</asp:Content>
