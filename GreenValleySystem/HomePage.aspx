<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab2.HomePage" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-10">
            <div class="card p-3" style="border: 1px solid #bb9739;">
               <asp:GridView
            ID="gvCustomerTickets"


            runat="server"
            DataKeyNames="customerID"
            DataSourceID="srcServices"
            AutoGenerateColumns="false"
            OnRowDataBound="gvCustomer_RowDataBound"
            OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged"
            class="table table-bordered table-condensed table-hover"
            AllowPaging="true"
            OnPageIndexChanging="gvCustomerTickets_PageIndexChanging"
            PageSize="10">
            <HeaderStyle BackColor="#266141" ForeColor="White"/>
            <Columns>
                
                <asp:BoundField DataField="customerName" HeaderText="Customer" />

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
            SelectCommand="Select customer.customerID, serviceHistory.dateAdded, customer.FirstName + ' ' +  customer.LastName as customerName, serviceStatus, service.serviceType, serviceOpenDate, service.serviceID, serviceEvent
                from Customer inner join Service on customer.customerID = service.customerID
            inner join ServiceHistory on service.serviceID = servicehistory.serviceID
            inner join serviceEvents on serviceHistory.eventID=serviceEvents.eventID 
            where serviceStatus=1 AND
            serviceHistory.stepID IN
            (select max(stepID) from serviceHistory inner join service on serviceHistory.serviceID=service.serviceID group by service.serviceID)  
			order by serviceHistory.dateAdded">
        </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
