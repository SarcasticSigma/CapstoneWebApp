<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="new-package.aspx.cs" Inherits="CapstoneWebPage.auth.student.new_package" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tc>



            <tr>

                <td><asp:Label ID="Label1" runat="server" Text="Tracking Number:"></asp:Label></td>
                <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            
            <tr>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT [CompanyName] FROM [ShippingCompanies]"></asp:SqlDataSource>
                <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>

                
                
            </tr>
            
            <tr>

                <td><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            
            <tr>

                <td><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>
        </tc>
    
    
        </table>
</asp:Content>
