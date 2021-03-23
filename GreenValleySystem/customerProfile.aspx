<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="customerProfile.aspx.cs" Inherits="GreenValleySystem.customerProfile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="card-body">
            <asp:DetailsView
                ID="dvCustomerInfo"
                runat="server"
                class="table table-bordered table-condensed"
                DataSourceID="srcCustomer"
                DataKeyName="customerID"
                AutoGenerateEditButton="true"
                AutoGenerateRows="false">
                <Fields>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <div class="form-group">
                                <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("firstName") %>' class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName"
                                    Text="Please Enter A First Name.">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("lastName") %>' class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName"
                                    Text="Please Enter A Last Name.">
                                </asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server"
                                Text='<%# Bind("firstName") %>'></asp:Label>
                            <asp:Label ID="lblLastName" runat="server"
                                Text='<%# Bind("lastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Phone">
                        <EditItemTemplate>
                            <div class="row form-group">
                                <div class="col-md 9">
                                    <asp:TextBox ID="txtphoneNumber" runat="server" class="form-control phone_us" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhoneNumber"
                                        Text="Please Enter A Phone Number.">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md 2">
                                    <asp:DropDownList ID="ddlPhoneNumberType" runat="server" class="dropdown form-control col-4 mb-1" SelectedValue='<%# Bind("phoneType") %>'>
                                        <asp:ListItem>Home</asp:ListItem>
                                        <asp:ListItem>Cell</asp:ListItem>
                                        <asp:ListItem>Work</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RrfvPhoneType" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPhoneNumberType"
                                        Text="Please Select Phone Type.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                            <asp:Label ID="lblPhoneType" runat="server" Text='<%# Bind("phoneType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="E-mail">
                        <EditItemTemplate>
                            <div class="form-group">
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' class="form-control" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                                    Text="Please Enter An Email.">
                                </asp:RequiredFieldValidator>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server"
                                Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Address">
                        <EditItemTemplate>
                            <div class="form-group">
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("streetAddress") %>' class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                                    Text="Please Enter An Address.">
                                </asp:RequiredFieldValidator>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-6">
                                    <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                        Text="Please Enter A City.">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlState" runat="server" class="form-control" SelectedValue='<%# Bind("state") %>'>
                                        <asp:ListItem Value="AL">AL</asp:ListItem>
                                        <asp:ListItem Value="AK">AK</asp:ListItem>
                                        <asp:ListItem Value="AZ">AZ</asp:ListItem>
                                        <asp:ListItem Value="AR">AR</asp:ListItem>
                                        <asp:ListItem Value="CA">CA</asp:ListItem>
                                        <asp:ListItem Value="CO">CO</asp:ListItem>
                                        <asp:ListItem Value="CT">CT</asp:ListItem>
                                        <asp:ListItem Value="DC">DC</asp:ListItem>
                                        <asp:ListItem Value="DE">DE</asp:ListItem>
                                        <asp:ListItem Value="FL">FL</asp:ListItem>
                                        <asp:ListItem Value="GA">GA</asp:ListItem>
                                        <asp:ListItem Value="HI">HI</asp:ListItem>
                                        <asp:ListItem Value="ID">ID</asp:ListItem>
                                        <asp:ListItem Value="IL">IL</asp:ListItem>
                                        <asp:ListItem Value="IN">IN</asp:ListItem>
                                        <asp:ListItem Value="IA">IA</asp:ListItem>
                                        <asp:ListItem Value="KS">KS</asp:ListItem>
                                        <asp:ListItem Value="KY">KY</asp:ListItem>
                                        <asp:ListItem Value="LA">LA</asp:ListItem>
                                        <asp:ListItem Value="ME">ME</asp:ListItem>
                                        <asp:ListItem Value="MD">MD</asp:ListItem>
                                        <asp:ListItem Value="MA">MA</asp:ListItem>
                                        <asp:ListItem Value="MI">MI</asp:ListItem>
                                        <asp:ListItem Value="MN">MN</asp:ListItem>
                                        <asp:ListItem Value="MS">MS</asp:ListItem>
                                        <asp:ListItem Value="MO">MO</asp:ListItem>
                                        <asp:ListItem Value="MT">MT</asp:ListItem>
                                        <asp:ListItem Value="NE">NE</asp:ListItem>
                                        <asp:ListItem Value="NV">NV</asp:ListItem>
                                        <asp:ListItem Value="NH">NH</asp:ListItem>
                                        <asp:ListItem Value="NJ">NJ</asp:ListItem>
                                        <asp:ListItem Value="NM">NM</asp:ListItem>
                                        <asp:ListItem Value="NY">NY</asp:ListItem>
                                        <asp:ListItem Value="NC">NC</asp:ListItem>
                                        <asp:ListItem Value="ND">ND</asp:ListItem>
                                        <asp:ListItem Value="OH">OH</asp:ListItem>
                                        <asp:ListItem Value="OK">OK</asp:ListItem>
                                        <asp:ListItem Value="OR">OR</asp:ListItem>
                                        <asp:ListItem Value="PA">PA</asp:ListItem>
                                        <asp:ListItem Value="RI">RI</asp:ListItem>
                                        <asp:ListItem Value="SC">SC</asp:ListItem>
                                        <asp:ListItem Value="SD">SD</asp:ListItem>
                                        <asp:ListItem Value="TN">TN</asp:ListItem>
                                        <asp:ListItem Value="TX">TX</asp:ListItem>
                                        <asp:ListItem Value="UT">UT</asp:ListItem>
                                        <asp:ListItem Value="VT">VT</asp:ListItem>
                                        <asp:ListItem Value="VA">VA</asp:ListItem>
                                        <asp:ListItem Value="WA">WA</asp:ListItem>
                                        <asp:ListItem Value="WV">WV</asp:ListItem>
                                        <asp:ListItem Value="WI">WI</asp:ListItem>
                                        <asp:ListItem Value="WY">WY</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvState" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlState"
                                        Text="Please Select A State.">
                                    </asp:RequiredFieldValidator>
                                </div>

                                <div class="col-md-4">
                                    <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("zipcode") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                        Text="Please Enter Zip Code.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>
                            <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                            <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Initial Contact Type">
                        <ItemTemplate>
                            <asp:Label ID="lblInitialContact" runat="server"
                                Text='<%# Bind("initialContactType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Hear About">
                        <ItemTemplate>
                            <asp:Label ID="lblHearAbout" runat="server"
                                Text='<%# Bind("hearAbout") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Initial Contact Date">
                        <ItemTemplate>
                            <asp:Label ID="lblInitialContactDate" runat="server"
                                Text='<%# Bind("initialContactDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Last Updated" ControlStyle-Font-Italic="true">
                        <ItemTemplate>
                            <asp:Label ID="lblLastUpdated" runat="server" Font-Italic="true"
                                Text='<%# Bind("lastUpdated") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>

            <asp:SqlDataSource
                ID="srcCustomer"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:Connect %>"
                SelectCommand="Select * from Customer where customerID =  @selectedCustomer"
                UpdateCommand="Update Customer SET firstName = @firstName, lastName=@lastName, phoneNumber=@phoneNumber, phoneType=@phoneType, email=@email, streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode, lastUpdated=getDate() where customerID=@selectedCustomer">
                <SelectParameters>
                    <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <div class="card-body">
            <asp:Button ID="btnNewMove" runat="server" Text="New Move" OnClick="btnNewMove_Click" class="btn-outline-secondary btn-block" />
            <asp:Button ID="btnNewAuction" runat="server" Text="New Auction" OnClick="btnNewAuction_Click" class="btn-outline-secondary btn-block" />
        </div>
    </div>

    <asp:GridView
        ID="gvCustomerTickets"
        runat="server"
        DataKeyNames="serviceID"
        DataSourceID="srcServices"
        AutoGenerateColumns="false"
        OnRowDataBound="gvCustomerTickets_RowDataBound"
        OnSelectedIndexChanged="gvCustomerTickets_SelectedIndexChanged"
        class="table table-bordered table-condensed table-hover">
        <Columns>
            <asp:TemplateField HeaderText="Service Type">
                <ItemTemplate>
                    <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : "Auction"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="serviceOpenDate" HeaderText="Open Date" />

            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%#(Eval("serviceStatus").ToString()) == "True" ? "Active" : "Inactive"%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource
        ID="srcServices"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Connect %>"
        SelectCommand="Select serviceStatus, serviceType, serviceOpenDate, serviceID from Service where customerID=@selectedCustomer order by serviceStatus desc, serviceOpenDate asc">
        <SelectParameters>
            <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
