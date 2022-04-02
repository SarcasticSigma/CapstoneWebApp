<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="CapstoneWebPage.uauth.forgot_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <div class="form-container">
        
            <h2>Forgot Password</h2>
            <div class="form-box">
                <input type="text" placeholder="Enter Email" />
            </div>
            <div class="form-submit">
                <input type="submit" value="send" /><asp:PasswordRecovery ID="PasswordRecovery1" runat="server"></asp:PasswordRecovery>
            </div>
        
    </div>  

</asp:Content>
