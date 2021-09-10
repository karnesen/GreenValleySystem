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
                                SelectCommand="Select employeeID, firstName + ' ' + lastName as employeeName from Employee where position = 'Mover'"></asp:SqlDataSource>

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
                            DeleteCommand="Delete from assignment where employeeID=@employeeID and serviceID=@serviceID and employeeRole='packing'">
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

                
                
                <%-- Move Service Order --%>
                <li class="list-group-item">
                  <h4>Move Service Order</h4>
                    <div class="card card-body mb-2 form-group form-row">
                                 
                        
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
                                <div class="mb-2">
                                    <h6>Building Type</h6>
                                

                                <asp:Label ID="lblApartmentStatus" runat="server" Text='<%#(Eval("apartment").ToString() == "True") ? "Apartment Selected" : " " %>'></asp:Label>
                            
                               
                                <br />
                                    
                              

                                    <asp:Label ID="lblHouseStatus" runat="server" Text='<%#(Eval("house").ToString() == "True") ? "House Selected" : " " %>'></asp:Label>
                                <br />

                               

                                    <asp:Label ID="lblStorageUnitStatus" runat="server" Text='<%#(Eval("storageUnit").ToString() == "True") ? "Storage Unit Selected" : " " %>'></asp:Label>
                                <br />
                                
                                   

                                    <asp:Label ID="lbBusinessStatus" runat="server" Text='<%#(Eval("business").ToString() == "True") ? "Business Selected" : " " %>'></asp:Label>
                                </div>
                            
                           

                            

                           

                            
                                <div class="mb-2">
                                     <h6>Location Information</h6>
                                    <asp:Label ID="lblElevator1" runat="server" Text="Elevator: "></asp:Label>
                                    <asp:Label ID="lblElevator" runat="server" Text='<%# Bind("elevator") %>' style="font:bold"></asp:Label>
                                <br />
                                    <asp:Label ID="lblWalk1" runat="server" Text="Walk From Elevator: "></asp:Label>
                                    
                                    <asp:Label ID="lblWalk" runat="server" style="font:bold" Text='<%# (Eval("elevatorWalk").ToString() == "") ? "N/A" : Eval("elevatorWalk") %>'></asp:Label>

                                    <br />
                                
                                    <asp:Label ID="lblStairs1" runat="server" Text="Flights of Stairs: "></asp:Label>
                                    
                                    <asp:Label ID="lblStairs" style="font:bold" runat="server" Text='<%# (Eval("steps").ToString() == "") ? "N/A" : Eval("steps") %>'></asp:Label>
                                
                              <br />
                                    <asp:Label ID="lblIn1" runat="server" Text="Indoor Storage: "></asp:Label>
                                    
                                    <asp:Label ID="lblIn" runat="server" Text='<%# Eval("indoor") %>' style="font:bold"></asp:Label>
                                <br />
                                    
                                    <asp:Label ID="lblOut1" runat="server" Text="Outdoor Storage: "></asp:Label>
                                    
                                    <asp:Label ID="lblOut" runat="server" Text='<%# Eval("outdoor") %>' style="font:bold"></asp:Label>
                                </div>
                        <asp:FormView
                        ID="fvPackingCartons"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCube"
                     
                        runat="server">
                        <ItemTemplate>

                 

                        <div class="mb-2">
                        
                            <h6>Cartons / Packing</h6>
                            <asp:Label ID="lblBookCarton1" runat="server" Text="Small Book Cartons: "></asp:Label> 
                            <asp:Label ID="lblBookCarton" runat="server" Text='<%# Bind("smallBooks")%>'></asp:Label> 
                      
                            <br />
                    
                          
                            <asp:Label ID="lblSmallCarton1" runat="server" Text="Small Cartons"></asp:Label> 
                            <asp:Label ID="lblSmallCarton" runat="server" Text='<%# Bind("smallCartons")%>'></asp:Label> 
                     

                            <br />
                    
                          
                            <asp:Label ID="lblMedCarton1" runat="server" Text="Medium Cartons: "></asp:Label> 
                            <asp:Label ID="lblMedCarton" runat="server" Text='<%# Bind("mediumCartons")%>'></asp:Label> 
                
                            <br />
                             
               
                            
                            <asp:Label ID="lblLargeCarton1" runat="server" Text="Large Cartons: "></asp:Label> 
                            <asp:Label ID="lblLargeCarton" runat="server" Text='<%# Bind("largeCartons")%>'></asp:Label> 
                  

                            <br />
                 
                           
                            <asp:Label ID="lblXLCarton1" runat="server" Text="XL Cartons: "></asp:Label> 
                            <asp:Label ID="lblXLCarton" runat="server" Text='<%# Bind("XLCartons")%>'></asp:Label> 
                   
                            <br />
                             
                   
                            
                            <asp:Label ID="lblMirrorCarton1" runat="server" Text="Mirror Cartons: "></asp:Label> 
                            <asp:Label ID="lblMirrorCarton" runat="server" Text='<%# Bind("mirrorCarton")%>'></asp:Label> 
                        </div>
                  


                            </ItemTemplate>
                            </asp:FormView>
                                </div>

                                

                            

                          
                             </ItemTemplate>
                    </asp:FormView>
                        
                         <div class="form-group row justify-content-around">
                        <asp:FormView
                        ID="FormView1"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcTrucks"
                        DataKeyNames="equipmentType"
                        runat="server"
                        >
                            <EmptyDataTemplate>
                                <h6>Assigned Equipment</h6>
                                N/A
                            </EmptyDataTemplate>
                        <ItemTemplate>
                  
                        <div class="mb-2">
                          <h6>Assigned Equipment</h6>
                           <asp:BulletedList ID="lstTrucks" runat="server" DataSourceID="srcTrucks" DataValueField="equipmentType">
                               <asp:ListItem></asp:ListItem>
                           </asp:BulletedList>
                        </div>
                            </ItemTemplate>
                          </asp:FormView>

                     

                        <%--<asp:FormView
                        ID="fvTruck"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcAssessment"
                     
                        runat="server">
                        <ItemTemplate>

                     <div class="mb-2">

                         <h6>Loading Information</h6>
                        
                         <asp:Label ID="lblTruckAccess1" runat="server" Text="Truck Accessibility: " style="font:bold"></asp:Label>
                            
                          <asp:Label ID="lblTruckAccess" runat="server" Text='<%# Bind("truckAccess")%>'></asp:Label> 
                        <br />

                        
                            <asp:Label ID="lblLoadingDist1" runat="server" Text="Distance From Loading Door: " style="font:bold"></asp:Label> 
                            
                            <asp:Label ID="lblLoadingDist" runat="server" Text='<%# Bind("howFar")%>'></asp:Label> 
                        

                     </div>
               
                            </ItemTemplate>
                            </asp:FormView>--%>

                      

                  

         

                        


                             <asp:FormView
                        ID="fvTruck"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcAssessment"
                     
                        runat="server">
                        <ItemTemplate>

                     <div class="mb-2">

                         <h6>Loading Information</h6>
                        
                         <asp:Label ID="lblTruckAccess1" runat="server" Text="Truck Accessibility: " style="font:bold"></asp:Label>
                            
                          <asp:Label ID="lblTruckAccess" runat="server" Text='<%# (Eval("truckAccess").ToString() == "") ? "N/A" : Eval("truckAccess") %>'></asp:Label> 
                        <br />

                        
                            <asp:Label ID="lblLoadingDist1" runat="server" Text="Distance From Loading Door: " style="font:bold"></asp:Label> 
                            
                            <asp:Label ID="lblLoadingDist" runat="server" Text='<%# (Eval("howFar").ToString() == "") ? "N/A" : Eval("howFar")%>'></asp:Label> 
                        

                     </div>
               
                            </ItemTemplate>
                            </asp:FormView>


                         </div>

                       <div class="form-group row justify-content-around">
                        <div class="card card-body mb-2 col-6">
                        <h5>Move Crew Assignments</h5>
                        <%-- Assign Crew --%>
                        <div class="row">
                            <div class="col">
                                <asp:DropDownList
                                    ID="ddlMoveCrew"
                                    runat="server"
                                    class="form-control"
                                    DataSourceID="srcAllEmployees"
                                    DataTextField="employeeName"
                                    DataValueField="employeeID">
                                </asp:DropDownList>
                            </div>
                            <div class="col mt-3">
                                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" class="btn btn-primary" />
                            </div>

                            

                        </div>

                        <div class="row col-6">
                            <asp:ListView
                                ID="ListView1"
                                runat="server"
                                DataKeyNames="employeeID"
                                DataSourceID="srcMoveCrew">
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
                            ID="srcMoveCrew"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Connect %>"
                            SelectCommand="Select * from employee inner join assignment on employee.employeeID = assignment.employeeID where assignment.serviceID = @serviceID and employeeRole='move'"
                            InsertCommand="Insert into assignment values(@employeeID, @serviceID, 'move')"
                            DeleteCommand="Delete from assignment where employeeID=@employeeID and serviceID=@serviceID and employeeRole='move'">
                            <SelectParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                <asp:ControlParameter Name="employeeID" ControlID="ddlMoveCrew" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>
                             </div>
                       




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
                
                </li> <%--end move service order--%>

                <%-- Trash Service Order --%>
                <li class='<%= trashCollapse %>'>
                    <h4>Trash Removal Service Order</h4>
                    <div class="form-group row justify-content-around">
                    

                    <div class="card card-body mb-2 col-6">
                        <h5>Trash Crew Assignments</h5>
                        <%-- Assign Crew --%>
                        <div class="row">
                            <div class="col">
                                <asp:DropDownList
                                    ID="ddlTrashCrew"
                                    runat="server"
                                    class="form-control"
                                    DataSourceID="srcAllEmployees"
                                    DataTextField="employeeName"
                                    DataValueField="employeeID">
                                </asp:DropDownList>
                            </div>
                            <div class="col mt-3">
                                <asp:Button ID="btnAddToTrashCrew" runat="server" Text="Add" OnClick="btnAddToTrashCrew_Click" class="btn btn-primary" />
                            </div>

                            

                        </div>

                        <div class="row col-6">
                            <asp:ListView
                                ID="lvTrashCrew"
                                runat="server"
                                DataKeyNames="employeeID"
                                DataSourceID="srcTrashCrew">
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
                            ID="srcTrashCrew"
                            runat="server"
                            ConnectionString="<%$ ConnectionStrings:Connect %>"
                            SelectCommand="Select * from employee inner join assignment on employee.employeeID = assignment.employeeID where assignment.serviceID = @serviceID and employeeRole='trash'"
                            InsertCommand="Insert into assignment values(@employeeID, @serviceID, 'trash')"
                            DeleteCommand="Delete from assignment where employeeID=@employeeID and serviceID=@serviceID and employeeRole='trash'">
                            <SelectParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                <asp:ControlParameter Name="employeeID" ControlID="ddlTrashCrew" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>


                    <asp:SqlDataSource
                        ID="srcService"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="Select * from moveAssessment  where moveAssessment.serviceID = @serviceID and moveAssessment.trash=1"
                        UpdateCommand="Update moveAssessment set dumpster = @dumpster, men=@men trash=@trash where serviceID=@serviceID">
                        <SelectParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:FormView
                        ID="fvTrash"
                        runat="server"
                        DefaultMode="Edit"
                        DataSourceID="srcService">
                        <EmptyDataTemplate>
                        </EmptyDataTemplate>
                        <EditItemTemplate>
                            
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

                            <%--<div class="card card-body mb-2">
                                <h5>Trash Description</h5>
                                <asp:TextBox ID="txtTrashDesc" Text='<%# Bind("trashDesc")%>' TextMode="MultiLine" Class="form-control" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator 
                                    id="revEquipment"  
                                    runat="server"
                                    ControlToValidate="txtTrashDesc" 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                    ErrorMessage="Invalid Input" 
                                    ForeColor="Red">
                                </asp:regularexpressionvalidator>
                            </div>--%>
<%--                            <asp:LinkButton ID="lbtnSave" CommandName="Update" runat="server">Save</asp:LinkButton>--%>
                        </EditItemTemplate>
                    </asp:FormView>

                    </div>



                </li>
                
            </ul>

        </div>

        </div>

    </div>
</asp:Content>
