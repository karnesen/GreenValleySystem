<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="customerProfile.aspx.cs" Inherits="GreenValleySystem.customerProfile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container">
        <div class="row">
            <div class="card-body col-8">
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
                                <div class="form-row">
                                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("firstName") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName"
                                        Text="Please Enter A First Name.">
                                    </asp:RequiredFieldValidator>
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
                                    <div class="col-md-9">
                                        <asp:TextBox ID="txtphoneNumber" runat="server" class="form-control phone_us" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhoneNumber"
                                            Text="Please Enter A Phone Number.">
                                        </asp:RequiredFieldValidator>
                                        <br />
                                        <asp:TextBox ID="txtAltPhoneNumber" runat="server" class="form-control phone_us" Text='<%# Bind("altPhoneNumber") %>'></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlPhoneNumberType" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("phoneType") %>'>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Home</asp:ListItem>
                                            <asp:ListItem>Cell</asp:ListItem>
                                            <asp:ListItem>Work</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="rfvPhoneType" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlPhoneNumberType"
                                            Text="Please Select Phone Type.">
                                        </asp:RequiredFieldValidator>

                                        <asp:DropDownList ID="ddlPhoneNumberType2" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("phoneType2") %>'>
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Home</asp:ListItem>
                                            <asp:ListItem>Cell</asp:ListItem>
                                            <asp:ListItem>Work</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                                <asp:Label ID="lblPhoneType" runat="server" Text='<%# Bind("phoneType") %>'></asp:Label>
                                <br />
                                <asp:Label ID="lbllblPhoneNumber2" runat="server" Text='<%# Bind("altPhoneNumber") %>'></asp:Label>
                                <asp:Label ID="lblPhoneType2" runat="server" Text='<%# Bind("phoneType2") %>'></asp:Label>
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

                        <asp:TemplateField HeaderText="Preferred Contact">
                            <ItemTemplate>
                                <asp:Label ID="lblHomePref" runat="server" Text='<%# (Eval("prefHome").ToString() == "True") ? "Home " : ""  %>'></asp:Label>
                                <asp:Label ID="lblMobilePref" runat="server" Text='<%# (Eval("prefMobile").ToString() == "True") ? "Mobile " : ""  %>'></asp:Label>
                                <asp:Label ID="lblEmailPref" runat="server" Text='<%# (Eval("prefEmail").ToString() == "True") ? "Email " : ""  %>'></asp:Label>
                                <asp:Label ID="lblTextPref" runat="server" Text='<%# (Eval("prefText").ToString() == "True") ? "Text " : ""  %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="row form-group justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chHome" Text="Home" Checked='<%# Bind("prefHome") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chMobile" Text="Mobile" Checked='<%# Bind("prefMobile") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chText" Text="Text" Checked='<%# Bind("prefText") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chEmail" Text="Email" Checked='<%# Bind("prefEmail") %>' runat="server" />
                                </div>
                            </div>
                            </EditItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("streetAddress") %>' class="form-control"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                                        Text="Please Enter An Address.">
                                    </asp:RequiredFieldValidator>--%>
                                </div>

                                <div class="row form-group">
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>' class="form-control"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                            Text="Please Enter A City.">
                                        </asp:RequiredFieldValidator>--%>
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
                                        <%--<asp:RequiredFieldValidator ID="rfvState" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlState"
                                            Text="Please Select A State.">
                                        </asp:RequiredFieldValidator>--%>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("zipcode") %>' class="form-control"></asp:TextBox>
                                        <%--<asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                            Text="Please Enter Zip Code.">
                                        </asp:RequiredFieldValidator>--%>
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

                            <EditItemTemplate>
                                <asp:TextBox ID="txtHearAbout" runat="server" Text='<%# Bind("hearAbout") %>' class="form-control"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Initial Contact Date">
                            <ItemTemplate>
                                <asp:Label ID="lblInitialContactDate" runat="server"
                                    Text='<%# (DateTime.Parse(Eval("initialContactDate").ToString())).ToString("MM/dd/yyyy HH:mm") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Updated" ControlStyle-Font-Italic="true">
                            <ItemTemplate>
                                <asp:Label ID="lblLastUpdated" runat="server" Font-Italic="true"
                                    Text='<%# (DateTime.Parse(Eval("lastUpdated").ToString())).ToString("MM/dd/yyyy HH:mm") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                </asp:DetailsView>

                <asp:SqlDataSource
                    ID="srcCustomer"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from Customer where customerID =  @selectedCustomer"
                    UpdateCommand="Update Customer SET firstName = @firstName, lastName=@lastName, phoneNumber=@phoneNumber, phoneType=@phoneType, altPhoneNumber=@altPhoneNumber, phoneType2=@phoneType2, email=@email, 
                    prefMobile=@prefMobile, prefHome=@prefHome, prefText=@prefText, prefEmail=@prefEmail,
                    streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode, hearAbout=@hearAbout,
                    lastUpdated=getDate() where customerID=@selectedCustomer">
                    <SelectParameters>
                        <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div class="col-4">
         

                <div class="card mb-2">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs pull-right" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="notes-tab" data-toggle="tab" href="#note" role="tab" aria-controls="Notes" aria-selected="true">Notes</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="newNote-tab" data-toggle="tab" href="#newNote" role="tab" aria-controls="newNotes" aria-selected="false">New Note</a>
                            </li>
                        </ul>
                    </div>

                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="note" role="tabpanel" aria-labelledby="notes-tab">
                                <asp:ListView
                                    ID="lvNotes"
                                    runat="server"
                                    DataSourceID="srcNotes"
                                    DataKeyNames="ticketID"
                                    OnPagePropertiesChanging="lvNotes_PagePropertiesChanging">
                                    <LayoutTemplate>
                                        <div runat="server" id="lstProducts">
                                            <div runat="server" id="itemPlaceholder" />
                                        </div>
                                        <asp:DataPager runat="server" PageSize="3" ID="dataPager">
                                            <Fields>
                                                <asp:NumericPagerField />
                                            </Fields>
                                        </asp:DataPager>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lnkNote" Text='<%#Eval("NoteTitle")%>' NavigateUrl='<%# "noteDetails.aspx?num=" + Eval("ticketID")%>' runat="server">HyperLink</asp:HyperLink>
                                        </br>
                                    <asp:Label ID="noteText" runat="server" Text='<%# (Eval("noteText").ToString().Length>=200) ? Eval("noteText").ToString().Substring(0,100) + "..." : Eval("noteText") %>'></asp:Label>
                                        </br>
                                    <asp:Label ID="lblCreatedBy" runat="server" Font-Italic="true" Text=' <%#"Created by " + Eval("CreatedBy") + " on " + Eval("CreationDate") %>'></asp:Label>
                                        </br>
                                    </br>

                                    </ItemTemplate>
                                </asp:ListView>


                                <asp:SqlDataSource
                                    ID="srcNotes"
                                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                                    SelectCommand="SELECT TicketNote.ticketID, FORMAT(TICKETNOTE.creationDate, 'MM-dd-yy') as 'CreationDate', TICKETNOTE.noteText, EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as 'CreatedBy', TICKETNOTE.noteTitle as 'NoteTitle' 
                            FROM TICKETNOTE INNER JOIN EMPLOYEE on TICKETNOTE.noteCreator = EMPLOYEE.employeeID Left Join service on ticketNote.serviceID = service.serviceID WHERE TicketNote.customerID = @selectedCustomer OR service.customerID = @selectedCustomer 
                                order by TICKETNOTE.creationDate desc"
                                    runat="server">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="tab-pane fade" id="newNote" role="tabpanel" aria-labelledby="newNote-tab">
                                <div class=" form-group">
                                    <asp:TextBox ID="txtNoteTitle" runat="server" Placeholder="Note Title" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNoteTitle" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="newNote" ControlToValidate="txtNoteTitle" Text="Please create a title."></asp:RequiredFieldValidator>

                                    <asp:TextBox ID="txtNoteBody" runat="server" TextMode="MultiLine" Placeholder="Note Body" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvNoteBody" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="newNote" ControlToValidate="txtNoteBody" Text="Please enter note body."></asp:RequiredFieldValidator>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnCreateNote" runat="server" Text="Create" OnClick="btnCreateNote_Click" ValidationGroup="newNote" class="btn btn-outline-secondary" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <asp:Button ID="btnNewMove" runat="server" Text="New Move" OnClick="btnNewMove_Click" class="btn btn-primary btn-block" />
                <asp:Button ID="btnNewAuction" runat="server" Text="New Auction" OnClick="btnNewAuction_Click" class="btn btn-primary btn-block" />
                <br />

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
                <asp:TemplateField HeaderText="Progress"></asp:TemplateField>
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
    </div>
</asp:Content>
