<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="customerProfile.aspx.cs" Inherits="GreenValleySystem.customerProfile" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container">
        <div class="row mb-2">
            <div class="col-7 mb-2">
                <div class="card card-body">
                    <asp:FormView
                        ID="fvCustomer"
                        runat="server"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCustomer">
                        <ItemTemplate>
                            <ul class="list-group list-group-flush">
                                <div class="text-center">
                                    <asp:Label ID="lblFirstName" runat="server" Class="h2"
                                        Text='<%# Eval("firstName") + " " %>'></asp:Label>

                                    <asp:Label ID="lblLastName" runat="server" Class="h2"
                                        Text='<%# Bind("lastName") %>'></asp:Label>
                                </div>

                                <li class="list-group-item">
                                    <h5>Contact Information</h5>
                                    <div class="row">
                                        <div class="col">
                                            <i class="fas fa-phone"></i>
                                            <asp:Label ID="lblPhoneType" runat="server" Text='<%# Bind("phoneType") %>'></asp:Label>
                                            <br />
                                            <a href="tel:<%#Eval("phoneNumber") %>"><asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label></a>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="col">
                                            <i class="fas fa-phone"></i>
                                            <asp:Label ID="lblPhoneType2" runat="server" Text='<%# Bind("phoneType2") %>'></asp:Label>
                                            <br />
                                            <a href="tel:<%#Eval("altPhoneNumber") %>"><asp:Label ID="lbllblPhoneNumber2" runat="server" Text='<%# Bind("altPhoneNumber") %>'></asp:Label></a>
                                            <br />
                                            <br />
                                        </div>
                                    </div>




                                 <a href="mailto:<%#Eval("email") %>"><i class="fas fa-envelope-square" runat="server"></i>
                                    <asp:Label ID="lblEmail" runat="server"
                                        Text='<%# Bind("email") %>'></asp:Label></a>

                                    
                                   

                                    <br />
                                    <br />
                                    Contact Preferences: 
                                <asp:Label ID="lblHomePref" runat="server" Text='<%# (Eval("prefHome").ToString() == "True") ? "Home " : ""  %>'></asp:Label>
                                    <asp:Label ID="lblMobilePref" runat="server" Text='<%# (Eval("prefMobile").ToString() == "True") ? "Mobile " : ""  %>'></asp:Label>
                                    <asp:Label ID="lblEmailPref" runat="server" Text='<%# (Eval("prefEmail").ToString() == "True") ? "Email " : ""  %>'></asp:Label>
                                    <asp:Label ID="lblTextPref" runat="server" Text='<%# (Eval("prefText").ToString() == "True") ? "Text " : ""  %>'></asp:Label>
                                </li>

                                <li class="list-group-item">
                                    <h5>Customer Address</h5>


                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>, 
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                    <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>

                                    <br />

                                    <asp:Button ID="btnMap" runat="server" Text="Verify Address" OnClick="btnMap_Click" class="btn btn-primary col-3" />

                              
                                
                                </li>

                                <asp:LinkButton ID="lnbtnMore" runat="server" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">More Information</asp:LinkButton>
                                <li class="list-group-item collapse" id="collapseExample">
                                    <table class="table table-borderless table-responsive">
                                        <tr>
                                            <td>
                                                <td>Initial Contact Type</td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblInitialContact" runat="server" Text='<%#Eval("initialContactType") %>'></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <td>Hear About Us</td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblHearAbout" runat="server" Text='<%# Eval("hearAbout") %>'></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <td>Initial Contact Date</td>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblInitialContactDate" runat="server" Text='<%#(DateTime.Parse(Eval("initialContactDate").ToString())).ToString("MM/dd/yyyy HH:mm") %>'></asp:Label>

                                            </td>
                                        </tr>
                                    </table>
                                </li>


                                <asp:Label ID="lblLastUpdated" runat="server" Font-Italic="true"
                                    Text='<%#"Last Updated " + (DateTime.Parse(Eval("lastUpdated").ToString())).ToString("MM/dd/yyyy HH:mm") %>'></asp:Label>
                                <asp:LinkButton ID="btnSave" CommandName="Edit" runat="server">Edit</asp:LinkButton>
                            </ul>

                        </ItemTemplate>
                        <EditItemTemplate>
                            <ul class="list-group list-group-flush">
                                <div class="row">
                                    <div class="col-6">
                                        <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("firstName") %>' class="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator 
	                                            id="RegularExpressionValidator4"  
                                                runat="server"
                                                ControlToValidate="txtFirstName" 
                                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                                ErrorMessage="Invalid Input" 
                                                ValidationGroup="CustomerProfile"
                                                ForeColor="Red">
                                            </asp:regularexpressionvalidator>
                                    </div>
                                    <div class="col-6">
                                        <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("lastName") %>' class="form-control"></asp:TextBox>
                                        <asp:RegularExpressionValidator 
	                                            id="RegularExpressionValidator3"  
                                                runat="server"
                                                ControlToValidate="txtLastName" 
                                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                                ErrorMessage="Invalid Input" 
                                                ValidationGroup="CustomerProfile"
                                                ForeColor="Red">
                                            </asp:regularexpressionvalidator>
                                    </div>
                                </div>

                                <li class="list-group-item">
                                    <h6>Contact Information</h6>

                                    <div class="row form-group">
                                        <div class="col-md-9">
                                            <asp:TextBox ID="txtphoneNumber" runat="server" class="form-control phone_us" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                                            <br />
                                            
                                            <asp:TextBox ID="txtAltPhoneNumber" runat="server" class="form-control phone_us" Text='<%# Bind("altPhoneNumber") %>'></asp:TextBox>
                                            </script>
                                            
                                        </div>
                                        <div class="col-md-3">

                                            <asp:DropDownList ID="ddlPhoneNumberType" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("phoneType") %>'>
                                                <asp:ListItem>--Please Select--</asp:ListItem>
                                                <asp:ListItem>Home</asp:ListItem>
                                                <asp:ListItem>Cell</asp:ListItem>
                                                <asp:ListItem>Work</asp:ListItem>
                                            </asp:DropDownList>
                                            <br />
                                            <asp:DropDownList ID="ddlPhoneNumberType2" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("phoneType2") %>'>
                                                <asp:ListItem>--Please Select--</asp:ListItem>
                                                <asp:ListItem>Home</asp:ListItem>
                                                <asp:ListItem>Cell</asp:ListItem>
                                                <asp:ListItem>Work</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' class="form-control" TextMode="Email" Placeholder="Email"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5"
                                        runat="server"
                                        ControlToValidate="txtEmail"
                                        ForeColor="Red"
                                        ValidationGroup="CustomerProfile"
                                        ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                        Display = "Dynamic"
                                        ErrorMessage = "Invalid email address"/>
                                    <br />

                                    Contact Preference
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
                                </li>

                                <li class="list-group-item">
                                    <h6>Customer Address</h6>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("streetAddress") %>' class="form-control" Placeholder="Address"></asp:TextBox>
                                        <asp:RegularExpressionValidator 
                                            id="revEquipment"  
                                            runat="server"
                                            ControlToValidate="txtAddress" 
                                            ValidationExpression="^[0-9A-Za-z ]+$"
                                            ErrorMessage="Invalid Input" 
                                            ValidationGroup="customerProfile"
                                            ForeColor="Red">
                                        </asp:regularexpressionvalidator>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>' class="form-control" Placeholder="City"></asp:TextBox>
                                            <asp:RegularExpressionValidator 
                                                id="RegularExpressionValidator1"  
                                                runat="server"
                                                ControlToValidate="txtCity" 
                                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                                ErrorMessage="Invalid Input" 

                                                ForeColor="Red">
                                        </asp:regularexpressionvalidator>
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
                                        </div>

                                        <div class="col-md-4">
                                            <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("zipcode") %>' class="form-control" Placeholder="Zip"></asp:TextBox>
                                            <asp:CompareValidator ID="zipCodeValidator" runat="server" ErrorMessage="Invalid Zipcode" ValidationGroup="CustomerProfile"
                                                ControlToValidate="txtZipCode" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                        </div>
                                    </div>
                                </li>

                                <li class="list-group-item">
                                    <asp:Label ID="lblInitialContact" runat="server"
                                        Text='<%# "Initial Contact Type: " + Eval("initialContactType") %>'></asp:Label>
                                    <br />
                                    <div class="row">
                                        <asp:TextBox ID="txtHearAbout" runat="server" Text='<%# Bind("hearAbout") %>' class="form-control" Placeholder="How did they hear about us?"></asp:TextBox>
                                        <asp:RegularExpressionValidator 
                                            id="RegularExpressionValidator2"  
                                            runat="server"
                                            ControlToValidate="txtHearAbout" 
                                            ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                            ErrorMessage="Invalid Input" 
                                            ForeColor="Red">
                                        </asp:regularexpressionvalidator>
                                    </div>
                                    <br />
                                    <asp:Label ID="lblInitialContactDate" runat="server" Text='<%# "Initial Contact Date: " + (DateTime.Parse(Eval("initialContactDate").ToString())).ToString("MM/dd/yyyy HH:mm") %>'></asp:Label>
                                </li>
                                <div class="row justify-content-around">
                                    <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server">Cancel</asp:LinkButton>
                                    <asp:LinkButton ID="btnSave" CommandName="Update" runat="server" ValidationGroup="CustomerProfile">Save</asp:LinkButton>
                                </div>
                            </ul>
                        </EditItemTemplate>
                    </asp:FormView>

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


            </div>

            <div class="col-5">

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
                                <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged" class="form-control">
                            <asp:ListItem Value="x">Show All</asp:ListItem>
                             <asp:ListItem Value="e">Personal</asp:ListItem>
                            <asp:ListItem Value="A">Auction</asp:ListItem>
                            <asp:ListItem Value="P">Appraisal</asp:ListItem>
                            <asp:ListItem Value="M">Move</asp:ListItem>
                           
                        </asp:DropDownList>
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
                                        <asp:LinkButton ID="lnkNote" Text='<%#Eval("NoteTitle")%>' runat="server" CommandName="Edit">LinkButton</asp:LinkButton>
                                        </br>
                                    <asp:Label ID="noteText" runat="server" Text='<%# (Eval("noteText").ToString().Length>=200) ? Eval("noteText").ToString().Substring(0,100) + "..." : Eval("noteText") %>'></asp:Label>
                                        </br>
                                    <asp:Label ID="lblCreatedBy" runat="server" Font-Italic="true" Text=' <%#"Created by " + Eval("CreatedBy") + " on " + Eval("CreationDate") %>'></asp:Label>
                                        </br>
                                    </br>

                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lnkNote" Text='<%#Bind("NoteTitle")%>' runat="server" data-toggle="modal" data-target="#exampleModal">LinkButton</asp:LinkButton>
                                        </br>
                                        <asp:TextBox ID="txtNoteText" runat="server" TextMode="MultiLine" Rows="5" Text='<%#Bind("noteText")%>' Class="form-control"></asp:TextBox>
                                        </br>
                                        <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                                        <br />
                                        <br />
                                    </EditItemTemplate>
                                </asp:ListView>


                                <asp:SqlDataSource
                                    ID="srcNotes"
                                    DataSourceMode="DataSet"
                                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                                    SelectCommand="SELECT TicketNote.ticketID, FORMAT(TICKETNOTE.creationDate, 'MM-dd-yy') as 'CreationDate', TICKETNOTE.noteText, EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as 'CreatedBy', TICKETNOTE.noteTitle as 'NoteTitle', service.serviceType
                            FROM TICKETNOTE INNER JOIN EMPLOYEE on TICKETNOTE.noteCreator = EMPLOYEE.employeeID Left Join service on ticketNote.serviceID = service.serviceID WHERE TicketNote.customerID = @selectedCustomer OR service.customerID = @selectedCustomer 
                                order by TICKETNOTE.creationDate desc"
                                    UpdateCommand="Update TicketNote set noteText=@noteText where ticketID=@ticketID"
                                    runat="server"
                                    FilterExpression="">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="tab-pane fade" id="newNote" role="tabpanel" aria-labelledby="newNote-tab">
                                <div class=" form-group">
                                    <%--<asp:TextBox ID="txtNoteTitle" runat="server" Placeholder="Note Title" class="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="txtNoteTitle" runat="server" Class="form-control">
                                        <asp:ListItem>Move</asp:ListItem>
                                        <asp:ListItem>Auction</asp:ListItem>
                                        <asp:ListItem>Consignment Shop</asp:ListItem>
                                        <asp:ListItem>Appraisal</asp:ListItem>
                                        <asp:ListItem>Personal</asp:ListItem>
                                        <asp:ListItem>Miscellaneous</asp:ListItem>
                                        <asp:ListItem>Storage</asp:ListItem>
                                    </asp:DropDownList>
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
                <asp:Button ID="btnNewAppraisal" runat="server" Text="New Appraisal" OnClick="btnNewAppraisal_Click" class="btn btn-primary btn-block" />
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
                        <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" :  Eval("serviceType").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="serviceOpenDate" HeaderText="Open Date" />

                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%#(Eval("serviceStatus").ToString()) == "True" ? "Active" : "Inactive"%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Progress">
                    <ItemTemplate>
                        <asp:Label ID="lblProgress" runat="server" Text='<%#(Eval("serviceEvent").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource
            ID="srcServices"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Connect %>"
            SelectCommand="Select serviceStatus, service.serviceType, FORMAT(serviceOpenDate, 'MM/dd/yy') as 'serviceOpenDate', service.serviceID, serviceEvent
                from Service inner join ServiceHistory on service.serviceID = servicehistory.serviceID
            inner join serviceEvents on serviceHistory.eventID=serviceEvents.eventID 
            where service.customerID=@selectedCustomer and 
			serviceHistory.stepID IN (select max(stepID) from serviceHistory inner join service on serviceHistory.serviceID=service.serviceID where service.customerID = @selectedCustomer group by service.serviceID)  
			order by serviceStatus desc, serviceOpenDate asc">
            <SelectParameters>
                <asp:SessionParameter Name="selectedCustomer" SessionField="selectedCustomer" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>



</asp:Content>
