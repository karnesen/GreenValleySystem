<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="moveServiceOrder.aspx.cs" Inherits="GreenValleySystem.moveServiceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card">
        <div class="card-header text-center h5">
            Service Order
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <h4>Customer Information</h4>
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
                <asp:ListView
                    ID="lvAddresses"
                    DataSourceID="srcServiceAddresses"
                    runat="server">
                    <LayoutTemplate>
                        <li class="list-group-item">
                            <h4>Service Information</h4>
                            <div id="itemPlaceholder" runat="server"></div>
                        </li>
                    </LayoutTemplate>
                    <EmptyItemTemplate>
                        No Addresses Specificed
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="addressType" runat="server" Font-Bold="true" Text='<%# (Eval("addressType").ToString() == "P") ? "Pick Up Location" : "Drop Off" %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("streetAddress") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblCity" runat="server" Text='<%# Bind("city") %>'></asp:Label>,
                    <asp:Label ID="lblState" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                        <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>
                        <br />
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

                <%-- Packing Service Order --%>
                <li class='<%= packingCollapse %>'>
                    <h4>Packing Service Order</h4>
                    <asp:FormView
                        ID="fvPacking"
                        runat="server"
                        DataSourceID="srcPacking"
                        DefaultMode="Edit">
                        <EditItemTemplate>
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td><%--Packing Materials--%>
                                            </td>
                                            <td>
                                                <%--<asp:Label ID="Label1" runat="server"
                                                    Text='<%# (Eval("smallamt").ToString() == "0") ? "" : "Small " + Eval("smallamt").ToString() +  "<br>" %>'></asp:Label>
                                                <asp:Label ID="Label2" runat="server"
                                                    Text='<%# (Eval("medamt").ToString() == "0") ? "" : " Medium " + Eval("medamt").ToString() +  "<br>"  %>'></asp:Label>
                                                <asp:Label ID="Label3" runat="server"
                                                    Text='<%# (Eval("largeamt").ToString() == "0") ? "" : " Large " + Eval("largeamt").ToString() +  "<br>"  %>'></asp:Label>
                                                <asp:Label ID="Label4" runat="server"
                                                    Text='<%# (Eval("smallPadsamt").ToString() == "0") ? "" : " Small Pads " + Eval("smallPadsamt").ToString() +  "<br>" %>'></asp:Label>
                                                <asp:Label ID="Label5" runat="server"
                                                    Text='<%# (Eval("largePadsamt").ToString() == "0") ? "" : " Large Pads " + Eval("largePadsamt").ToString() +  "<br>"  %>'></asp:Label>--%>

                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </EditItemTemplate>
                    </asp:FormView>

                    <div class="card card-body mb-2">
                        <h5>Crew Assignments</h5>
                        <%-- Assign Crew --%>
                        <div class="row">
                            <div class="col">
                                <asp:DropDownList
                                    ID="ddlCrew"
                                    runat="server"
                                    class="form-control"
                                    DataSourceID="srcAllEmployees"
                                    DataTextField="employeeName"
                                    DataValueField="employeeID">
                                </asp:DropDownList>
                            </div>
                            <div class="col mt-3">
                                <asp:Button ID="btnAddtoPickup" runat="server" Text="Add" OnClick="btnAddtoPickup_Click" class="btn btn-primary" />
                            </div>

                            <asp:SqlDataSource
                                ID="srcAllEmployees"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select employeeID, firstName + ' ' + lastName as employeeName from Employee where currentEmployee=1"></asp:SqlDataSource>

                        </div>

                        <div class="row col-6">
                            <asp:ListView
                                ID="lvPackingEmployees"
                                runat="server"
                                DataKeyNames="employeeID"
                                DataSourceID="srcPacking">
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
                                            <asp:Label ID="lblEmployee" runat="server" Text='<%# Eval("firstName") + " " + Eval("lastName")  %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete"><i class="fas fa-times"></i></asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </div>

                        <asp:SqlDataSource
                            ID="srcPacking"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Connect %>"
                            SelectCommand="Select * from employee inner join assignment on employee.employeeID = assignment.employeeID where assignment.serviceID = @serviceID and employeeRole='packing'"
                            InsertCommand="Insert into assignment values(@employeeID, @serviceID, 'packing')"
                            DeleteCommand="Delete from assignment where employeeID=@employeeID and serviceID=@serviceID">
                            <SelectParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                <asp:ControlParameter Name="employeeID" ControlID="ddlCrew" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>
                </li>

                <%-- Trash Service Order --%>
                <li class="list-group-item">
                    <asp:FormView
                        ID="fvTrash"
                        runat="server"
                        DefaultMode="Edit"
                        DataSourceID="srcService">
                        <EmptyDataTemplate>
                        </EmptyDataTemplate>
                        <EditItemTemplate>
                            <h4>Trash Removal Service Order</h4>
                            <%--<div class="row">
                                <%--<div class="col">
                                    <asp:CheckBox ID="chDumpster" Checked='<%# Bind("dumpster")%>' Text="Need Dumpster?" runat="server" />
                                </div>--%>

                                <%--<div class="col">
                                    <asp:Label ID="lblMen" For="txtMen" runat="server" Text="Men Needed"></asp:Label>
                                    <asp:TextBox ID="txtMen" Text='<%# Bind("men")%>' TextMode="Number" Class="form-control" runat="server"></asp:TextBox>
                                </div>--%>
                                <%--<div class="col">
                                    <asp:Label ID="lblCharge" For="txtCharge" runat="server" Text="Cost"></asp:Label>
                                    <asp:TextBox ID="txtCharge" Text='<%# Bind("trash")%>' Class="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>--%>

                            <div class="card card-body mb-2 form-group form-row">
                                <asp:Label ID="lblTrash" For="txtTrashDesc" runat="server" Text="Trash Description"></asp:Label>
                                <asp:TextBox ID="txtTrashDesc" Text='<%# Bind("trashDesc")%>' TextMode="MultiLine" Class="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator 
                                    id="revEquipment"  
                                    runat="server"
                                    ControlToValidate="txtTrashDesc" 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                    ErrorMessage="Invalid Input" 
                                    ForeColor="Red">
                                </asp:regularexpressionvalidator>
                            </div>
