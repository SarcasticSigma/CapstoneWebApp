<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="new-package.aspx.cs" Inherits="CapstoneWebPage.auth.student.new_package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .requiredAstrisk {
            color: red;

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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
    <div class="container">
        <table>
            <tc>



                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Tracking Number:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtTrackingNumber" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="requiredAstrisk" runat="server" ErrorMessage="*" ControlToValidate="txtTrackingNumber"></asp:RequiredFieldValidator></td>


                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelShipping" Text="Shipping Company" AssociatedControlID="ddlShippingCompany"></asp:Label>
                    </td>
                    <td colspan="1">

                        <asp:DropDownList Style="width: 100%; text-align: center;" ID="ddlShippingCompany" AppendDataBoundItems="true"
                            runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="CompanyId">
                            <asp:ListItem Selected="True" Value="none">(Select One)</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="requiredAstrisk" runat="server" ControlToValidate="ddlShippingCompany" InitialValue="none" ErrorMessage="*"></asp:RequiredFieldValidator></td>


                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Expected Arrival Date"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtExpectedDate" placeholder="mm/dd/yyyy" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="requiredAstrisk" ControlToValidate="txtExpectedDate" ErrorMessage="*" ValidateEmptyText="true" Display="Dynamic" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>

                    <td colspan="2">
                        <asp:Button Style="width: 100%; display: block; justify-content: left;" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblOutput" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            </tc>



        </table>
    </div>



</asp:Content>
