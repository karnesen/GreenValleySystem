<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab2.HomePage" EnableEventValidation="false" %>

<%--Kirsi And Josh Coleman 2/15/21--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-10">
        <asp:Label ID="lblHome" runat="server" Text="Welcome!" class="text-center h4"></asp:Label>
            <div class="card p-3">
                Work in Progress!

            
        </div>
        <asp:LinkButton ID="lBtnCustomerFacing" runat="server" PostBackUrl="~/createNewUser.aspx">View Customer Facing Demo</asp:LinkButton>
    </div>
</asp:Content>
