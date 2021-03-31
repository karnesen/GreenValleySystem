<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerPortal.Master" AutoEventWireup="true" CodeBehind="customerHome.aspx.cs" Inherits="GreenValleySystem.customerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <asp:GridView
        ID="gvCustomerServices"
        DataSourceID="srcCustomerServices"
        DataKeyNames="serviceID"
        AutoGenerateColumns="false"
        runat="server"
        class="table table-bordered table-condensed">
        <Columns>
            <asp:TemplateField HeaderText="Service Type">
                <ItemTemplate>
                    <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : "Auction"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Request Date">
                <ItemTemplate>
                    <asp:Label ID="lblServiceOpenDate" runat="server" Text='<%#Bind("serviceOpenDate")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%#(Eval("serviceStatus").ToString()) == "True" ? "Active" : "Inactive"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Deadline">
                <ItemTemplate>
                    <asp:Label ID="lbldeadLineStart" runat="server" Text='<%#Bind("serviceDeadlineStart")%>'></asp:Label>
                    - 
                                    <asp:Label ID="lbldeadlineEnd" runat="server" Text='<%#Bind("serviceDeadlineEnd")%>'></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource
        ID="srcCustomerServices"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Connect %>"
        SelectCommand="Select * from Service where customerID = @customerID">
        <SelectParameters>
            <asp:SessionParameter Name="customerID" SessionField="customerID" />
        </SelectParameters>
    </asp:SqlDataSource>
        <asp:LinkButton ID="lBTNreturnEmployee" runat="server">View Employee Demo</asp:LinkButton>
        </div>
</asp:Content>