<%--                            <asp:LinkButton ID="lbtnSave" CommandName="Update" runat="server">Save</asp:LinkButton>--%>
                        </EditItemTemplate>
                    </asp:FormView>

                    <asp:SqlDataSource
                        ID="srcService"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="Select * from moveAssessment  where moveAssessment.serviceID = @serviceID and moveAssessment.trash=1"
                        UpdateCommand="Update moveAssessment set dumpster = @dumpster, men=@men trash=@trash, trashdesc=@trashdesc where serviceID=@serviceID">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </li>
                
                <%-- Move Service Order --%>
                <li class="list-group-item">
                  <h4>Move Service Order</h4>
                    <div class="card card-body mb-2 form-group form-row">
                                 
                        <h6>Building Type</h6>
                        <asp:FormView
                        ID="fvAssessment"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcAssessment"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <div class="form-group row justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chApt" Checked='<%# Bind("apartment")%>' Text="Apartment" runat="server" data-toggle="collapse"  role="button" aria-expanded="false" aria-controls="collapseApt" />
                                    
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chHouse" Checked='<%# Bind("house")%>' Text="House" runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chStorage" Checked='<%# Bind("storageUnit")%>' Text="Storage Unit" runat="server" data-toggle="collapse"  role="button" aria-expanded="false" aria-controls="collapseStor" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chBusiness" Checked='<%# Bind("business")%>' Text="Place of Business" runat="server" data-toggle="collapse"  role="button" aria-expanded="false" aria-controls="collapseBus" />
                                </div>
                            </div> 
                           

                            <br />

                            <h6>Location Information</h6>

                            <div class="form-group row justify-content-around">
                                <div class="form-check">
                                    <p>Elevator?</p>
                                    <asp:Label ID="lblElevator" runat="server" Text='<%# Bind("elevator") %>' style="font:bold" class="form-control"></asp:Label>
                                </div>
                                <div class="form-check">
                                    <p>Walk from Elevator:</p>
                                    <asp:Label ID="lblWalk" runat="server" style="font:bold" Text='<%# Eval("elevatorWalk") %>' class="form-control"></asp:Label>
                                </div>

                                <div class="form-check">
                                    <p>Flights of Stairs:</p>
                                    <asp:Label ID="lblStairs" style="font:bold" runat="server" Text='<%# Eval("steps") %>' class="form-control"></asp:Label>
                                </div>
                                <div class="form-check">
                                    <p>Indoor Storage</p>
                                    <asp:Label ID="lblIn" runat="server" Text='<%# Eval("indoor") %>' style="font:bold" class="form-control"></asp:Label>
                                </div>
                                <div class="form-check">
                                    <p>Outdoor Storage</p>
                                    <asp:Label ID="lblOut" runat="server" Text='<%# Eval("outdoor") %>' style="font:bold" class="form-control"></asp:Label>
                                </div>

                                

                            </div>

                          
                             </ItemTemplate>
                    </asp:FormView>
                        
                        <h6>Assigned Equipment</h6>
                        <asp:FormView
                        ID="FormView1"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcTrucks"
                        DataKeyNames="equipmentType"
                        runat="server"
                        >
                        <ItemTemplate>
                        <div class="form-check">
                           <asp:BulletedList ID="lstTrucks" runat="server" DataSourceID="srcTrucks" DataValueField="equipmentType">
                               <asp:ListItem></asp:ListItem>
                           </asp:BulletedList>
                        </div>
                            </ItemTemplate>
                          </asp:FormView>

                        <br /> 

                        <asp:FormView
                        ID="fvTruck"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcAssessment"
                     
                        runat="server">
                        <ItemTemplate>

                     <div class="row">
                        <div class="form-group row justify-content-around col-6">
                            <h6>Truck Accessibility</h6>
                            <asp:Label ID="lblTruckAccess" runat="server" Text='<%# Bind("truckAccess")%>' class="form-control"></asp:Label> 
                        </div>

                        
                        <div class="form-group row justify-content-around col-6">
                            <h6>Distance From Loading Door</h6>
                            <asp:Label ID="lblLoadingDist" runat="server" Text='<%# Bind("howFar")%>' class="form-control"></asp:Label> 
                        </div>

                     </div>
                            </ItemTemplate>
                            </asp:FormView>

                  

         

                        <asp:FormView
                        ID="fvPackingCartons"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCube"
                     
                        runat="server">
                        <ItemTemplate>

                    <div class="row">
                        <div class="form-group row justify-content-around col-2">
                            <h6>Small Book Cartons</h6>
                            <asp:Label ID="lblBookCarton" runat="server" Text='<%# Bind("smallBooks")%>' class="form-control"></asp:Label> 
                        </div>

                        
                        <div class="form-group row justify-content-around col-2">
                            <h6>Small Cartons</h6>
                            <asp:Label ID="lblSmallCarton" runat="server" Text='<%# Bind("smallCartons")%>' class="form-control"></asp:Label> 
                        </div>

                            
                        <div class="form-group row justify-content-around col-2">
                            <h6>Medium Cartons</h6>
                            <asp:Label ID="lblMedCarton" runat="server" Text='<%# Bind("mediumCartons")%>' class="form-control"></asp:Label> 
                        </div>

                             
                        <div class="form-group row justify-content-around col-2">
                            <h6>Large Cartons</h6>
                            <asp:Label ID="lblLargeCarton" runat="server" Text='<%# Bind("largeCartons")%>' class="form-control"></asp:Label> 
                        </div>

                            
                        <div class="form-group row justify-content-around col-2">
                            <h6>XL Cartons</h6>
                            <asp:Label ID="lblXLCarton" runat="server" Text='<%# Bind("XLCartons")%>' class="form-control"></asp:Label> 
                        </div>

                             
                        <div class="form-group row justify-content-around col-2">
                            <h6>Mirror Cartons</h6>
                            <asp:Label ID="lblMirrorCarton" runat="server" Text='<%# Bind("mirrorCarton")%>' class="form-control"></asp:Label> 
                        </div>
                     </div>


                            </ItemTemplate>
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

                        <asp:SqlDataSource
                                ID="srcCube"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set dishPack=@dishPack,wardrobeLayFlat=@wardrobeLayFlat,wardrobeStandup=@wardrobeStandup,smallBooks=@smallBooks,smallCartons=@smallCartons,mediumCartons=@mediumCartons,largeCartons=@largeCartons,XLCartons=@XLCartons,mirrorCarton=@mirrorCarton where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>


                    </div>
                
                </li>

            </ul>
        </div>
    </div>
</asp:Content>
