<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="lookAtForm.aspx.cs" Inherits="GreenValleySystem.lookAtForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblLookAtForm" runat="server" Text="" Class="h3 m-2"></asp:Label>
            </div>

            <div class="card-body form-group">
                <div class="form-group row">
                    <label for="txtDistance" class="col-sm-2 col-form-label">Distance from Truck</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDistance" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtDriveway" class="col-sm-2 col-form-label">Driveway Accessibility</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDriveway" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="loadingConditions" class="col-sm-2 col-form-label">Loading Conditions</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="loadingConditions" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
