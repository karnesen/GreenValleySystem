<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="auctionServiceOrder.aspx.cs" Inherits="GreenValleySystem.auctionServiceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card card-body">
        <ul class="list-group list-group-flush">

            <%-- Customer Information --%>
            <li class="list-group-item">Customer Information
            <asp:FormView
                ID="fvCustomerInfo"
                runat="server"
                DataSourceID="srcCustomerInfo">
                <ItemTemplate>
                    <div class="mb-2">
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("customerName") %>'></asp:Label>
                    </div>
                    <div class="mb-2">
                        <asp:Label ID="lblPhone1" runat="server" Text='<%# Bind("phone1") %>'></asp:Label>
                    </div>
                    <div class="mb-2">
                        <asp:Label ID="lblPhone2" runat="server" Text='<%# Bind("phone2") %>'></asp:Label>
                    </div>
                    <div class="mb-2">
                        <asp:Label ID="lblCurrentAddress" runat="server" Text='<%# Bind("custAddress") %>'></asp:Label>
                    </div>

                </ItemTemplate>
            </asp:FormView>

                <asp:SqlDataSource
                    ID="srcCustomerInfo"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select firstName + ' ' + lastName as customerName, phoneNumber + ' ' + phoneType as phone1, altphoneNumber + ' ' + phoneType2 as phone2
            , streetAddress + ', ' + city + ' ' + state + ' ' + zipcode as custAddress from Customer Inner Join service on customer.customerID = service.customerID
            where service.serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </li>

            <%-- Service Infromtation --%>
            <asp:ListView
                ID="lvAddresses"
                DataSourceID="srcServiceAddresses"
                runat="server">
                <LayoutTemplate>
                    <li class="list-group-item">Service Information
                        <br />
                        <div id="itemPlaceholder" runat="server"></div>
                    </li>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="addressType" runat="server" Text='<%# (Eval("addressType").ToString() == "P") ? "Pick Up Location" : "Drop Off" %>'></asp:Label>
                    <br />
                    <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>,
                    <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                    <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                </ItemTemplate>
            </asp:ListView>

            <asp:SqlDataSource
                ID="srcServiceAddresses"
                ConnectionString="<%$ ConnectionStrings:Connect %>"
                SelectCommand="SELECT ADDRESSES.addressID, ADDRESSES.streetAddress, ADDRESSES.city, ADDRESSES.state, ADDRESSES.zipcode, ADDRESSES.addressType, ADDRESSES.serviceID
                                    FROM ADDRESSES WHERE ADDRESSES.serviceID = @serviceID"
                runat="server">
                <SelectParameters>
                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                </SelectParameters>
            </asp:SqlDataSource>



            <%-- Trash Service Order --%>
            <li class="list-group-item">Trash Removal
                <asp:FormView
                    ID="fvTrash"
                    runat="server"
                    DefaultMode="Edit"
                    DataSourceID="srcService">
                    <EmptyDataTemplate>
                        No Trash Pickup Requested
                    </EmptyDataTemplate>
                    <EditItemTemplate>
                        <div class="mb-2">
                            <asp:CheckBox ID="chDumpster" Checked='<%# Bind("dumpster")%>' Text="Need Dumpster?" runat="server" />
                        </div>
                        <div class="mb-2 form-group">
                            <asp:Label ID="lblMen" For="txtMen" runat="server" Text="Men Needed"></asp:Label>
                            <asp:TextBox ID="txtMen" Text='<%# Bind("men")%>' Class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-2 form-group">
                            <asp:Label ID="lblCharge" For="txtCharge" runat="server" Text="Cost"></asp:Label>
                            <asp:TextBox ID="txtCharge" Text='<%# Bind("trash")%>' Class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-2 form-group">
                            <asp:Label ID="lblTrash" For="txtTrashDesc" runat="server" Text="Trash Description"></asp:Label>
                            <asp:TextBox ID="txtTrashDesc" Text='<%# Bind("trashDesc")%>' Class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <asp:LinkButton ID="lbtnSave" CommandName="Update" runat="server">Save</asp:LinkButton>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:SqlDataSource
                    ID="srcService"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from auctionAssessment  where auctionAssessment.serviceID = @serviceID and auctionAssessment.trashRemoval=1"
                    UpdateCommand="Update auctionAssessment set dumpster = @dumpster, men=@men trash=@trash, trashdesc=@trashdesc where serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </li>

            <%-- Pickup Service Order --%>
            <li class='<%= pickupCollapse %>'>

                <%-- Assign Crew --%>
                <div class="row">
                    <div class="col">
                        <asp:DropDownList
                            ID="ddlEmployees"
                            runat="server"
                            class="form-control"
                            DataSourceID="srcAllEmployees"
                            DataTextField="employeeName"
                            DataValueField="employeeID">
                        </asp:DropDownList>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnEmployee" runat="server" Text="Add" OnClick="btnEmployee_Click" class="btn btn-primary" />
                    </div>
                </div>

                <asp:SqlDataSource
                    ID="srcAllEmployees"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select employeeID, firstName + ' ' + lastName as employeeName from Employee where currentEmployee=1"></asp:SqlDataSource>

                <div class="row col-6">
                    <asp:ListView
                        ID="lvEmployees"
                        runat="server"
                        DataSourceID="srcAssignedEmployees">
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
                                    <asp:Label ID="lblEmployee" runat="server" Text='<%# Bind("firstName") + " " + Bind("lastName")  %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClick="lnkDelete_Click"><i class="fas fa-times"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>


                <asp:SqlDataSource
                    ID="srcAssignedEmployees"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from employee inner join assignment on employee.employeeID = assignment.employeeID where assignment.serviceID = @serviceID and employeeRole='pick up'"
                    InsertCommand="Insert into assignment values(@employeeId, @serviceID, 'pick up')"
                    DeleteCommand="Delete from assignment where employeeID=@employeeID and serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        <asp:ControlParameter Name="employeeID" ControlID="ddlEmployees" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </DeleteParameters>
                </asp:SqlDataSource>


                <%-- Pick up details --%>
                <asp:FormView
                    ID="fvPickUp"
                    runat="server"
                    DataSourceID="srcService">
                    <EditItemTemplate>
                        <li class='<%# (Eval("pickUp").ToString() == "true") ? "list-group-item " : "list-group-item collapse" %>'>Auction Assessment
                             <asp:Label ID="lblHome" runat="server"
                                 Text='<%# (Eval("apartment").ToString() == "true") ? "Apartment" 
                                     : (Eval("house").ToString() == "true") ? "House"
                                     : (Eval("storageUnit").ToString() == "true") ? "Storage Unit" : "Place of Business"%>'></asp:Label>
                            <asp:Label ID="lblAccess" runat="server" Text='<%# Eval("truckAccess").ToString() %>'></asp:Label>
                            <asp:Label ID="lblFar" runat="server" Text='<%# Eval("howFar").ToString() %>'></asp:Label>
                            <asp:Label ID="lblSteps" runat="server" Text='<%# Eval("steps").ToString() %>'></asp:Label>

                            <div class="row">
                                <asp:Label ID="lblAppCart" runat="server" Text='<%# (Eval("appCart").ToString() == "true") ? "Appliance Cart " : "" %>'></asp:Label>
                                <asp:Label ID="lblPianoDolly" runat="server" Text='<%# (Eval("pianoDolly").ToString() == "true") ? "Piano Dolly " : "" %>'></asp:Label>
                                <asp:Label ID="lblPianoBoard" runat="server" Text='<%# (Eval("pianoBoard").ToString() == "true") ? "Piano Board " : "" %>'></asp:Label>
                                <asp:Label ID="lblGunSafe" runat="server" Text='<%# (Eval("gunSafe").ToString() == "true") ? "Gun Safe Cart" : "" %>'></asp:Label>
                                <asp:Label ID="lblExtraBlankets" runat="server" Text='<%# (Eval("blankets").ToString() == "true") ? "Extra Blankets " : "" %>'></asp:Label>
                            </div>

                            Packing Materials
                        <asp:Label ID="lblSmall" runat="server"
                            Text='<%# (Eval("smallamt").ToString() == "0") ? "" : "Small " + Eval("smallamt").ToString() %>'></asp:Label>
                            <asp:Label ID="lblMed" runat="server"
                                Text='<%# (Eval("medamt").ToString() == "0") ? "" : "Medium " + Eval("medamt").ToString() %>'></asp:Label>
                            <asp:Label ID="lblLarge" runat="server"
                                Text='<%# (Eval("largeamt").ToString() == "0") ? "" : "Large " + Eval("largeamt").ToString() %>'></asp:Label>
                            <asp:Label ID="lblSmallPads" runat="server"
                                Text='<%# (Eval("smallPadsamt").ToString() == "0") ? "" : "Small Pads " + Eval("smallPadsamt").ToString() %>'></asp:Label>
                            <asp:Label ID="lblLargePads" runat="server"
                                Text='<%# (Eval("largePadsamt").ToString() == "0") ? "" : "Large Pads " + Eval("largePadsamt").ToString() %>'></asp:Label>

                            Estimated Fees
                        <asp:Label ID="lblPickUp" runat="server" Text='<%# Eval("pickUpFees").ToString() %>'></asp:Label>
                            <%--<asp:Label ID="lblConsignment" runat="server" Text='<%# Eval("consignment").ToString() %>'></asp:Label>
                        <asp:Label ID="lblTrash" runat="server" Text='<%# Eval("trash").ToString() %>'></asp:Label>--%>
                            <asp:Label ID="lblAdditional" runat="server" Text='<%# Eval("additional").ToString() %>'></asp:Label>
                    </EditItemTemplate>
                </asp:FormView>

                <asp:ListView
                    ID="lvTrucks"
                    runat="server"
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
                        </tr>
                    </ItemTemplate>
                </asp:ListView>

                <asp:SqlDataSource
                    ID="srcTrucks"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from utilizeEquipment Inner Join Equipment on utilizeEquipment.equipmentID = Equipment.equipmentID where utilizeEquipment.serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </li>


            <%-- Auction Date --%>
            <li class="list-group-item">
                <asp:ListView
                    ID="lvDate"
                    runat="server"
                    DataSourceID="srcDate">
                    <EditItemTemplate>
                        No Auction Date Set.
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtAuctionDate" Text='<%# Bind("confirmedDate") %>' runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:ListView>

                <asp:SqlDataSource
                    ID="srcDate"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select confirmedDate from schedule where serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </li>

            <%-- Storage Dropdown --%>
            <li class="list-group-item">
                <div class="row">
                    <div class="col">
                        <asp:DropDownList
                            ID="ddlStorage"
                            runat="server"
                            class="form-control"
                            DataSourceID="srcStorageLocations"
                            DataTextField="storageLocation"
                            DataValueField="storageID">
                        </asp:DropDownList>
                    </div>
                    <div class="col">
                        <asp:Button ID="btnStorage" runat="server" Text="Add" OnClick="btnStorage_Click" class="btn btn-primary" />
                    </div>
                </div>

                <asp:SqlDataSource
                    ID="srcStorageLocations"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from Storage "></asp:SqlDataSource>

                <%-- Customer Storage --%>
                <div class="row col-6">
                    <asp:ListView
                        ID="lvCustomerStorage"
                        runat="server"
                        DataSourceID="srcStorage">
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
                                    <asp:Label ID="lblStorage" runat="server" Text='<%# Bind("storageLocation") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"><i class="fas fa-times"></i></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>


                <asp:SqlDataSource
                    ID="srcStorage"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from storage Inner Join auctionstorage on storage.storageID = auctionstorage.storageID where auctionstorage.serviceID=@serviceID"
                    InsertCommand="Insert into auctionstorage values(@storageId, @serviceID)"
                    DeleteCommand="Delete from auctionstorage where storageLocation=@storageLocation and serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        <asp:ControlParameter Name="storageID" ControlID="ddlStorage" />
                    </InsertParameters>
                    <DeleteParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </DeleteParameters>
                </asp:SqlDataSource>

            </li>
        </ul>


    </div>
</asp:Content>
