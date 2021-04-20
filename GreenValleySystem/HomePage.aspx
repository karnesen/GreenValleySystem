<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab2.HomePage" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-10">
        <asp:Label ID="lblHome" runat="server" Text="Welcome!" class="text-center h4"></asp:Label>
            <div class="card p-3">
               <asp:GridView
            ID="gvCustomerTickets"
            runat="server"
            DataKeyNames="customerID"
            DataSourceID="srcServices"
            AutoGenerateColumns="false"
            OnRowDataBound="gvCustomer_RowDataBound"
            OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged"
            class="table table-bordered table-condensed table-hover">
            <Columns>
                <asp:TemplateField HeaderText="Customer">
                    <ItemTemplate>
                        <asp:Label ID="lblCustomer" runat="server" Text='<%# Eval("firstName") + " "  + Eval("lastName")%>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Service Type">
                    <ItemTemplate>
                        <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" :  Eval("serviceType").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Progress">
                    <ItemTemplate>
                        <asp:Label ID="lblProgress" runat="server" Text='<%#(Eval("serviceEvent").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource
            ID="srcServices"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Connect %>"
            SelectCommand="Select customer.customerID, customer.FirstName, customer.LastName, serviceStatus, service.serviceType, serviceOpenDate, service.serviceID, serviceEvent
                from Customer inner join Service on customer.customerID = service.customerID
            inner join ServiceHistory on service.serviceID = servicehistory.serviceID
            inner join serviceEvents on serviceHistory.eventID=serviceEvents.eventID 
            where serviceStatus=1 AND
            serviceHistory.stepID IN
            (select max(stepID) from serviceHistory inner join service on serviceHistory.serviceID=service.serviceID group by service.serviceID)  
			order by serviceStatus desc, serviceOpenDate asc">
        </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
