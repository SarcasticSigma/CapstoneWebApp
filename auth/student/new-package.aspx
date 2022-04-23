<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="new-package.aspx.cs" Inherits="CapstoneWebPage.auth.student.new_package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MainSquireDatabase %>" SelectCommand="SELECT [CompanyName], [CompanyId] FROM [ShippingCompanies]"></asp:SqlDataSource>
    <table>
        <tc>



            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Tracking Number:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="LabelShipping" Text="Shipping Company" associatedControlId="DropDownList1"></asp:Label>
                </td>
                <td >
                
                 <asp:DropDownList style="width:100%; text-align: center;" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="CompanyId">
    </asp:DropDownList>
        </td>
                
                
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>
        </tc>


    </table>
   
</asp:Content>
