<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="customerProfile.aspx.cs" Inherits="GreenValleySystem.customerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView 
        ID="dvCustomerInfo" 
        runat="server" 
        Height="50px" 
        Width="125px"
        AutoGenerateEditButton="true"
        >
        <Fields>

        </Fields>
    </asp:DetailsView>
    
    <asp:SqlDataSource 
        ID="srcCustomer" 
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Connect %>"
        SelectCommand="Select * from Customer where customerID = <%# Session["selectedCustomer"].ToString() %>"
     ></asp:SqlDataSource>
</asp:Content>
