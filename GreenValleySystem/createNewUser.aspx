<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createNewUser.aspx.cs" Inherits="GreenValleySystem.createNewUser" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title></title>

    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type='text/javascript' src='https://code.jquery.com/jquery-1.11.0.js'></script>
    <script type='text/javascript' src="https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container col-6">
                <div class="card">
                    <div class="card-header text-center">
                        <asp:Label ID="lblCreateNewCustomer" runat="server" Text="Initial Contact Information" Class="h3 m-2"></asp:Label>
                    </div>

                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="text-center">
                                <asp:LinkButton ID="lbtnExisitngUser" runat="server" PostBackUrl="customerLogin.aspx">Already Have an Account?</asp:LinkButton>
                            </div>

                            <asp:Label ID="lblCustomerInfo" runat="server" Text="Customer Info" Class="h6"></asp:Label>
                            <div class="form-group">
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

                            <div class="form-group">
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
                                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" class="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                                    Text="Please Enter An Email." ValidationGroup="CreateCustomer">
                                </asp:RequiredFieldValidator>
                                <asp:CustomValidator ID="cvCheckUniqueCustomer" runat="server"
                                    ErrorMessage="CustomValidator" OnServerValidate="cvCheckUniqueCustomer_ServerValidate"
                                    ValidationGroup="CreateCustomer" Text="This Email is already in use"></asp:CustomValidator>
                                <asp:RegularExpressionValidator ID="emailValidation"
                                      runat="server"
                                      ControlToValidate="txtEmail"
                                      ForeColor="Red"
                                      ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                      Display = "Dynamic"
                                      ErrorMessage = "Invalid email address"/>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="txtPassword" runat="server" Placeholder="Password" class="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword"
                                    Text="Please Choose a Password." ValidationGroup="CreateCustomer">
                                </asp:RequiredFieldValidator>
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
                                    <asp:RegularExpressionValidator ID="cityValid"
                                         runat="server"
                                         ErrorMessage="Only Spaces and letters are valid characters!"
                                         ControlToValidate="txtCity"
                                         ValidationExpression="[a-zA-Z ]*$"
                                         ForeColor="Red"></asp:RegularExpressionValidator>
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
                                    <asp:RegularExpressionValidator runat="server"
                                        id="rexNumber"
                                        controltovalidate="txtZipCode"
                                        validationexpression="\d{5}(-\d{4})?"
                                        errormessage="Please enter a 5 digit zip code!" />
                                  <script>
                                      var num = document.getElementById('<%=txtZipCode.ClientID %>').value;
                                      if (num > 30 || num <= 0) {
                                          alert('Please Enter Value between 1 to 30');
                                          document.getElementById('<%=txtZipCode.ClientID %>').value = '';
                                          document.getElementById('<%=txtZipCode.ClientID %>').focus();
                                          return false;
                                      }
                                      return true;
                                  </script>
                                </div>
                            </div>
                        </li>

                        <li class="list-group-item">
                            <%--<asp:Label ID="lblContact" runat="server" Text="Initial Contact" class="h6"></asp:Label>
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
                                </div>
                            </div>--%>

                            <div class="form-group">
                                <asp:TextBox ID="txtHear" runat="server" Placeholder="How did they hear about us?"
                                    Class="form-control" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHear"
                                    Text="Please Complete this field" ValidationGroup="CreateCustomer"></asp:RequiredFieldValidator>
                            </div>
                            <%--<asp:Label ID="lblImages" runat="server" Text="Upload Images From Customer" class="h6"></asp:Label>
                            <div class="form-group">
                                <input id="oFile" type="file" runat="server" name="oFile" class="btn btn-primary" />
                                <asp:Button ID="btnImageupload" runat="server" Text="Upload Image" type="submit" class="btn btn-primary btn-lg" OnClick="btnImageupload_Click" />
                                <asp:Panel ID="panelConfirm" runat="server" Visible="false">
                                    <asp:Label ID="lblResult" runat="server" Text="Label" class="h6"></asp:Label>
                                </asp:Panel>
                            </div>--%>
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
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary  btn-lg" OnClick="btnSave_Click" ValidationGroup="CreateCustomer" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
