<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="editTicket.aspx.cs" Inherits="Lab2.editTicket" EnableEventValidation="false" %>

<%--Kirsi And Josh Coleman 2/15/21--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-around">
        <div class=" col-5">
            <asp:LinkButton ID="lnkButtonReturn" PostBackUrl="customerProfile.aspx" runat="server">Back to Customer</asp:LinkButton>
            <div class="card" id="serviceCard">
                <div class="card-header">
                    Initial Service Details
                </div>

                <div class="card-body">
                    <asp:DetailsView
                        ID="dvServiceDetails"
                        DataKeyNames="serviceID"
                        DataSourceID="srcServiceData"
                        AutoGenerateEditButton="true"
                        AutoGenerateRows="false"
                        DefaultMode="ReadOnly"
                        class="table table-bordered table-condensed"
                        runat="server">
                        <Fields>
                            <asp:TemplateField HeaderText="Service Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : "Auction"%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Service Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblServiceOpenDate" runat="server" Text='<%#Bind("serviceOpenDate")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#(Eval("serviceStatus").ToString()) == "True" ? "Active" : "Inactive"%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Deadline">
                                <ItemTemplate>
                                    <asp:Label ID="lbldeadLineStart" runat="server" Text='<%#Bind("serviceDeadlineStart")%>'></asp:Label>
                                    - 
                                    <asp:Label ID="lbldeadlineEnd" runat="server" Text='<%#Bind("serviceDeadlineEnd")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="form-group col-6">
                                        <asp:TextBox ID="txtAuctionStartDate" runat="server" Text='<%#Bind("serviceDeadlineStart")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvStartDateAuction" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAuctionStartDate"
                                            Text="Please Select a Start Date" ValidationGroup="CreateCustomer">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group col-6">
                                        <asp:TextBox ID="txtAuctionEndDate" runat="server" Text='<%#Bind("serviceDeadlineEnd")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                                    </div>
                                </EditItemTemplate>
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
                        ID="srcServiceData"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT * from Service WHERE SERVICE.serviceID = @serviceID"
                        runat="server">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:GridView
                        ID="gvServiceAddresses"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="true"
                        AutoGenerateDeleteButton="true"
                        AutoGenerateInsertButton="true"
                        runat="server"
                        DataKeyNames="addressID"
                        DataSourceID="srcServiceAddresses"
                        class="table table-bordered table-condensed">
                        <Columns>
                            <asp:TemplateField HeaderText="Address">
                                <EditItemTemplate>
                                    <div class="form-group">
                                    <asp:DropDownList ID="ddlAddressType" runat="server" class="form-control">
                                        <asp:ListItem Text="Pick Up" Value="P"></asp:ListItem>
                                        <asp:ListItem Text="Drop Off" Value="D"></asp:ListItem>
                                    </asp:DropDownList>
                                        </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("streetAddress") %>' class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                                            Text="Please Enter An Address.">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-md-5">
                                            <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>' class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                                Text="Please Enter A City.">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-md-3">
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
                                    <asp:Label ID="addressType" runat="server" Text='<%# (Eval("addressType").ToString() == "P") ? "Pick Up Location" : "Drop Off" %>'></asp:Label>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                    <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <table class="table-bordered table-condensed">
                        <tbody>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="btnInsertAddress" OnClick="btnNewAddress_Click" runat="server">Add Address</asp:LinkButton>
                                </td>

                                <td>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlAddressType" runat="server" class="form-control">
                                            <asp:ListItem Text="Pick Up" Value="P"></asp:ListItem>
                                            <asp:ListItem Text="Drop Off" Value="D"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <asp:TextBox ID="txtAddress" runat="server" Placeholder="Address" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAddress"
                                            Text="Please Enter An Address.">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtCity" runat="server" Placeholder="City" class="form-control"></asp:TextBox>
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
                                            <asp:TextBox ID="txtZipCode" runat="server" PlaceHolder="Zip" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                                Text="Please Enter Zip Code.">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <asp:SqlDataSource
                        ID="srcServiceAddresses"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT ADDRESSES.addressID, ADDRESSES.streetAddress, ADDRESSES.city, ADDRESSES.state, ADDRESSES.zipcode, ADDRESSES.addressType, ADDRESSES.serviceID
                                    FROM ADDRESSES WHERE ADDRESSES.serviceID = @serviceID"
                        UpdateCommand="UPDATE ADDRESSES SET streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode where addressID=@addressID"
                        InsertCommand="INSERT into ADDRESSES(streetAddress, city, state, zipcode, addressType, serviceID) VALUES(@streetAddress, @city, @state, @zipcode,@addressType,@serviceID)"
                        DeleteCommand="Delete from Addresses WHERE addressID = @addressID"
                        runat="server">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:ControlParameter Name="streetAddress" ControlID="txtAddress" Type="String" />
                            <asp:ControlParameter Name="city" ControlID="txtCity" Type="String" />
                            <asp:ControlParameter Name="state" ControlID="ddlState" Type="String" />
                            <asp:ControlParameter Name="zipcode" ControlID="txtZipCode" />
                            <asp:ControlParameter Name="addressType" ControlID="ddlAddressType" Type="String" />
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>

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
                            <asp:GridView
                                ID="gvNotes"
                                DataSourceID="srcNotes"
                                AutoGenerateColumns="false"
                                DataKeyNames="ticketID"
                                OnRowDataBound="gvNotes_RowDataBound"
                                OnSelectedIndexChanged="gvNotes_SelectedIndexChanged"
                                runat="server"
                                class="table table-bordered table-condensed table-hover">
                                <Columns>
                                    <asp:BoundField DataField="CreationDate" HeaderText="Creation Date" />
                                    <asp:BoundField DataField="CreatedBy" HeaderText="Created By" />
                                    <asp:BoundField DataField="NoteTitle" HeaderText="Note Title" />
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource
                                ID="srcNotes"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="SELECT TicketNote.ticketID, TICKETNOTE.creationDate as 'CreationDate', EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as 'CreatedBy', TICKETNOTE.noteTitle as 'NoteTitle' 
                            FROM TICKETNOTE INNER JOIN EMPLOYEE on TICKETNOTE.noteCreator = EMPLOYEE.employeeID WHERE TICKETNOTE.serviceID = @serviceID order by TICKETNOTE.creationDate desc"
                                runat="server">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Button ID="btnNewNote" runat="server" Text="Add Note" OnClick="btnNewNote_Click" Class="btn btn-outline-secondary" />
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
            <div class="card">
                <div class="card-header">
                    <asp:Label ID="lblWorkflow" Text="Service Workers" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <div class="card-body">
                    <asp:GridView
                        ID="gvAssignmnets"
                        DataSourceID="srcAssignments"
                        runat="server"
                        class="table table-bordered table-condensed">
                    </asp:GridView>

                    <asp:SqlDataSource
                        ID="srcAssignments"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT EMPLOYEE.firstName as 'First Name', EMPLOYEE.lastName as 'Last Name', ASSIGNMENT.startDate 'Start Date', ASSIGNMENT.employeeRole as 'Role' FROM ASSIGNMENT INNER JOIN
                  EMPLOYEE ON ASSIGNMENT.employeeID = EMPLOYEE.employeeID WHERE ASSIGNMENT.serviceID = @serviceID"
                        runat="server">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
