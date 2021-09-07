<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerPortal.Master" AutoEventWireup="true" CodeBehind="requestMove.aspx.cs" Inherits="GreenValleySystem.requestMove" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="card card-body">
        <div class="form-group">
            <asp:TextBox ID="txtServiceAddress" runat="server" Placeholder="Service Address" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvServiceAddress" runat="server"
                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceAddress"
                Text="Please Enter An Address." ValidationGroup="CreateCustomer">
            </asp:RequiredFieldValidator>
        </div>

        <div class="row form-group">
            <div class="col-md-6">
                <asp:TextBox ID="txtServiceCity" runat="server" Placeholder="Service City" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvServiceCity" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceCity"
                    Text="Please Enter A City." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="cityValid"
                    runat="server"
                    ErrorMessage="Only Spaces and letters are valid characters!"
                    ControlToValidate="txtServiceCity"
                    ValidationExpression="[a-zA-Z ]*$"
                    ValidationGroup="CreateCustomer"
                    ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <div class="col-md-2">
                <asp:DropDownList ID="ddlServiceState" runat="server" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvServiceState" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlServiceState"
                    Text="Please Select A State." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtServiceZip" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvServiceZip" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceZip"
                    Text="Please Enter Zip Code." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server"
                    id="rexNumber"
                    ValidationGroup="CreateCustomer"
                    controltovalidate="txtServiceZip"
                    validationexpression="\d{5}(-\d{4})?"
                    errormessage="Please enter a 5 digit zip code!" />
            </div>
        </div>

        <div class="form-group">
            <asp:TextBox ID="txtDestinationAddress" runat="server" Placeholder="Destination Address" class="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDestAddress" runat="server"
                ErrorMessage="rfvDestinationAddress" ControlToValidate="txtDestinationAddress"
                Text="Please Enter An Address." ValidationGroup="CreateCustomer">
            </asp:RequiredFieldValidator>
        </div>

        <div class="row form-group">
            <div class="col-md-6">
                <asp:TextBox ID="txtDestinationCity" runat="server" Placeholder="Destination City" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDestinationCity" runat="server"
                    ErrorMessage="rfvDestCity" ControlToValidate="txtDestinationCity"
                    Text="Please Enter A City." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                    runat="server"
                    ValidationGroup="CreateCustomer"
                    ErrorMessage="Only Spaces and letters are valid characters!"
                    ControlToValidate="txtDestinationCity"
                    ValidationExpression="[a-zA-Z ]*$"
                    ForeColor="Red"></asp:RegularExpressionValidator>
            </div>

            <div class="col-md-2">
                <asp:DropDownList ID="ddlDestinationState" runat="server" class="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDestinationState" runat="server"
                    ErrorMessage="rfvDestState" ControlToValidate="ddlDestinationState"
                    Text="Please Select A State." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-4">
                <asp:TextBox ID="txtDestinationZip" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDestinationZip" runat="server"
                    ErrorMessage="rfvDestZip" ControlToValidate="txtDestinationZip"
                    Text="Please Enter Zip Code." ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server"
                    id="RegularExpressionValidator2"
                    ValidationGroup="CreateCustomer"
                    controltovalidate="txtDestinationZip"
                    validationexpression="\d{5}(-\d{4})?"
                    errormessage="Please enter a 5 digit zip code!" />
            </div>
        </div>

        <div class="row">
            <div class="col-2">
                <asp:Label ID="lblserviceDeadline" runat="server" Text="Deadline "></asp:Label>
            </div>
            <div class="form-group col-5">
                <asp:Label ID="lblStartDate" runat="server" Text="Start Date" for="txtStartDate"></asp:Label>
                <asp:TextBox ID="txtStartDate" runat="server" Placeholder="Start Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="rfvStartDate" runat="server"
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStartDate"
                    Text="Please Select a Start Date" ValidationGroup="CreateCustomer">
                </asp:RequiredFieldValidator>--%>
            </div>

            <div class="form-group col-5">
                <asp:Label ID="lblEndDate" runat="server" Text="End Date" for="txtEndDate"></asp:Label>
                <asp:TextBox ID="txtEndDate" runat="server" Placeholder="End Date" class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                <asp:CustomValidator ID="dateValidation" runat="server" Text="Start Date Must Be Before End Date" ErrorMessage="CustomValidator"
                    OnServerValidate="dateValidation_ServerValidate" ValidationGroup="CreateCustomer"></asp:CustomValidator>
            </div>
        </div>

        <div class="form-group">
                        <asp:TextBox ID="txtNotes" runat="server" Placeholder="Initial Notes"
                            Class="form-control" TextMode="MultiLine"></asp:TextBox>
                    </div>


        <div class="form-group">
                <div class="d-flex justify-content-around">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="CreateCustomer" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
