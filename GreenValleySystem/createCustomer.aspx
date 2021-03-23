﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="createCustomer.aspx.cs" Inherits="Lab1.createCustomer" %>

<%--Kirsi And Josh Coleman 2/15/21--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery.mask.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.phone_us').mask('(000) 000-0000');
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-6">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Initial Contact Form" Class="display-4 m-2"></asp:Label>
            </div>


            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <asp:Label ID="lblCustomerInfo" runat="server" Text="Customer Info" Class="h6"></asp:Label>
                    <div class="form-group">
                        <asp:TextBox ID="txtFirstName" runat="server" Placeholder="First Name" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName"
                            Text="Please Enter A First Name." ValidationGroup="CreateCustomer">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName"
                            Text="Please Enter A Last Name." ValidationGroup="CreateCustomer">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="row form-group">
                        <div class="col-md 9">
                            <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control phone_us" PlaceHolder="Phone Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhoneNumber"
                                Text="Please Enter A Phone Number." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md 2">
                            <asp:DropDownList ID="ddlPhoneNumberType" runat="server" class="dropdown form-control col-4 mb-1">
                                <asp:ListItem>Home</asp:ListItem>
                                <asp:ListItem>Cell</asp:ListItem>
                                <asp:ListItem>Work</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RrfvPhoneType" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPhoneNumberType"
                                Text="Please Select Phone Type." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" Placeholder="email" class="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                            Text="Please Enter An Email." ValidationGroup="CreateCustomer">
                        </asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvCheckUniqueCustomer" runat="server"
                            ErrorMessage="CustomValidator" OnServerValidate="cvCheckUniqueCustomer_ServerValidate"
                            ValidationGroup="CreateCustomer" Text="This Email is already in use"></asp:CustomValidator>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="txtAddress" runat="server" Placeholder="Address" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                            Text="Please Enter An Address." ValidationGroup="CreateCustomer">
                        </asp:RequiredFieldValidator>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-6">
                            <asp:TextBox ID="txtCity" runat="server" Placeholder="City" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                Text="Please Enter A City." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-2">
                            <asp:DropDownList ID="ddlState" runat="server" class="form-control"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlState"
                                Text="Please Select A State." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-md-4">
                            <asp:TextBox ID="txtZipCode" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                Text="Please Enter Zip Code." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                </li>

                <li class="list-group-item">
                    <asp:Label ID="lblContact" runat="server" Text="Initial Contact" class="h6"></asp:Label>
                    <div class="row">
                        <div class="col-8">
                            <asp:RadioButtonList ID="rdoContact" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                class="row d-flex justify-content-around form-check form-check-inline" OnSelectedIndexChanged="rdoContact_SelectedIndexChanged"
                                AutoPostBack="true">
                                <asp:ListItem Class="form-check-input" Text="In Person"></asp:ListItem>
                                <asp:ListItem Class="form-check-input" Text="Phone"></asp:ListItem>
                                <asp:ListItem Class="form-check-input" Text="Email"></asp:ListItem>
                                <asp:ListItem Class="form-check-input" Text="Text"></asp:ListItem>
                                <asp:ListItem Class="form-check-input" Text="Other"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfv" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="rdoContact"
                                Text="Please select a contact type" ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-4">
                            <asp:TextBox ID="txtOther" Class="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvOther" runat="server" ErrorMessage="RequiredFieldValidator"
                                ControlToValidate="txtOther" Enabled="false" Text="Please specify" ValidationGroup="CreateCustomer"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:TextBox ID="txtHear" runat="server" Placeholder="How did they hear about us?"
                            Class="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHear"
                            Text="Please Complete this field" ValidationGroup="CreateCustomer"></asp:RequiredFieldValidator>
                    </div>
                </li>



                <li class="list-group-item">
                    <div class="form-group">
                        <asp:TextBox ID="txtNotes" runat="server" Placeholder="Initial Notes"
                            Class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </li>

            </ul>

            <asp:Label ID="outputLbl" runat="server" Text=""></asp:Label>
            <div class="form-group">
                <div class="d-flex justify-content-around">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" class="btn btn-primary btn-lg" OnClick="btnClear_Click" CausesValidation="false" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="CreateCustomer" />
                    <asp:Button ID="btnPopulate" runat="server" Text="Populate" class="btn btn-secondary btn-lg" OnClick="btnPopulate_Click" CausesValidation="false" />
                </div>
            </div>
        </div>

    </div>

</asp:Content>