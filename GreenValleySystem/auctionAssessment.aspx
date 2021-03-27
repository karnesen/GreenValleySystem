<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="auctionAssessment.aspx.cs" Inherits="GreenValleySystem.auctionAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <asp:FormView
        ID="fvAuctionAssessment"
        runat="server"
        DataSourceID="srcAuctionAssessment">
        <ItemTemplate>
            <div class="form-group row">
                <asp:Label ID="lblSell" For="txtBoxSell" runat="server" class="col-2 col-form-label" Text="What to Sell"></asp:Label>
                <div class="col-10">
                <asp:TextBox ID="txtBoxSell" Text='<%# Bind("whatSell") %>' TextMode="MultiLine" Rows="4" class="form-control" runat="server"></asp:TextBox>
                    </div>
            </div>

            

        </ItemTemplate>
        <EditItemTemplate>
            <div class="form-group row">
                <asp:Label ID="lblWhy" for="txtBoxSell" runat="server" class="col-2 col-form-label" Text="Why Sell"></asp:Label>
                <asp:DropDownList ID="ddlReason" runat="server" SelectedValue='<%# Bind("whySell") %>'>
                    <asp:ListItem>Settling and Estate</asp:ListItem>
                    <asp:ListItem>Moving and Need to Downsize</asp:ListItem>
                    <asp:ListItem>Just Getting Rid of Some Stuff</asp:ListItem>
                </asp:DropDownList>
            </div>
        </EditItemTemplate>

    </asp:FormView>

    <asp:SqlDataSource
        ID="srcAuctionAssessment"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Connect %>"
        SelectCommand="Select * from auctionAssessment where serviceID=@serviceID">
        <SelectParameters>
            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
