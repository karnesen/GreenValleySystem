﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerPortal.Master" AutoEventWireup="true" CodeBehind="requestAuction.aspx.cs" Inherits="GreenValleySystem.requestAuction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="card card-body">
        <asp:Label ID="lblCustomer" runat="server"></asp:Label>
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
                <asp:RegularExpressionValidator ID="cityValid"
                    runat="server"
                    ErrorMessage="Only Spaces and letters are valid characters!"
                    ControlToValidate="txtAuctionCity"
                    ValidationExpression="[a-zA-Z ]*$"
                    ValidationGroup="CreateCustomer"
                    ForeColor="Red"></asp:RegularExpressionValidator>
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
                <asp:RegularExpressionValidator runat="server"
                    id="rexNumber"
                    ValidationGroup="CreateCustomer"
                    controltovalidate="txtAuctionZip"
                    validationexpression="\d{5}(-\d{4})?"
                    errormessage="Please enter a 5 digit zip code!" />
                                  <script>
                                      var num = document.getElementById('<%=txtAuctionZip.ClientID %>').value;
                                      if (num > 30 || num <= 0)
                                      {
                                          alert('Please Enter Value between 1 to 30');
                                          document.getElementById('<%=txtAuctionZip.ClientID %>').value = '';
                                          document.getElementById('<%=txtAuctionZip.ClientID %>').focus();
                                          return false;
                                      }
                                      return true;
                                  </script>
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

        <%--<div class="form-group">
            <input id="oFile" type="file" runat="server" class="btn btn-primary btn-lg" name="oFile" />
            <asp:Button ID="btnImageupload" runat="server" class="btn btn-primary btn-lg" Text="Upload Image" type="submit" OnClick="btnImageupload_Click"/>
            <asp:Panel ID="panelConfirm" runat="server" Visible="false">
            <asp:Label ID="lblResult" runat="server" class="h6" Text="Label"></asp:Label>
            </asp:Panel>
        </div>--%>

        <div class="form-group">
            <div class="d-flex justify-content-around">
                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="CreateCustomer" />
            </div>
        </div>
        </div>
    </div>
</asp:Content>
