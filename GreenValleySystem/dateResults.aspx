<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="dateResults.aspx.cs" Inherits="GreenValleySystem.dateResults" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid px-1 px-sm-4 py-5 mx-auto">

        <div class="row d-flex justify-content-center">

            <div class="col-md-10 col-lg-9 col-xl-8">

                <div class="card border-0">

                    <div class="card-header bg-white">

                        <h4 class="mb-1">Choose a Date</h4>

                    </div>

                    <div class="card-body px-3 px-md-5">

                        <div class="card mb-3">

                            <div class="card-header">

                                <h6><span class="fa fa-calendar mr-3"></span>Date</h6>

                            </div>

                            <div class="card-body">

                                <div class="row px-4 mt-3">

                                    <div class="col-md-6 pl-0 pr-0 pr-md-2 mb-2">

                                        <asp:TextBox ID="txtStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator 
                                            ID="rfvDate" 
                                            ControlToValidate="txtStartDate" 
                                            runat="server"
                                            Text="Please Enter a Date"
                                            ErrorMessage="RequiredFieldValidator"
                                            ValidationGroup="Date">
                                        </asp:RequiredFieldValidator>

                                        <asp:GridView
                                            ID="gvDates"
                                            runat="server"
                                            DataKeyNames="customerID"
                                            AutoGenerateColumns="false"
                                            OnRowDataBound="gvServiceAddress_RowDataBound"
                                            OnSelectedIndexChanged="gvServiceAddress_SelectedIndexChanged"
                                            class="table table-bordered tablee-condensed table-hover">
                                            <Columns>
                                                <asp:BoundField DataField="customerName" HeaderText="Customer" />

                                                <asp:TemplateField HeaderText="Service">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : "Auction"%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="description" HeaderText="Event Type" />

                                                <asp:TemplateField HeaderText="Date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("confirmedDate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>
                    <asp:LinkButton ID="btnSearch" runat="server" Text="Search" class="btn btn-primary ml-auto" ValidationGroup="Date"><i class="fa fa-filter"></i></asp:LinkButton>

                </div>

            </div>

        </div>

    </div>


</asp:Content>
