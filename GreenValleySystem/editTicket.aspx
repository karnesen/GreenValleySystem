<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="editTicket.aspx.cs" Inherits="Lab2.editTicket" EnableEventValidation="false" %>

<%--Kirsi And Josh Coleman 2/15/21--%>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="row justify-content-around mb-3">
        <div class=" col-6">
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
                                    <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : Eval("serviceType").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Service Open Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblServiceOpenDate" runat="server" Text='<%#Eval("serviceOpenDate", "{0:d}")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%#(Eval("serviceStatus").ToString()) == "True" ? "Active" : "Inactive"%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Deadline">
                                <ItemTemplate>
                                    <asp:Label ID="lbldeadLineStart" runat="server" Text='<%#Eval("serviceDeadlineStart", "{0:d}")%>'></asp:Label>
                                    - 
                                    <asp:Label ID="lbldeadlineEnd" runat="server" Text='<%#Eval("serviceDeadlineEnd",  "{0:d}")%>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtAuctionStartDate" runat="server" Text='<%#Bind("serviceDeadlineStart", "{0:yyyy-MM-ddTHH:mm}")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>

                                    </div>

                                    <div class="form-group ">
                                        <asp:TextBox ID="txtAuctionEndDate" runat="server" Text='<%#Bind("serviceDeadlineEnd", "{0:yyyy-MM-ddTHH:mm}")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>

                        </Fields>
                    </asp:DetailsView>

                    <asp:SqlDataSource
                        ID="srcServiceData"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT * from Service WHERE SERVICE.serviceID = @serviceID"
                        UpdateCommand="Update service set serviceDeadlineStart=parse(@serviceDeadlineStart as dateTime), serviceDeadlineEnd=parse(@serviceDeadlineEnd as dateTime) where service.serviceID=@serviceID"
                        runat="server">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="card" id="addressCard">
                <div class="card-header">
                    Addresses
                </div>
                <div class="card-body">
                    <asp:GridView
                        ID="gvServiceAddresses"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="true"
                        AutoGenerateDeleteButton="true"
                        ShowHeader="false"
                        AutoGenerateInsertButton="true"
                        runat="server"
                        DataKeyNames="addressID"
                        DataSourceID="srcServiceAddresses"
                        class="table table-bordered table-condensed">
                        <Columns>
                            <asp:TemplateField>
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
                                            ControlToValidate="txtAddress" 
                                            ValidationExpression="^[0-9A-Za-z ]+$"
                                            ErrorMessage="Invalid Input" 
                                            ValidationGroup="address"
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
                                            Text="Please Select A State.">
                                        </asp:RequiredFieldValidator>

                                        <asp:TextBox ID="txtZipCode" runat="server" Text='<%# Bind("zipcode") %>' class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvZipCode" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZipCode"
                                            Text="Please Enter Zip Code.">
                                        </asp:RequiredFieldValidator>
                                        <%-- <asp:CompareValidator ID="zipCodeValidator" runat="server" ErrorMessage="Invalid Zipcode"
                                                 ControlToValidate="txtZipCode" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>--%>
                                        <asp:RegularExpressionValidator runat="server"
                                            ID="rexNumber"
                                            ControlToValidate="txtZipCode"
                                            ValidationGroup="address"
                                            ValidationExpression="\d{5}(-\d{4})?"
                                            ErrorMessage="Please enter a 5 digit zip code!" 
                                            ForeColor="Red"/>
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

                                        <h6>Location Details</h6>
                                        <asp:TextBox ID="txtAddressDetails" runat="server" Text='<%# Bind("details") %>' class="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>




                                    </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="addressType" Font-Bold="true" runat="server" Text='<%# (Eval("addressType").ToString() == "P") ? "Pick Up Location" : "Drop Off" %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>,
                                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                    <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
