﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MoveRequest.aspx.cs" Inherits="GreenValleySystem.MoveRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <asp:LinkButton ID="lnkButtonReturn" PostBackUrl="customerProfile.aspx" runat="server">Back to Customer</asp:LinkButton>
    <div class="card card-body mb-3">
        <asp:Label ID="lblCustomer" runat="server" class="h4"></asp:Label>
        <div class="form-group">
            <asp:TextBox ID="txtServiceAddress" runat="server" Placeholder="Service Address" class="form-control"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="rfvServiceAddress" runat="server"
                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceAddress"
                Text="Please Enter An Address." ValidationGroup="MoveRequest">
            </asp:RequiredFieldValidator>--%>
        </div>

        <div class="row form-group">
            <div class="col-md-6">
                <asp:TextBox ID="txtServiceCity" runat="server" Placeholder="Service City" class="form-control"></asp:TextBox>
<%--                <asp:RequiredFieldValidator ID="rfvServiceCity" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceCity"
                    Text="Please Enter A City." ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="cityValid"
                    runat="server"
                    ErrorMessage="Only Spaces and letters are valid characters!"
                    ControlToValidate="txtServiceCity"
                    ValidationGroup="MoveRequest"
                    ValidationExpression="[a-zA-Z ]*$"

                    ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <div class="col-md-2">
                <asp:DropDownList ID="ddlServiceState" runat="server" class="form-control"></asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="rfvServiceState" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlServiceState"
                    Text="Please Select A State." ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>--%>
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtServiceZip" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="rfvServiceZip" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceZip"
                    Text="Please Enter Zip Code." ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator runat="server"
                    id="rexNumber"
                    controltovalidate="txtServiceZip"
                    validationexpression="\d{5}(-\d{4})?"
                    ValidationGroup="MoveRequest"
                    errormessage="Please enter a 5 digit zip code!" />
                                  <script>
                                      var num = document.getElementById('<%=txtServiceZip.ClientID %>').value;
                                      if (num > 30 || num <= 0)
                                      {
                                          alert('Please Enter Value between 1 to 30');
                                          document.getElementById('<%=txtServiceZip.ClientID %>').value = '';
                                          document.getElementById('<%=txtServiceZip.ClientID %>').focus();
                                          return false;
                                      }
                                      return true;
                                  </script>
            </div>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtDestinationAddress" runat="server" Placeholder="Destination Address" class="form-control"></asp:TextBox>
           <%-- <asp:RequiredFieldValidator ID="rfvDestAddress" runat="server"
                ErrorMessage="rfvDestinationAddress" ControlToValidate="txtDestinationAddress"
                Text="Please Enter An Address." ValidationGroup="MoveRequest">
            </asp:RequiredFieldValidator>--%>
        </div>

        <div class="row form-group">
            <div class="col-md-6">
                <asp:TextBox ID="txtDestinationCity" runat="server" Placeholder="Destination City" class="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvDestinationCity" runat="server"
                    ErrorMessage="rfvDestCity" ControlToValidate="txtDestinationCity"
                    Text="Please Enter A City." ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator ID="destCityValid"
                    runat="server"
                    ErrorMessage="Only Spaces and letters are valid characters!"
                    ControlToValidate="txtDestinationCity"
                    ValidationExpression="[a-zA-Z ]*$"
                    ValidationGroup="MoveRequest"
                    ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <div class="col-md-2">
                <asp:DropDownList ID="ddlDestinationState" runat="server" class="form-control"></asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="rfvDestinationState" runat="server"
                    ErrorMessage="rfvDestState" ControlToValidate="ddlDestinationState"
                    Text="Please Select A State." ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>--%>
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtDestinationZip" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvDestinationZip" runat="server"
                    ErrorMessage="rfvDestZip" ControlToValidate="txtDestinationZip"
                    Text="Please Enter Zip Code." ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>--%>
                <asp:RegularExpressionValidator runat="server"
                    id="destZip"
                    controltovalidate="txtDestinationZip"
                    validationexpression="\d{5}(-\d{4})?"
                    ValidationGroup="MoveRequest"
                    errormessage="Please enter a 5 digit zip code!" />
                                  <script>
                                      var num = document.getElementById('<%=txtServiceZip.ClientID %>').value;
                                      if (num > 30 || num <= 0) {
                                          alert('Please Enter Value between 1 to 30');
                                          document.getElementById('<%=txtServiceZip.ClientID %>').value = '';
                                          document.getElementById('<%=txtServiceZip.ClientID %>').focus();
                                          return false;
                                      }
                                      return true;
                                  </script>
            </div>
        </div>

        <div class="row">
            <div class="col-2">
                <asp:Label ID="lblserviceDeadline" runat="server" Text="Deadline "></asp:Label>
            </div>
            <div class="form-group col-5">
                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" for="txtStartDate"></asp:Label>
                <asp:TextBox ID="txtStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStartDate"
                    Text="Please Select a Start Date" ValidationGroup="MoveRequest">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group col-5">
                <asp:Label ID="lblEndDate" runat="server" Text="End Date" for="txtEndDate"></asp:Label>
                <asp:TextBox ID="txtEndDate" runat="server" Placeholder="End Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:CustomValidator ID="dateValidation" runat="server" Text="Start Date Must Be Before End Date" ErrorMessage="CustomValidator"
                    OnServerValidate="dateValidation_ServerValidate" ValidationGroup="MoveRequest"></asp:CustomValidator>
            </div>
        </div>

        <div class="form-group">
                        <asp:TextBox ID="txtNotes" runat="server" Placeholder="Initial Notes"
                            Class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>

        <div class="form-group">
                <div class="d-flex justify-content-around">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="MoveRequest" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
