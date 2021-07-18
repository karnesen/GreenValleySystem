<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="searchResults.aspx.cs" Inherits="Lab3.searchResults" EnableEventValidation="false" %>

<%--Kirsi And Josh Coleman--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-4">
        <div class="card">
            <div class="card-body">
                <asp:GridView
                    ID="gvCustomers"
                    runat="server"
                    DataKeyNames="customerID"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvCustomer_RowDataBound"
                    OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged"
                    class="table table-bordered tablee-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="customerName" HeaderText="Customer" />
                        <asp:BoundField DataField="customerAddress" HeaderText="Current Address" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:GridView
                    ID="gvServiceAddress"
                    runat="server"
                    DataKeyNames="customerID"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvServiceAddress_RowDataBound"
                    OnSelectedIndexChanged="gvServiceAddress_SelectedIndexChanged"
                    class="table table-bordered tablee-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="customerName" HeaderText="Customer" />
                        <asp:BoundField DataField="serviceAddress" HeaderText="Service Address" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="addressType" runat="server" Text='<%# (Eval("addressType").ToString() == "P") ? "Pick Up Location" : "Drop Off" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : "Auction"%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />

                <asp:GridView
                    ID="gvStorage"
                    runat="server"
                    DataKeyNames="customerID"
                    AutoGenerateColumns="false"
                    OnRowDataBound="gvStorage_RowDataBound"
                    OnSelectedIndexChanged="gvStorage_SelectedIndexChanged"
                    class="table table-bordered tablee-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="customerName" HeaderText="Customer" />
                        <asp:BoundField DataField="storageLocation" HeaderText="Storage Locations" />
                    </Columns>
                </asp:GridView>

                <h6 style="text-align:center">That's All We Found!</h6>

            </div>

        </div>
</asp:Content>

