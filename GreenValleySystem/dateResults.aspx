<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="dateResults.aspx.cs" Inherits="GreenValleySystem.dateResults" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid px-1 px-sm-4 py-5 mx-auto">

        <div class="row d-flex justify-content-center">

            <div class="col-md-11 col-lg-11 col-xl-11">


                    

                    <div class="card-body px-3 px-md-5">

                        <div class="card mb-3">

                            <div class="card-header">

                                <h6><span class="fa fa-calendar mr-3"></span>Calendar</h6>

                            </div>

                            <div class="card-body ">

                                <div class="row px-4">

                                     <iframe width="1200" height="720" frameborder="0" scrolling="no" src="https://urldefense.proofpoint.com/v2/url?u=https-3A__west.exch091.serverdata.net_owa_calendar_7dc5b07bc1204552a753df4e678d8717-40greenvalleyauctions.com_2ce734f932434028bb9b657d65110a957453967498004208049_calendar.html&d=DwMFAg&c=RWKzQL7PIkYKzsYSjZn54yrN72ooGPhHwUXdJ0S2Irw&r=UkVwp2H7_RKh_bMdy3Sdk0uCV6kXg4dR9mhZ7gU1ozU&m=ZgzXc5dNCTL8cxE7Wkqu2TlJbvifQpFZ8kiQKNrtoYQ&s=PHgDHS00gp0w8PPcZCqbU-4C9d3V8WW1fCdI8U4_YIg&e="></iframe>


<%--                                    <div class="col-md-6 pl-0 pr-0 pr-md-2 mb-2">--%>
                               <%--         <div class="col-5">
                                            <asp:TextBox ID="txtStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="Date"></asp:TextBox>
                                        </div>
                                        <div class="col-3 mt-3">
                                            <asp:LinkButton ID="btnSearch" runat="server" Text="Search" class="btn btn-primary ml-auto" ValidationGroup="Date">Search <i class="fa fa-search" style="padding-left: 0.5rem;"></i></asp:LinkButton>
                                        </div>

                                        <asp:RequiredFieldValidator 
                                            ID="rfvDate" 
                                            ControlToValidate="txtStartDate" 
                                            runat="server"
                                            Text="Please Enter a Date"
                                            ErrorMessage="RequiredFieldValidator"
                                            ValidationGroup="Date">
                                        </asp:RequiredFieldValidator>--%>

<%--                                    </div>--%>

                                </div>


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
                                                        <asp:Label ID="lblDate" runat="server" Text='<%#Eval("confirmedDate", "{0:d}")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                        </asp:GridView>
                                   
                            </div>

                        </div>

                    </div>


            </div>

        </div>

    </div>


</asp:Content>
