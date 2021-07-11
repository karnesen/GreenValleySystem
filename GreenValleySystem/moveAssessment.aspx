﻿<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="moveAssessment.aspx.cs" Inherits="GreenValleySystem.moveAssessment" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card mb-2">
        <div class="card-header">
            <div class="text-center h5">
            Assessment Form
                </div>
            <ul class="nav nav-tabs card-header-tabs pull-right" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class='<%=stateNav1 %>' id="pre-tab" data-toggle="tab" href="#prelim" role="tab" aria-controls="prelim" aria-selected="true">Preliminary</a>
                </li>
                <li class="nav-item">
                    <a class='<%=stateNav2 %>' id="assess-tab" data-toggle="tab" href="#assessment" role="tab" aria-controls="assessment" aria-selected="false">Assessment</a>
                </li>
                <li class="nav-item">
                    <a class='<%=stateNav3 %>' id="rooms-tab" data-toggle="tab" href="#rooms" role="tab" aria-controls="rooms" aria-selected="false">Room Details</a>
                </li>
                <li class="nav-item">
                    <a class='<%=stateNav4 %>' id="handout-tab" data-toggle="tab" href="#handout" role="tab" aria-controls="handout" aria-selected="false">Hand-Out</a>
                </li>
            </ul>
        </div>


        <div class="card-body">
            <div class="tab-content" id="myTabContent">

                <%-- Preliminary Move Assessment Information --%>
                <div class='<%=stateTab1 %>' id="prelim" role="tabpanel" aria-labelledby="pre-tab">
                    <asp:FormView
                        ID="fvPreMove"
                        runat="server"
                        DataSourceID="srcMoveDetails"
                        DefaultMode="Edit">

                        <EditItemTemplate>
                            Deadline
                            <div class="row">
                            <div class="form-group col">
                                <asp:TextBox ID="txtAuctionStartDate" runat="server" Text='<%#Bind("serviceDeadlineStart", "{0:yyyy-MM-ddTHH:mm}")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </div>
                            <div class="form-group col ">
                                <asp:TextBox ID="txtAuctionEndDate" runat="server" Text='<%#Bind("serviceDeadlineEnd", "{0:yyyy-MM-ddTHH:mm}")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </div>
                                </div>


                            <div class="form-check">
                                <asp:CheckBox ID="chMLS" Text="MLS Listing?" Checked='<%# Bind("mls") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chSendPhotos" Text="Send Photos?" Checked='<%# Bind("sendPhotos") %>' runat="server" />
                            </div>

                            <asp:Label ID="lblScheduled" for="chHome" runat="server" class="form-label" Text="Additional Services:"></asp:Label>
                            <div class="row form-group justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chPacking" Text="Packing" Checked='<%# Bind("packing") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chTrash" Text="Trash Removal" Checked='<%# Bind("trash") %>' runat="server" />

                                </div>
                            </div>
                            <asp:TextBox ID="txtTrash" Text='<%# Bind("trashDesc")%>' TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator 
	                            id="revEquipment"  
                                runat="server"
                                ControlToValidate="txtTrash" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                ErrorMessage="Invalid Input" 
                                ForeColor="Red">
                            </asp:regularexpressionvalidator>
                            <asp:LinkButton ID="lnkButtonSave" CommandName="Update"  runat="server" Class="btn btn-outline-primary">Save</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:FormView>

                    <%-- Addresses --%>
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
                                        <asp:RegularExpressionValidator 
                                            id="revEquipment"  
                                            runat="server"
                                            ValidationGroup="address"
                                            ControlToValidate="txtAddress" 
                                            ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                            ErrorMessage="Invalid Input"
                                            ForeColor="Red">
                                        </asp:regularexpressionvalidator>
                                    </div>

                                    <div class="form-group">
                                        <asp:TextBox ID="txtCity" runat="server" Text='<%# Bind("city") %>' class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                            Text="Please Enter A City.">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="cityValid"
                                            runat="server" 
                                            ValidationGroup="address"
                                            ErrorMessage="Only Spaces and letters are valid characters!"
                                            ControlToValidate="txtCity"
                                            ValidationExpression="[a-zA-Z ]*$"
                                            ForeColor="Red"></asp:RegularExpressionValidator>

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

                                        <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("zipcode") %>' class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                            Text="Please Enter Zip Code.">
                                        </asp:RequiredFieldValidator>
                                        <%--<asp:CompareValidator ID="zipCodeValidator" runat="server" ErrorMessage="Invalid Zipcode" 
                                                 ControlToValidate="txtZipCode" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>--%>
                                        <asp:RegularExpressionValidator runat="server"
                                            id="rexNumber"
                                            controltovalidate="txtZipCode"
                                            ValidationGroup="address"
                                            validationexpression="\d{5}(-\d{4})?"
                                            errormessage="Please enter a 5 digit zip code!" />
                                  <script>
                                      var num = document.getElementById('<%=txtZipCode.ClientID %>').value;
                                      if (num > 30 || num <= 0)
                                      {
                                          alert('Please Enter Value between 1 to 30');
                                          document.getElementById('<%=txtZipCode.ClientID %>').value = '';
                                          document.getElementById('<%=txtZipCode.ClientID %>').focus();
                                          return false;
                                      }
                                      return true;
                                  </script>
                                    </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="addressType" runat="server" Text='<%# (Eval("addressType").ToString() == "P") ? "Pick Up Location" : "Drop Off" %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                    <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

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

                    <asp:LinkButton ID="lnkButtonExpandAddress" href="#collapseAddress" data-toggle="collapse" aria-expanded="false" aria-controls="collapseAddress" runat="server">Add Address</asp:LinkButton>
                    <div class="collapse" id="collapseAddress">
                        <table class="table-borderless">
                            <tbody>
                                <tr>
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
                                                Text="Please Enter An Address." ValidationGroup="address">
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div class="form-group">
                                            <asp:TextBox ID="txtCity" runat="server" Placeholder="City" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCity"
                                                Text="Please Enter A City." ValidationGroup="address">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="cityValid"
                                                runat="server"
                                                ErrorMessage="Only Spaces and letters are valid characters!"
                                                ControlToValidate="txtCity"
                                                ValidationGroup="address"
                                                ValidationExpression="[a-zA-Z ]*$"
                                                ForeColor="Red"></asp:RegularExpressionValidator>


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
                                                Text="Please Select A State." ValidationGroup="address">
                                            </asp:RequiredFieldValidator>

                                            <asp:TextBox ID="txtZipCode" runat="server" PlaceHolder="Zip" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                                ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                                Text="Please Enter Zip Code." ValidationGroup="address">
                                            </asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="zipCodeValidator" runat="server" ErrorMessage="Invalid Zipcode" ValidationGroup="address" 
                                                 ControlToValidate="txtZipCode" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>

                                        </div>
                                        <asp:LinkButton ID="btnInsertAddress" OnClick="btnNewAddress_Click" runat="server" ValidationGroup="address">Commit</asp:LinkButton>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <asp:SqlDataSource
                        ID="srcMoveDetails"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="Select * from Service Inner Join moveAssessment on service.serviceID = moveAssessment.serviceID where service.serviceID = @serviceID"
                        UpdateCommand="Update service set serviceDeadlineStart=parse(@serviceDeadlineStart as dateTime), serviceDeadlineEnd=parse(@serviceDeadlineEnd as dateTime) where serviceID=@serviceID;
                        Update moveAssessment set
                        packing=@packing, trash=@trash, sendPhotos=@sendPhotos, trashDesc=@trashDesc, mls=@mls where serviceID=@serviceID ; ">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                <%-- Auction Assessment --%>
                <div class='<%=stateTab2 %>' id="assessment" role="tabpanel" aria-labelledby="assess-tab">
                    <asp:FormView
                        ID="fvAssessment"
                        DefaultMode="Edit"
                        DataSourceID="srcAssessment"
                        runat="server">
                        <EditItemTemplate>
                            <div class="form-group row justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chApt" Checked='<%# Bind("apartment")%>' Text="Apartment" runat="server" data-toggle="collapse" href="#collapseApt" role="button" aria-expanded="false" aria-controls="collapseApt" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chHouse" Checked='<%# Bind("house")%>' Text="House" runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chStorage" Checked='<%# Bind("storageUnit")%>' Text="Storage Unit" runat="server" data-toggle="collapse" href="#collapseStor" role="button" aria-expanded="false" aria-controls="collapseStor" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chBusiness" Checked='<%# Bind("business")%>' Text="Place of Business" runat="server" data-toggle="collapse" href="#collapseBus" role="button" aria-expanded="false" aria-controls="collapseBus" />
                                </div>
                            </div>
                            <%--Collapse Apartment--%>
                            <div class="collapse" id="collapseApt">
                                <div class="card card-body mb-2">
                                    <div class="form-group">
                                        <asp:Label ID="lblFloor" For="txtFloor" runat="server" Text="Floor Number"></asp:Label>
                                        <asp:TextBox ID="txtFloor" TextMode="Number" runat="server" Text='<%# Bind("floor")%>' class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-check">
                                            <asp:CheckBox ID="chElevator" Checked='<%# Bind("elevator")%>' Text="Elevator?" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblWalk" For="txtWalk" runat="server" Text="Walk from Elevator to Apartment"></asp:Label>
                                        <asp:TextBox ID="txtWalk" Text='<%# Bind("elevatorWalk")%>' runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                           <%-- Collapse Storage--%>
                            <div class="collapse" id="collapseStor">
                                <div class="card card-body mb-2">
                                    <asp:Label ID="lblStorage" runat="server" Text="Storage Units"></asp:Label>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chIndoor" Checked='<%# Bind("Indoor")%>' Text="Indoor" runat="server" />
                                    </div>
                                    <%--<a href="MoveRequest.aspx.cs">MoveRequest.aspx.cs</a>--%>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chOutdoor" Checked='<%# Bind("Outdoor")%>' Text="Outdoor" runat="server" />
                                    </div>
                                </div>
                            </div>

                            <div class="collapse" id="collapseBus">
                                <div class="card card-body mb-2">
                                    <asp:Label ID="lblBusiness" For="txtBusiness" runat="server" Text="Place of Business"></asp:Label>
                                    <asp:TextBox ID="txtBusiness" runat="server" Text='<%# Bind("businessText")%>' class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="card card-body mb-2">
                                <div class="form-group">
                                    <asp:Label ID="lblAccessability" for="txtAccessability" runat="server" Text="Truck Accessability"></asp:Label>
                                    <asp:TextBox ID="txtAccessability" TextMode="MultiLine" Text='<%# Bind("truckAccess")%>' runat="server" class="form-control"></asp:TextBox>
                                    <asp:RegularExpressionValidator 
	                                    id="revEquipment"  
                                        runat="server"
                                        ControlToValidate="txtAccessability" 
                                        ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                        ErrorMessage="Invalid Input" 
                                        ForeColor="Red">
                                    </asp:regularexpressionvalidator>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblFar" for="txtFarFromLoading" runat="server" Text="Distance from Loading Door"></asp:Label>
                                    <asp:TextBox ID="txtFarFromLoading" TextMode="MultiLine" Text='<%# Bind("howFar")%>' runat="server" class="form-control"></asp:TextBox>
                                    <%--<asp:RegularExpressionValidator 
	                                    id="RegularExpressionValidator1"  
                                        runat="server"
                                        ControlToValidate="txtFarFromLoading" 
                                        ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                        ErrorMessage="Invalid Input" 
                                        ForeColor="Red">
                                    </asp:regularexpressionvalidator>--%>
                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblSteps" for="txtSteps" runat="server" Text="Stairs"></asp:Label>
                                    <asp:TextBox ID="txtSteps" TextMode="Number" runat="server" Text='<%# Bind("steps")%>' class="form-control"></asp:TextBox>
                                </div>

                                <asp:Label ID="lblEquipment" runat="server" Text="Equipment Needed"></asp:Label>
                                <div class="row form-group justify-content-around">

                                    <div class="form-check">
                                        <asp:CheckBox ID="chCart" Checked='<%# Bind("appCart")%>' Text="Appliance Cart" runat="server" />
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chPianoDolly" Checked='<%# Bind("pianoDolly")%>' Text="Piano Dolly" runat="server" />
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chPianoBoard" Checked='<%# Bind("pianoBoard")%>' Text="Piano Board" runat="server" />
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chGun" Checked='<%# Bind("gunSafe")%>' Text="Gun Safe Cart" runat="server" />
                                    </div>
                                    <div class="form-check">
                                        <asp:CheckBox ID="chBlanket" Checked='<%# Bind("blankets")%>' Text="Extra Blankets" runat="server" />
                                    </div>
                                </div>
                            </div>

                            <asp:LinkButton ID="lnkButtonSave" CommandName="Update" OnClick="lnkButtonSave_Click" runat="server" Class="btn btn-outline-primary">Save</asp:LinkButton>

                        </EditItemTemplate>
                    </asp:FormView>

                    <asp:SqlDataSource
                        ID="srcAssessment"
                        runat="server"
                        SelectCommand="Select * from moveAssessment where serviceID=@serviceID"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        UpdateCommand="Update moveAssessment set
                            apartment=@apartment, floor=@floor, elevator=@elevator, elevatorWalk=@elevatorWalk, house=@house, storageUnit=@storageUnit, indoor=@indoor, outdoor=@outdoor,
                            business=@business, businessText=@businessText, truckAccess=@truckAccess, howFar=@howFar, steps=@steps, appCart=@appCart, pianoDolly=@pianoDolly,
                            pianoboard=@pianoboard, gunSafe=@gunSafe, blankets=@blankets
                            where serviceID=@serviceID">
                        <UpdateParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <%-- Assign Trucks --%>
                    <div class="card card-body">
                        <div class="row">
                            <div class="col">
                                <asp:DropDownList
                                    ID="ddlTrucks"
                                    runat="server"
                                    class="form-control"
                                    DataSourceID="srcAllTrucks"
                                    DataTextField="equipmentType"
                                    DataValueField="equipmentID">
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <asp:Button ID="btnEquipment" runat="server" Text="Add" OnClick="btnEquipment_Click" class="btn btn-primary"/>
                            </div>
                        </div>
                        <asp:SqlDataSource
                            ID="srcAllTrucks"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Connect %>"
                            SelectCommand="Select * from Equipment where active=1"></asp:SqlDataSource>

                        <div class="row col-6">
                            <asp:ListView
                                ID="lvTrucks"
                                runat="server"
                                DataKeyNames="equipmentID"
                                DataSourceID="srcTrucks">
                                <LayoutTemplate>
                                    <table class="table">
                                        <tbody>
                                            <tr id="itemPlaceholder" runat="server"></tr>
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTruck" runat="server" Text='<%# Bind("equipmentType") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"><i class="fas fa-times"></i></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>
                    </div>

                    <asp:SqlDataSource
                        ID="srcTrucks"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="Select * from utilizeEquipment Inner Join Equipment on utilizeEquipment.equipmentID = Equipment.equipmentID where serviceID=@serviceID"
                        InsertCommand="Insert into utilizeEquipment values(@equipmentId, @serviceID)"
                        DeleteCommand="Delete from utilizeEquipment where equipemntID=@equipmentID and serviceID=@serviceID">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            <asp:ControlParameter Name="equipmentID" ControlID="ddlTrucks" />
                        </InsertParameters>
                        <DeleteParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
                <div class='<%=stateTab3 %>' id="rooms" role="tabpanel" aria-labelledby="rooms-tab">
                    <ul class="list-group list-group-flush">

                        <%-- Living Room --%>
                        <asp:LinkButton ID="btnCollapseLivingRoom" runat="server" href="#collapseLivingRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseLivingRoom">
                            Living Room <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseLivingRoom">
                            <asp:FormView
                                ID="fvRooms"
                                runat="server"
                                DataSourceID="srcLivingRoom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveLiving" CommandName="Update" runat="server" class="mb-2" OnClick="btnSaveTab3_Click">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelLiving" runat="server" SelectedValue='<%# Bind("livingFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <div class="row mb-2">
                                        <div class="col">
                                            <asp:Label ID="lblSofa" runat="server" Text="Number of Sofas"></asp:Label>
                                            <asp:TextBox ID="txtSofa" Text='<%# Bind("couches") %>' TextMode="Number" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chLeatherSofa" Checked='<%# Bind("leatherCouch")%>' Text="Leather Sofas" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("livingSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("livingMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("livingLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("livingWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("livingArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcLivingRoom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set couches=@couches, leatherCouch=@leatherCouch, livingFloor=@livingFloor, 
                            livingSmallBoxes=@livingSmallBoxes, livingMedBoxes=@livingMedBoxes, livingLargeBoxes=@livingLargeBoxes,
                            livingWardrobeBoxes=@livingwardrobeboxes, livingartboxes=@livingartboxes 
                            where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <%-- Dining Room --%>
                        <asp:LinkButton ID="btnCollapseDining" runat="server" href="#collapseDiningRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseDiningRoom">
                            Dining Room <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseDiningRoom">
                            <asp:FormView
                                ID="fvDining"
                                runat="server"
                                DataSourceID="srcDiningRoom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveDining" CommandName="Update" runat="server" class="mb-2" OnClick="btnSaveTab3_Click">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelDining" runat="server" SelectedValue='<%# Bind("diningFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <div class="card card-body mb-2">
                                        <div class="form-check">
                                            <asp:CheckBox ID="chServer" Checked='<%# Bind("diningServer")%>' Text="Server" runat="server" />
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chSideboard" Checked='<%# Bind("sideBoard")%>' Text="Sideboard" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chHighValueServer" Checked='<%# Bind("highValueServer")%>' Text="High Value" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chMirrorBack" Checked='<%# Bind("mirrorBack")%>' Text="Mirror Back" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="CheckBox1" Checked='<%# Bind("marbleTop")%>' Text="Marble Top" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                     <div class="card card-body mb-2">
                                         <div class="form-check">
                                             <asp:CheckBox ID="chChina" Checked='<%# Bind("chinaPress")%>' Text="China Press" runat="server" />
                                         </div>
                                         <div class="row mb-2">
                                             <div class="col">
                                                 <div class="form-check">
                                                     <asp:CheckBox ID="chBowfront" Checked='<%# Bind("bowFront")%>' Text="Bow Front" runat="server" />
                                                 </div>
                                             </div>
                                             <div class="col">
                                                 <div class="form-check">
                                                     <asp:CheckBox ID="chChinaHighvalue" Checked='<%# Bind("chinaHighValue") %>' Text="High Value China" runat="server" />
                                                 </div>
                                             </div>
                                             <div class="col">
                                                 <div class="form-check">
                                                     <asp:CheckBox ID="chTwoPiece" Checked='<%# Bind("twoPiece")%>' Text="Two Piece" runat="server" />
                                                 </div>
                                             </div>
                                         </div>
                                     </div>

                                    <div class="card card-body mb-2">
                                        <div class="form-check">
                                            <asp:CheckBox ID="chTable" Checked='<%# Bind("diningTable")%>' Text="Table" runat="server" />
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:Label ID="lblLeaves" runat="server" Text="Leaves"></asp:Label>
                                                    <asp:TextBox ID="txtLeaves" runat="server" Text='<%# Bind("tableLeaves") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:Label ID="lblChairs" runat="server" Text="Chairs"></asp:Label>
                                                    <asp:TextBox ID="txtChairs" runat="server" Text='<%# Bind("tableChairs") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chDiningHighValue" Checked='<%# Bind("tableHighValue")%>' Text="High Value" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card card-body mb-2">
                                        <div class="form-check">
                                            <asp:CheckBox ID="chPedestal" Checked='<%# Bind("pedastalTable")%>' Text="Pedastal Table" runat="server" />
                                        </div>
                                    </div>
                                    <div class="card card-body mb-2">
                                        <div class="form-check col">
                                            <asp:CheckBox ID="chChest" Checked='<%# Bind("silverChest")%>' Text="Chest" runat="server" />
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <div class="form-check col">
                                                    <asp:CheckBox ID="chChestSilver" Checked='<%# Bind("silverChestHighValue")%>' Text="High Value" runat="server" />
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>

                                    <div class="card card-body mb-2">
                                        <div class="form-check col">
                                            <asp:CheckBox ID="chRug" Checked='<%# Bind("diningRug")%>' Text="Rug" runat="server" />
                                        </div>
                                    </div>

                                    <div class="card card-body mb-2">
                                        <div class="form-check col">
                                            <asp:CheckBox ID="chBreakfront" Checked='<%# Bind("diningBreakfront")%>' Text="Breakfront" runat="server" />
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chBreakfrontHigh" Checked='<%# Bind("breakfrontHighValue")%>' Text="High Value" runat="server" />
                                                </div>
                                            </div>
                                            
                                            <div class="form-check col">
                                                <asp:CheckBox ID="chBreakfrontTwoPiece" Checked='<%# Bind("breakfrontTwoPiece")%>' Text="Two Piece" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("diningSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("diningMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("diningLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("diningWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("diningArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcDiningRoom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                diningServer=@diningServer, sideBoard=@sideBoard, mirrorBack=@mirrorBack, highValueServer=@highValueServer, marbleTop=@marbleTop,
                                chinaPress=@chinaPress, bowfront=@bowfront, chinaHighValue=@chinaHighValue, twoPiece=@twoPiece, 
                                diningTable=@diningTable, tableLeaves=@tableLeaves, tableChairs=@tableChairs, tableHighValue=@tableHighValue, pedastalTable=@pedastalTable,
                                silverChest=silverChest, silverChestHighValue=@silverChestHighValue, diningRug=@diningRug, diningBreakfront=@diningBreakfront,
                                BreakfrontHighValue=BreakfrontHighValue, breakfrontTwoPiece=@breakfrontTwoPiece, diningFloor=@diningFloor, 
                                diningSmallBoxes=@diningSmallBoxes, diningMedBoxes=@diningMedBoxes, diningLargeBoxes=@diningLargeBoxes,
                            diningWardrobeBoxes=@diningwardrobeboxes, diningartboxes=@diningartboxes 
                            where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnCollapseKitchen" runat="server" href="#collapseKitchenRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseKitchenRoom">
                            Kitchen <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseKitchenRoom">
                            <asp:FormView
                                ID="fvKitchen"
                                runat="server"
                                DataSourceID="srcKitchenRoom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveKitchen" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelKitchen" runat="server" SelectedValue='<%# Bind("kitFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("kitSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("kitMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("kitLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("kitWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("kitArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcKitchenRoom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                kitFloor=@kitFloor, kitSmallBoxes=@kitSmallBoxes, kitMedBoxes=@kitMedBoxes, kitLargeBoxes=@kitLargeBoxes,
                                kitWardrobeBoxes=@kitwardrobeboxes, kitartboxes=@kitartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnCollapseDen" runat="server" href="#collapseDenRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseDenRoom">
                            Den <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseDenRoom">
                            <asp:FormView
                                ID="fvDen"
                                runat="server"
                                DataSourceID="srcDen"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveDen" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelDen" runat="server" SelectedValue='<%# Bind("denFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <div class="row mb-2">
                                        <div class="col">
                                            <asp:Label ID="lblSofaDen" runat="server" Text="Number of Sofas"></asp:Label>
                                            <asp:TextBox ID="txtSofaDen" Text='<%# Bind("denSofas") %>' TextMode="Number" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chLeatherSofaDen" Checked='<%# Bind("denleatherSofa")%>' Text="Leather Sofas" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("denSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("denMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("denLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("denWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("denArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcDen"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                denSofas=@denSofas, denLeatherSofa=@denLeatherSofa,
                                 denFloor=@denFloor, denSmallBoxes=@denSmallBoxes, denMedBoxes=@denMedBoxes, denLargeBoxes=@denLargeBoxes,
                                denWardrobeBoxes=@denwardrobeboxes, denartboxes=@denartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnOfficeCollapse" runat="server" href="#collapseOfficeRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseOfficeRoom">
                            Office <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseOfficeRoom">
                            <asp:FormView
                                ID="fvOffice"
                                runat="server"
                                DataSourceID="srcOffice"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveOffice" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelLiving" runat="server" SelectedValue='<%# Bind("officeFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("officeSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("officeMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("officeLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("officeWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("officeArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcOffice"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                officeFloor=@officeFloor, officeSmallBoxes=@officeSmallBoxes, officeMedBoxes=@officeMedBoxes, officeLargeBoxes=@officeLargeBoxes,
                                officeWardrobeBoxes=@officewardrobeboxes, officeartboxes=@officeartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnBedrooms" runat="server" href="#collapseBedRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseBedRoom">
                            Bedrooms <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseBedRoom">
                            <asp:FormView
                                ID="fvBedroom"
                                runat="server"
                                DataSourceID="srcBedroom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveOffice" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelBedroom" runat="server" SelectedValue='<%# Bind("bedFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("bedSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("bedMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("bedLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("bedWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("bedArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcBedroom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                bedFloor=@bedFloor, bedSmallBoxes=@bedSmallBoxes, bedMedBoxes=@bedMedBoxes, bedLargeBoxes=@bedLargeBoxes,
                                bedWardrobeBoxes=@bedwardrobeboxes, bedartboxes=@bedartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnAttic" runat="server" href="#collapseAtticRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseAtticRoom">
                            Attic <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseAtticRoom">
                            <asp:FormView
                                ID="fvAttic"
                                runat="server"
                                DataSourceID="srcAttic"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveOffice" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelBedroom" runat="server" SelectedValue='<%# Bind("atticFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <div class="form-check">
                                        <asp:CheckBox ID="chSteps" Checked='<%# Bind("pullDownSteps")%>' Text="Pull Down Steps" runat="server" />
                                    </div>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("atticSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("atticMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("atticLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("atticWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("atticArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcAttic"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set pullDownSteps=@pullDownSteps,
                                atticFloor=@atticFloor, atticSmallBoxes=@atticSmallBoxes, atticMedBoxes=@atticMedBoxes, atticLargeBoxes=@atticLargeBoxes,
                                atticWardrobeBoxes=@atticwardrobeboxes, atticartboxes=@atticartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnBasement" runat="server" href="#collapseBasementRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseBasementRoom">
                            Basement <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseBasementRoom">
                            <asp:FormView
                                ID="fvBasement"
                                runat="server"
                                DataSourceID="srcBasement"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveBasement" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelBasement" runat="server" SelectedValue='<%# Bind("baseFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <div class="row mb-2">
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chEntrance" Checked='<%# Bind("outsideEntrance")%>' Text="Outside Entrance" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chtruckToDoor" Checked='<%# Bind("truckToDoor")%>' Text="Truck to Door?" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("baseSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("baseMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("baseLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("baseWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("baseArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>

                            <asp:SqlDataSource
                                ID="srcBasement"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set outsideEntrance=@outsideEntrance, truckToDoor=@truckToDoor,
                                baseFloor=@baseFloor, baseSmallBoxes=@baseSmallBoxes, baseMedBoxes=@baseMedBoxes, baseLargeBoxes=@baseLargeBoxes,
                                baseWardrobeBoxes=@basewardrobeboxes, baseartboxes=@baseartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnGarageCollapse" runat="server" href="#collapseGarageRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseGarageRoom">
                            Garage <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseGarageRoom">
                            <asp:FormView
                                ID="fvGarage"
                                runat="server"
                                DataSourceID="srcGarage"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSaveGarage" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelBasement" runat="server" SelectedValue='<%# Bind("garageFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("garageSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("garageMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("garageLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("garageWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("garageArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource
                                ID="srcGarage"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                garageFloor=@garageFloor, garageSmallBoxes=@garageSmallBoxes, garageMedBoxes=@garageMedBoxes, garageLargeBoxes=@garageLargeBoxes,
                                garageWardrobeBoxes=@garagewardrobeboxes, garageartboxes=@garageartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnPatioCollapse" runat="server" href="#collapsePatioRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapsePatioRoom">
                            Patio <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapsePatioRoom">
                            <asp:FormView
                                ID="fvPatio"
                                runat="server"
                                DataSourceID="srcPatio"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSavePatio" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelPatio" runat="server" SelectedValue='<%# Bind("patioFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("patioSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("patioMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("patioLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("patioWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("patioArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource
                                ID="srcPatio"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                patioFloor=@patioFloor, patioSmallBoxes=@patioSmallBoxes, patioMedBoxes=@patioMedBoxes, patioLargeBoxes=@patioLargeBoxes,
                                patioWardrobeBoxes=@patiowardrobeboxes, patioartboxes=@patioartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </li>

                        <asp:LinkButton ID="btnOut" runat="server" href="#collapseOutRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseOutRoom">
                            Outbuilding <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseOutRoom">
                            <asp:FormView
                                ID="fvOutBuilding"
                                runat="server"
                                DataSourceID="srcOut"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnSavePatio" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                    <asp:DropDownList ID="ddlLevelPatio" runat="server" SelectedValue='<%# Bind("outBuildingsFloor") %>' class="form-control mb-2">
                                        <asp:ListItem Text="Ground Floor" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="2nd Floor" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3rd Floor" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="Basement" Value="0"></asp:ListItem>
                                    </asp:DropDownList>

                                     <div class="row mb-2">
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chRidingMower" Checked='<%# Bind("ridingMower")%>' Text="Riding Mower" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chPushMower" Checked='<%# Bind("pushMower")%>' Text="Push Mower" runat="server" />
                                            </div>
                                        </div>
                                         <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chLargeTools" Checked='<%# Bind("largeTools")%>' Text="Large Tools" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("outBuildingsSmallBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Medium Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtMed" runat="server" Text='<%# Bind("outBuildingsMedBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("outBuildingsLargeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobe" runat="server" Text='<%# Bind("outBuildingsWardrobeBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Art Boxes</td>
                                                <td>
                                                    <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("outBuildingsArtBoxes") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </EditItemTemplate>
                            </asp:FormView>



      
         

                            <asp:SqlDataSource
                                ID="srcOut"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from moveRooms where serviceID=@serviceID"
                                UpdateCommand="Update moveRooms set 
                                outBuildingsFloor=@outBuildingsFloor, outBuildingsSmallBoxes=@outBuildingsSmallBoxes, outBuildingsMedBoxes=@outBuildingsMedBoxes, outBuildingsLargeBoxes=@outBuildingsLargeBoxes,
                                outBuildingsWardrobeBoxes=@outBuildingswardrobeboxes, outBuildingsartboxes=@outBuildingsartboxes 
                                where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>


                        </li>


                    </ul>
                </div>

          
            
            <div class='<%=stateTab4 %>' id="handout" role="tabpanel" aria-labelledby="assess-tab" style="overflow:scroll">
               <h2>Service Order Handout</h2>
                 


                <iframe width="1200" height="720" frameborder="0" scrolling="no" src="https://onedrive.live.com/embed?resid=59E05D1707FDE604%217226&authkey=%21AAatTR3VpdmyJrA&em=2&wdAllowInteractivity=False&AllowTyping=True&Item=cubeSheet.calc&wdHideGridlines=True&wdDownloadButton=True&wdInConfigurator=True"></iframe>

                
                 <%--<asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" class="btn btn-primary" CausesValidation="false"/>
           
                <asp:GridView
                ID="gvHandout"
                runat="server"
                DataKeyNames="serviceID"
                DataSourceID="srcOut"
                AutoGenerateColumns="true"
                
                class="table table-bordered table-condensed table-hover"
                AllowPaging="false"
              
                PageSize="5"
                AllowSorting="true"
                OnSorted="btnHandout_Click">
                <HeaderStyle BackColor="#266141" ForeColor="White" />
                <Columns>                </Columns>
           
                    </asp:GridView>--%>

              
            </div>
        </div>

        </div>
    </div>
</asp:Content>
