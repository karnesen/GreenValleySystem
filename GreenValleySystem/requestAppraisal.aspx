<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="requestAppraisal.aspx.cs" Inherits="GreenValleySystem.requestAppraisal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <asp:LinkButton ID="lnkButtonReturn" PostBackUrl="customerProfile.aspx" runat="server">Back to Customer</asp:LinkButton>
    <div class="card card-body mb-3">
        <asp:Label ID="lblCustomer" runat="server"></asp:Label>

        <div class="row">
            <div class="col-2">
                <asp:Label ID="Label1" runat="server" Text="Deadline "></asp:Label>
            </div>
            <div class="form-group col-5">
                <asp:Label ID="lblAuctionStartDate" runat="server" Text="Start Date" for="txtStartDate"></asp:Label>
                <asp:TextBox ID="txtAuctionStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
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
            <asp:RegularExpressionValidator 
                id="revEquipment"  
                runat="server"
                ControlToValidate="txtNotes" 
                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                ErrorMessage="Invalid Input" 
                ForeColor="Red">
            </asp:regularexpressionvalidator>
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
