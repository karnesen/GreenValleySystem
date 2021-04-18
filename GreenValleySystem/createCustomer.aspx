<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="createCustomer.aspx.cs" Inherits="Lab1.createCustomer" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <%--<base href="http://demos.telerik.com/kendo-ui/maskedtextbox/index">--%>
    <title></title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.common-bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.bootstrap.min.css" />
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.dataviz.min.css" />
    <link rel="stylesheet" href="http://cdn.kendostatic.com/2015.1.429/styles/kendo.dataviz.bootstrap.min.css" />
    ​
    <script src="http://cdn.kendostatic.com/2015.1.429/js/jquery.min.js"></script>
    <script src="http://cdn.kendostatic.com/2015.1.429/js/kendo.all.min.js"></script>

    <div class="row  container-fluid">
        <div class="col-6">
            <div class="card mb-2">
                <div class="card-header text-center">
                    <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Initial Contact Form" Class="h3 m-2"></asp:Label>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <asp:Label ID="lblCustomerInfo" runat="server" Text="Customer Info" Class="h6"></asp:Label>
                            <div class="row form-group">
                                <div class="col-md-4">
                                    <asp:TextBox ID="txtFirstName" runat="server" Placeholder="First Name" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName"
                                        Text="Please Enter A First Name." ValidationGroup="CreateCustomer">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                         runat="server"
                                         ErrorMessage="Only Spaces and letters are valid characters!"
                                         ControlToValidate="txtFirstName"
                                         ValidationExpression="[a-zA-Z ]*$"
                                         ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-4">
                                    <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName"
                                        Text="Please Enter A Last Name." ValidationGroup="CreateCustomer">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                         runat="server"
                                         ErrorMessage="Only Spaces and letters are valid characters!"
                                         ControlToValidate="txtLastName"
                                         ValidationExpression="[a-zA-Z ]*$"
                                         ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                                <div class=col-md-3>
                                <asp:Button ID="btnCheckUniqueCombo" runat="server" ValidationGroup="CreateCustomer" Text="Check Unique" class="btn btn-outline-primary" OnClick="btnCheckUniqueCombo_Click"/>
                                    <asp:Label ID="lblUnique" runat="server" Text=""></asp:Label>
                                    </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPhoneNumber" runat="server" class="form-control" PlaceHolder="Phone Number" ClientIDMode="Static"></asp:TextBox>

                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $("#txtPhoneNumber").kendoMaskedTextBox({
                                                mask: "(999) 000-0000",
                                                clearPromptChar: true
                                            });
                                        });
                                    </script>
                                    
                                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhoneNumber"
                                        Text="Phone Required." ValidationGroup="CreateCustomer">
                                    </asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlPhoneNumberType" runat="server" class="dropdown form-control mb-1">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Home</asp:ListItem>
                                        <asp:ListItem>Cell</asp:ListItem>
                                        <asp:ListItem>Work</asp:ListItem>
                                    </asp:DropDownList>
                                    <%-- <asp:RequiredFieldValidator ID="RrfvPhoneType" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPhoneNumberType"
                                Text="Please Select Phone Type." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>--%>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtPhoneNumber2" runat="server" class="form-control phone_us" PlaceHolder="Phone Number" ClientIDMode="Static"></asp:TextBox>

                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $("#txtPhoneNumber2").kendoMaskedTextBox({
                                                mask: "(999) 000-0000",
                                                clearPromptChar: true
                                            });
                                        });
                                    </script>

                                </div>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlPhoneNumberType2" runat="server" class="dropdown form-control mb-1">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem>Home</asp:ListItem>
                                        <asp:ListItem>Cell</asp:ListItem>
                                        <asp:ListItem>Work</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" class="form-control" TextMode="Email"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                                    Text="Please Enter An Email." ValidationGroup="CreateCustomer">
                                </asp:RequiredFieldValidator>--%>
                                <asp:CustomValidator ID="cvCheckUniqueCustomer" runat="server"
                                    ErrorMessage="CustomValidator" OnServerValidate="cvCheckUniqueCustomer_ServerValidate"
                                    ValidationGroup="CreateCustomer" Text="This Email is already in use"></asp:CustomValidator>
                                <asp:RegularExpressionValidator ID="emailValid"
                                      runat="server"
                                      ControlToValidate="txtEmail"
                                      ForeColor="Red"
                                      ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                      Display = "Dynamic"
                                      ErrorMessage = "Invalid email address"/>
                            </div>

                            <asp:Label ID="lblContactPreference" runat="server" Class="h6" Text="Contact Preference"></asp:Label>
                            <div class="row form-group justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chHome" runat="server" Text="Home"  />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chMobile" Text="Mobile" runat="server" TextAlign="Right" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chText" Text="Text" runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chEmail" Text="Email" runat="server" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtAddress" runat="server" Placeholder="Address" class="form-control"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                            Text="Please Enter An Address." ValidationGroup="CreateCustomer">
                        </asp:RequiredFieldValidator>--%>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtCity" runat="server" Placeholder="City" class="form-control"></asp:TextBox>
                                    <%--    <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                Text="Please Enter A City." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator ID="cityValid"
                                         runat="server"
                                         ErrorMessage="Only Spaces and letters are valid characters!"
                                         ControlToValidate="txtCity"
                                         ValidationExpression="[a-zA-Z ]*$"
                                         ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>

                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlState" runat="server" class="form-control"></asp:DropDownList>
                                    <%--<asp:RequiredFieldValidator ID="rfvState" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlState"
                                Text="Please Select A State." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>--%>
                                </div>

                                <div class="col-md-4">
                                    <asp:TextBox ID="txtZipCode" runat="server" Placeholder="Zip" class="form-control"></asp:TextBox>
                                    <%--<asp:CompareValidator ID="zipCodeValidator" runat="server" ErrorMessage="Invalid Zipcode" ValidationGroup="CreateCustomer" 
                                        ControlToValidate="txtZipCode" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>--%>
                                    <%-- <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                Text="Please Enter Zip Code." ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator runat="server"
                                        id="rexNumber"
                                        controltovalidate="txtZipCode"
                                        validationexpression="\d{5}(-\d{4})?"
                                        errormessage="Please enter a 5 digit zip code!" />
                                   
                                    

                                </div>
                            </div>
                        </li>

                        <li class="list-group-item">
                            <asp:Label ID="lblContact" runat="server" Text="Initial Contact" class="h6"></asp:Label>
                            <div class="row">
                                <div class="col-8">
                                    <asp:RadioButtonList ID="rdoContact" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                        class="row d-flex justify-content-around form-check form-check-inline">
                                        <asp:ListItem Class="form-check-input" Text="In Person"></asp:ListItem>
                                        <asp:ListItem Class="form-check-input" Text="Phone"></asp:ListItem>
                                        <asp:ListItem Class="form-check-input" Text="Email"></asp:ListItem>
                                        <asp:ListItem Class="form-check-input" Text="Text"></asp:ListItem>
                                        <asp:ListItem Class="form-check-input" Text="Other"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <%--<asp:RequiredFieldValidator ID="rfv" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="rdoContact"
                                Text="Please select a contact type" ValidationGroup="CreateCustomer">
                            </asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="col-4">
                                    <asp:TextBox ID="txtOther" Class="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvOther" runat="server" ErrorMessage="RequiredFieldValidator"
                                        ControlToValidate="txtOther" Enabled="false" Text="Please specify" ValidationGroup="CreateCustomer">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtHear" runat="server" Placeholder="How did they hear about us?"
                                    Class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHear"
                            Text="Please Complete this field" ValidationGroup="CreateCustomer"></asp:RequiredFieldValidator>--%>
                            </div>
                        </li>

                        <li class="list-group-item">
                            <asp:Label ID="Label1" runat="server" Class="h6" Text="Requested Services"></asp:Label>
                            <div class="row form-group justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chAuction" Text="Auction" runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chMove" Text="Move" runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chAppraisal" Text="Appraisal" runat="server" />
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
                        </li>


                    </ul>



                    <div class="form-group">
                        <div class="d-flex justify-content-around">
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="CreateCustomer" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card-body sticky-top">
                <div class=" form-group">

                    <asp:TextBox ID="txtNoteBody" runat="server" TextMode="MultiLine" Placeholder="Notes" Rows="30" class="form-control"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
