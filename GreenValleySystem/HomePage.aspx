<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab2.HomePage" EnableEventValidation="false" %>

<%--Kirsi And Josh Coleman 2/15/21--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-10">
        <asp:Label ID="lblHome" runat="server" Text="Welcome!" class="text-center h4"></asp:Label>
        <div class="card-group">
            <div class="card p-3">
                                <asp:Label ID="lblWork" runat="server" Text=" Your Current Assignments"></asp:Label>
               <%-- <asp:GridView
                    ID="gvWork"
                    runat="server"
                    DataKeyNames="serviceTicketID"
                    OnRowDataBound="gvWork_RowDataBound"
                    OnSelectedIndexChanged="gvWork_SelectedIndexChanged"
                    AutoGenerateColumns="false"
                    class="table table-bordered table-condensed">
                    <Columns>
                        <asp:BoundField DataField="Note" HeaderText="Assignment Note" />
                        <asp:BoundField DataField="Assigned On:" HeaderText="Assigned On" />
                    </Columns>
                </asp:GridView>--%>
                <asp:Label ID="Label1" runat="server" Text="Select a ticket assignment for more information." Font-Italic="true"></asp:Label>
            </div>

            
        </div>
    </div>
</asp:Content>
