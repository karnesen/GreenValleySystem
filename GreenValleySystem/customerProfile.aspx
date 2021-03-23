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
                                        <asp:ListItem Value="AL">Alabama</asp:ListItem>
                                        <asp:ListItem Value="AK">Alaska</asp:ListItem>
                                        <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                                        <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                                        <asp:ListItem Value="CA">California</asp:ListItem>
                                        <asp:ListItem Value="CO">Colorado</asp:ListItem>
                                        <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                                        <asp:ListItem Value="DC">District of Columbia</asp:ListItem>
                                        <asp:ListItem Value="DE">Delaware</asp:ListItem>
                                        <asp:ListItem Value="FL">Florida</asp:ListItem>
                                        <asp:ListItem Value="GA">Georgia</asp:ListItem>
                                        <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                                        <asp:ListItem Value="ID">Idaho</asp:ListItem>
                                        <asp:ListItem Value="IL">Illinois</asp:ListItem>
                                        <asp:ListItem Value="IN">Indiana</asp:ListItem>
                                        <asp:ListItem Value="IA">Iowa</asp:ListItem>
                                        <asp:ListItem Value="KS">Kansas</asp:ListItem>
                                        <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                                        <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                                        <asp:ListItem Value="ME">Maine</asp:ListItem>
                                        <asp:ListItem Value="MD">Maryland</asp:ListItem>
                                        <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                                        <asp:ListItem Value="MI">Michigan</asp:ListItem>
                                        <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                                        <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                                        <asp:ListItem Value="MO">Missouri</asp:ListItem>
                                        <asp:ListItem Value="MT">Montana</asp:ListItem>
                                        <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                                        <asp:ListItem Value="NV">Nevada</asp:ListItem>
                                        <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                                        <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                                        <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                                        <asp:ListItem Value="NY">New York</asp:ListItem>
                                        <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                                        <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                                        <asp:ListItem Value="OH">Ohio</asp:ListItem>
                                        <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                                        <asp:ListItem Value="OR">Oregon</asp:ListItem>
                                        <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                                        <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                                        <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                                        <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                                        <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                                        <asp:ListItem Value="TX">Texas</asp:ListItem>
                                        <asp:ListItem Value="UT">Utah</asp:ListItem>
                                        <asp:ListItem Value="VT">Vermont</asp:ListItem>
                                        <asp:ListItem Value="VA">Virginia</asp:ListItem>
                                        <asp:ListItem Value="WA">Washington</asp:ListItem>
                                        <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                                        <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                                        <asp:ListItem Value="WY">Wyoming</asp:ListItem>
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
            <asp:Button ID="btnNewMove" runat="server" Text="New Move" OnClick="btnNewMove_Click" class="btn-outline-secondary btn-block"/>
            <asp:Button ID="btnNewAuction" runat="server" Text="New Auction" OnClick="btnNewAuction_Click" class="btn-outline-secondary btn-block"/>
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