<%--                                    <asp:Button ID="btnAddress" onclick="btnAddress_Click" class="form-control-lg mr-2" runat="server" CausesValidation="true" Text="Verify"></asp:Button>--%>
                                    
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

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
                                            <asp:RegularExpressionValidator 
                                                id="revEquipment"  
                                                runat="server"
                                                ControlToValidate="txtAddress" 
                                                ValidationExpression="^[0-9A-Za-z ]+$" 
                                                ErrorMessage="Invalid Input" 
                                                ValidationGroup="address"
                                                ForeColor="Red">
                                        </asp:regularexpressionvalidator>

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
                                                ValidationExpression="[a-zA-Z ]*$"
                                                ValidationGroup="address"
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
                                            <%--<asp:CompareValidator ID="zipCodeValidator" runat="server" ErrorMessage="Invalid Zipcode" ValidationGroup="address" 
                                                 ControlToValidate="txtZipCode" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>--%>
                                            <asp:RegularExpressionValidator runat="server"
                                                ID="rexNumber"
                                                ControlToValidate="txtZipCode"
                                                ValidationExpression="\d{5}(-\d{4})?"
                                                ValidationGroup="address"
                                                ErrorMessage="Please enter a 5 digit zip code!" 
                                                ForeColor="Red"/>
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

                                            <h6>Location Details</h6>
                                            <asp:TextBox ID="txtAddressDetails" runat="server" Text='<%# Bind("details") %>' class="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>



                                        </div>
                                        <asp:LinkButton ID="btnInsertAddress" OnClick="btnNewAddress_Click" runat="server" ValidationGroup="address">Commit</asp:LinkButton>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <asp:SqlDataSource
                        ID="srcServiceAddresses"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT ADDRESSES.addressID, ADDRESSES.streetAddress, ADDRESSES.city, ADDRESSES.state, ADDRESSES.zipcode, ADDRESSES.addressType, ADDRESSES.serviceID, ADDRESSES.details
                                    FROM ADDRESSES WHERE ADDRESSES.serviceID = @serviceID"
                        UpdateCommand="UPDATE ADDRESSES SET streetAddress=@streetAddress, city=@city, state=@state, zipcode=@zipcode, details=@details where addressID=@addressID"
                        InsertCommand="INSERT into ADDRESSES(streetAddress, city, state, zipcode, addressType, serviceID, details) VALUES(@streetAddress, @city, @state, @zipcode,@addressType,@serviceID,@details)"
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
                            <asp:ControlParameter Name="details" ControlID="txtAddressDetails" Type="String" />
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-6">
            <div class="card card-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                <div class="row">
                    <input id="oFile" type="file" runat="server" class="btn btn-primary" name="oFile" />
                    <asp:Button ID="btnImageupload" runat="server" class="btn btn-primary ml-2" Text="Upload File" type="submit" OnClick="btnImageupload_Click" />

                    <asp:Panel ID="panelConfirm" runat="server" Visible="false">
                        <asp:Label ID="lblResult" runat="server" class="h6" Text="Label"></asp:Label>
                    </asp:Panel>
                </div>
                <br />
                        </li>
                    <li class="list-group-item">
                <h6>Existing Files</h6>
                <asp:DataList ID="DataListContent" runat="server" OnItemCommand="ButtonDownloadContent"
                    RepeatDirection="Vertical" BorderStyle="None" Style="padding: 0px!important">
                    <ItemTemplate>
                        <div>
                            <img src='<%# DataBinder.Eval(Container.DataItem,"Icon") %>' id="ImgIcon" />
                            <asp:LinkButton ID="ButtonDownload" runat="server" Style="padding-left: 5px; text-decoration: none"
                                ToolTip="Click here to download" CommandName="Download" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"DownLoadLink") %>'
                                Text=' <%# DataBinder.Eval(Container.DataItem,"FileName") %>'></asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" Text="Delete" CommandArgument='<%# Eval("DownLoadLink") %>'
                                Style="text-decoration: none; font-size: large; color: red;" runat="server" OnClick="DeleteFile" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                        </li>
                    </ul>
            </div>
        </div>
    </div>

</asp:Content>
