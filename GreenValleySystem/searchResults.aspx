<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="searchResults.aspx.cs" Inherits="Lab3.searchResults" EnableEventValidation="false" %>
<%--Kirsi And Josh Coleman--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-4">
        <div class="card">
            <div class="card-body">
                <asp:GridView
                    ID="gvCustomer"
                    runat="server"
                    DataKeyNames="customerID"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvCustomer_RowDataBound"
                    OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged"
                    class="table table-bordered tablee-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="customerName" HeaderText="Customers" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
     <div class="container col-4">
        <div class="card">
            <div class="card-body"> 
                <asp:GridView
                    ID="gvAddress"
                    runat="server"
                    DataKeyNames="customerID"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvAddress_RowDataBound"
                    OnSelectedIndexChanged="gvAddress_SelectedIndexChanged"
                    class="table table-bordered tablee-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="customerAddress" HeaderText="Addresses" />
                        <asp:BoundField DataField="customerName" HeaderText="Customers" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
         <div class="container col-4">
        <div class="card">
            <div class="card-body">
                <asp:GridView
                    ID="gvServiceAddress"
                    runat="server"
                    DataKeyNames="addressID"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvServiceAddress_RowDataBound"
                    OnSelectedIndexChanged="gvServiceAddress_SelectedIndexChanged"
                    class="table table-bordered tablee-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="serviceAddress" HeaderText="Service Addresses" />
                        <asp:BoundField DataField="addresstype" HeaderText="Address Type" />
                        <asp:BoundField DataField="serviceType" HeaderText="Service Type" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content> 

