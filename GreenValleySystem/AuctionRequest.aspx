<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AuctionRequest.aspx.cs" Inherits="GreenValleySystem.AuctionRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card-body">
        <div class="form-group">
            <asp:TextBox ID="txtAuctionAddress" runat="server" Placeholder="Service Address" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAuctionAddress" runat="server"
                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAuctionAddress"
                Text="Please Enter An Address." ValidationGroup="CreateCustomer">
            </asp:RequiredFieldValidator>
        </div>

        <div class="row form-group">
            <div class="col-md-6">
                <asp:TextBox ID="txtAuctionCity" runat="server" Placeholder="Service City" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAuctionCity" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAuctionCity"
                    Text="Please Enter A City." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-2">
                <asp:DropDownList ID="ddlAuctionState" runat="server" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvAuctionState" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlAuctionState"
                    Text="Please Select A State." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtAuctionZip" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAuctionZip" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAuctionZip"
                    Text="Please Enter Zip Code." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-2">
                <asp:Label ID="Label1" runat="server" Text="Deadline "></asp:Label>
            </div>
            <div class="form-group col-5">
                <asp:Label ID="lblAuctionStartDate" runat="server" Text="Start Date" for="txtStartDate"></asp:Label>
                <asp:TextBox ID="txtAuctionStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStartDateAuction" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAuctionStartDate"
                    Text="Please Select a Start Date" ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group col-5">
                <asp:Label ID="lblAuctionEndDate" runat="server" Text="End Date" for="txtEndDate"></asp:Label>
                <asp:TextBox ID="txtAuctionEndDate" runat="server" Placeholder="End Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:CustomValidator ID="auctionDateValidate" runat="server" Text="Start Date Must Be Before End Date" ErrorMessage="CustomValidator"
                    OnServerValidate="auctionDateValidate_ServerValidate" ValidationGroup="CreateCustomer"></asp:CustomValidator>
            </div>
        </div>

        <div class="form-group">
                        <asp:TextBox ID="txtNotes" runat="server" Placeholder="Initial Notes"
                            Class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>

        <div class="form-group">
                <div class="d-flex justify-content-around">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" class="btn btn-primary btn-lg" OnClick="btnClear_Click" CausesValidation="false" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="CreateCustomer" />
                    <asp:Button ID="btnPopulate" runat="server" Text="Populate" class="btn btn-secondary btn-lg" OnClick="btnPopulate_Click" CausesValidation="false" />
                </div>
            </div>
        </div>
</asp:Content>
