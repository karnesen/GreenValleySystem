﻿<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="moveServiceOrder.aspx.cs" Inherits="GreenValleySystem.moveServiceOrder" %>

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
                                <asp:Label ID="lblPhone1" runat="server" Text='<%# Eval("phoneType").ToString()=="--Please Select--" ? Eval("phoneNumber")+" Type N/A" : Eval("phoneNumber")+" "+Eval("phoneType") %>'></asp:Label>
                            </div>
                            <div class="mb-2">
                                <asp:Label ID="lblPhone2" runat="server" Text='<%# Eval("phoneType2").ToString()=="--Please Select--" ? Eval("altphoneNumber")+" Type N/A" : Eval("altphoneNumber")+" "+Eval("phoneType2") %>'></asp:Label>
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
                        SelectCommand="Select firstName + ' ' + lastName as customerName, phoneNumber, phoneType, altphoneNumber,phoneType2
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
                        <asp:Label ID="lblZip" runat="server" Text='<%# Bind("zipcode") %>'></asp:Label>,
                        <br />
                        <asp:Label ID="lblPhotos" Font-Bold="true" runat="server" Text='<%#Eval("addressType").ToString() == "P" ? "Photos Sent: " : "" %>'></asp:Label>
                        <asp:Label ID="lblSendPhotos" runat="server" Text='<%# (Eval("addressType").ToString() == "P" & Eval("sendPhotos").ToString() == "True") ? "Yes" : "" %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblMLS" Font-Bold="true" runat="server" Text='<%#Eval("addressType").ToString() == "P" ? "MLS Listing: " : "" %>'></asp:Label>
                        <asp:Label ID="lblMLSlisting" runat="server" Text='<%# (Eval("addressType").ToString() == "P" & Eval("mls").ToString() == "True") ? "Yes" : "" %>'></asp:Label>
                        <br />
                        <br />

                    </ItemTemplate>

                </asp:ListView>

                <asp:SqlDataSource
                    ID="srcServiceAddresses"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="SELECT        ADDRESSES.addressID, ADDRESSES.streetAddress, ADDRESSES.city, ADDRESSES.state, ADDRESSES.zipcode, ADDRESSES.addressType, ADDRESSES.serviceID, MOVEASSESSMENT.mls, 
                         MOVEASSESSMENT.sendPhotos
                         FROM            ADDRESSES INNER JOIN
                         MOVEASSESSMENT ON ADDRESSES.serviceID = MOVEASSESSMENT.serviceID WHERE ADDRESSES.serviceID = @serviceID"
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
                                    <h6 style="text-decoration:underline">Building Type</h6>
                                

                                 <asp:Label ID="lblNothing" runat="server" Text='<%#(Eval("apartment").ToString() == "False")  & Eval("house").ToString() == "False" & Eval("storageUnit").ToString() == "False" & Eval("business").ToString() == "False" ? "No Building Type Selected" : " " %>'></asp:Label>
                            
                               
                                <br />

                                <asp:Label ID="lblApartmentStatus" runat="server" Text='<%#(Eval("apartment").ToString() == "True") ? "Apartment Selected" : " " %>'></asp:Label>
                            
                               
                                <br />
                                    
                              

                                    <asp:Label ID="lblHouseStatus" runat="server" Text='<%#(Eval("house").ToString() == "True") ? "House Selected" : " " %>'></asp:Label>
                                <br />

                               

                                    <asp:Label ID="lblStorageUnitStatus" runat="server" Text='<%#(Eval("storageUnit").ToString() == "True") ? "Storage Unit Selected" : " " %>'></asp:Label>
                                <br />
                                
                                   

                                    <asp:Label ID="lbBusinessStatus" runat="server" Text='<%#(Eval("business").ToString() == "True") ? "Business Selected"+" "+Eval("businessText") : " " %>'></asp:Label>
                                </div>
                            
                           

                            

                           

                            
                                <div class="mb-2">
                                     <h6 style="text-decoration:underline">Location Information</h6>
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
                        
                            <h6 style="text-decoration:underline">Cartons / Packing</h6>
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
                                <h6 style="text-decoration:underline">Assigned Equipment</h6>
                                N/A
                            </EmptyDataTemplate>
                        <ItemTemplate>
                  
                        <div class="mb-2">
                          <h6 style="text-decoration:underline">Assigned Equipment</h6>
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

                         <h6 style="text-decoration:underline">Loading Information</h6>
                        
                         <asp:Label ID="lblTruckAccess1" runat="server" Text="Truck Accessibility: " style="font:bold"></asp:Label>
                            
                          <asp:Label ID="lblTruckAccess" runat="server" Text='<%# (Eval("truckAccess").ToString() == "") ? "N/A" : Eval("truckAccess") %>'></asp:Label> 
                        <br />

                        
                            <asp:Label ID="lblLoadingDist1" runat="server" Text="Distance From Loading Door: " style="font:bold"></asp:Label> 
                            
                            <asp:Label ID="lblLoadingDist" runat="server" Text='<%# (Eval("howFar").ToString() == "") ? "N/A" : Eval("howFar")%>'></asp:Label> 
                        

                     </div>
               
                            </ItemTemplate>
                            </asp:FormView>


                         </div>

                        <%--cube sheet in service order--%>
                     <div class="form-group row justify-content-around" style="text-align:center">
                        
                           
                            <asp:FormView
                        ID="fvLivingRoom"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Living Room</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">
                            
<%--                            <asp:FormView
                                    ID="fvLivingRoom"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcLivingTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("LivingRoom").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                            <br />--%>


                                <asp:Label ID="lblBar" runat="server" Text='<%#(Eval("bar").ToString() == "0") ? " " : "Bar: "+Eval("bar")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblPianoBench" runat="server" Text='<%#(Eval("pianoBench").ToString() == "0") ? " " : "Piano Bench: "+Eval("pianoBench")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblLargeBookCase" runat="server" Text='<%#(Eval("largeBookCase").ToString() == "0") ? " " : "Large Bookcase: "+Eval("largeBookCase")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblBookShelves" runat="server" Text='<%#(Eval("bookShelves").ToString() == "0") ? " " : "Bookshelves: "+Eval("bookShelves")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblCabinets" runat="server" Text='<%#(Eval("cabinet").ToString() == "0") ? " " : "Cabinet: "+Eval("cabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblStraightChair" runat="server" Text='<%#(Eval("straightChair").ToString() == "0") ? " " : "Straight Chair: "+Eval("straightChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblArmChair" runat="server" Text='<%#(Eval("armChair").ToString() == "0") ? " " : "Arm Chair: "+Eval("armChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRockerChair" runat="server" Text='<%#(Eval("rockerChair").ToString() == "0") ? " " : "Rocker Chair: "+Eval("rockerChair")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblOccasionalChair" runat="server" Text='<%#(Eval("occasionalChair").ToString() == "0") ? " " : "Occasional Chair: "+Eval("occasionalChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblOverstuffedChair" runat="server" Text='<%#(Eval("overStuffedChair").ToString() == "0") ? " " : "Overstuffed Chair: "+Eval("overStuffedChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblCedarChest" runat="server" Text='<%#(Eval("cedarChest").ToString() == "0") ? " " : "Cedar Chest: "+Eval("cedarChest")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblComputer" runat="server" Text='<%#(Eval("computer").ToString() == "0") ? " " : "Computer: "+Eval("computer")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallDesk" runat="server" Text='<%#(Eval("smallDesk").ToString() == "0") ? " " : "Small Desk: "+Eval("smallDesk")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblOttoman" runat="server" Text='<%#(Eval("ottoman").ToString() == "0") ? " " : "Ottoman: "+Eval("ottoman")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSecretaryDesk" runat="server" Text='<%#(Eval("secretaryDesk").ToString() == "0") ? " " : "Secretary Desk: "+Eval("secretaryDesk")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblETCenter" runat="server" Text='<%#(Eval("ETcetner").ToString() == "0") ? " " : "ET Center: "+Eval("ETcetner")  %>'></asp:Label>

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                <asp:FormView
                                    ID="fvLivingRoom"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcLivingTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("LivingRoom").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                            <br />

                                     <asp:Label ID="lblFireplaceEquipment" runat="server" Text='<%#(Eval("fireplaceEquipment").ToString() == "0") ? " " : "Fireplace Equipment: "+Eval("fireplaceEquipment")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFootStool" runat="server" Text='<%#(Eval("footStool").ToString() == "0") ? " " : "Foot Stool: "+Eval("footStool")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblGrandClock" runat="server" Text='<%#(Eval("grandClock").ToString() == "0") ? " " : "Grand Clock: "+Eval("grandClock")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblCoatRack" runat="server" Text='<%#(Eval("coatRack").ToString() == "0") ? " " : "Coat Rack: "+Eval("coatRack")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeCoatRack" runat="server" Text='<%#(Eval("coatRackLarge").ToString() == "0") ? " " : "Large Coat Rack: "+Eval("coatRackLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFloorLamp" runat="server" Text='<%#(Eval("floorLamp").ToString() == "0") ? " " : "Floor Lamp: "+Eval("floorLamp")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblMagazineRack" runat="server" Text='<%#(Eval("magazineRack").ToString() == "0") ? " " : "Magazine Rack: "+Eval("magazineRack")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblMusicCabinet" runat="server" Text='<%#(Eval("musicCabinet").ToString() == "0") ? " " : "Music Cabinet: "+Eval("musicCabinet")  %>'></asp:Label>

                                    </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblSmallOrgan" runat="server" Text='<%#(Eval("smallOrgan").ToString() == "0") ? " " : "Small Organ: "+Eval("smallOrgan")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPianoBabyGrUpr" runat="server" Text='<%#(Eval("pianoBabyGrUpr").ToString() == "0") ? " " : "Piano Baby/Gr/Upr: "+Eval("pianoBabyGrUpr")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPianoParlorGrd" runat="server" Text='<%#(Eval("pianoParlorGrd").ToString() == "0") ? " " : "Piano Parlor/Grd: "+Eval("pianoParlorGrd")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPianoSpinet" runat="server" Text='<%#(Eval("pianoSpinet").ToString() == "0") ? " " : "Piano Spinet: "+Eval("pianoSpinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRadioTable" runat="server" Text='<%#(Eval("radiotTable").ToString() == "0") ? " " : "Radio Table: "+Eval("radiotTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRecordPlayer" runat="server" Text='<%#(Eval("recordPlayerPortable").ToString() == "0") ? " " : "Record Player/Portable: "+Eval("recordPlayerPortable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblrugPadSmall" runat="server" Text='<%#(Eval("rugPadSmall").ToString() == "0") ? " " : "Small Rug/Pad: "+Eval("rugPadSmall")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRugPadLarge" runat="server" Text='<%#(Eval("rugPadLarge").ToString() == "0") ? " " : "Large Rug/Pad: "+Eval("rugPadLarge")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblSoftaRattanWicker" runat="server" Text='<%#(Eval("sofaRattanWicker").ToString() == "0") ? " " : "Sofa (Rattan Wicker): "+Eval("sofaRattanWicker")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSofaSectional" runat="server" Text='<%#(Eval("sofaSectional").ToString() == "0") ? " " : "Sofa (Sectional): "+Eval("sofaSectional")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLoveSeat" runat="server" Text='<%#(Eval("loveSeat").ToString() == "0") ? " " : "Love Seat: "+Eval("loveSeat")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblThreeCushion" runat="server" Text='<%#(Eval("threeCushion").ToString() == "0") ? " " : "Three Cushion: "+Eval("threeCushion")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFourCushion" runat="server" Text='<%#(Eval("fourCushion").ToString() == "0") ? " " : "Four Cushion: "+Eval("fourCushion")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFuton" runat="server" Text='<%#(Eval("futon").ToString() == "0") ? " " : "Futon: "+Eval("futon")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblStereoComponent" runat="server" Text='<%#(Eval("stereoComponent").ToString() == "0") ? " " : "Stereo Component: "+Eval("stereoComponent")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblConsole" runat="server" Text='<%#(Eval("console").ToString() == "0") ? " " : "Console: "+Eval("console")  %>'></asp:Label>

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblSpeakerPair" runat="server" Text='<%#(Eval("speakerPair").ToString() == "0") ? " " : "Speaker Pair: "+Eval("speakerPair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblStandardTable" runat="server" Text='<%#(Eval("tableStandard").ToString() == "0") ? " " : "Standard Table: "+Eval("tableStandard")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblCoffeeTable" runat="server" Text='<%#(Eval("tableCoffee").ToString() == "0") ? " " : "Coffee Table: "+Eval("tableCoffee")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblEndTable" runat="server" Text='<%#(Eval("tableEnd").ToString() == "0") ? " " : "End Table: "+Eval("tableEnd")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPhoneStand" runat="server" Text='<%#(Eval("phoneStand").ToString() == "0") ? " " : "Phone Stand: "+Eval("phoneStand")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallFlatScreen" runat="server" Text='<%#(Eval("flatScreenSmall").ToString() == "0") ? " " : "Small Flat Screen: "+Eval("flatScreenSmall")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeFlatScreen" runat="server" Text='<%#(Eval("flatScreenLarge").ToString() == "0") ? " " : "Large Flat Screen: "+Eval("flatScreenLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallBookCase" runat="server" Text='<%#(Eval("bookCaseSmall").ToString() == "0") ? " " : "Small Bookcase: "+Eval("bookCaseSmall")  %>'></asp:Label>

                                    </div>
                              <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblRecliner" runat="server" Text='<%#(Eval("recliner").ToString() == "0") ? " " : "Recliner: "+Eval("recliner")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeFloorLamp" runat="server" Text='<%#(Eval("floorLampLarge").ToString() == "0") ? " " : "Large Floor Lamp: "+Eval("floorLampLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTableLamp" runat="server" Text='<%#(Eval("tableLamp").ToString() == "0") ? " " : "Table Lamp: "+Eval("tableLamp")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblHeavyClockLamp" runat="server" Text='<%#(Eval("heavyClockLamp").ToString() == "0") ? " " : "Heavy Clock/Lamp: "+Eval("heavyClockLamp")  %>'></asp:Label>
                         
                                    

                                  
                                  

                                </div>
                                
                             </div>
                                

                                  </div>
                         

                            </ItemTemplate>
                            </asp:FormView>

                    <asp:SqlDataSource ID="srcLivingTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(bar + pianoBench + largeBookcase + bookShelves + cabinet + straightChair + armChair + rockerChair + occasionalChair + overStuffedChair + cedarChest
			+ computer + smallDesk + ottoman + secretaryDesk + ETcetner + fireplaceEquipment + footStool + grandClock + coatRack + coatRackLarge
			+ floorLamp + magazineRack + musicCabinet + pianoBabyGrUpr + pianoParlorGrd + pianoSpinet + radiotTable
			+ recordPlayerPortable + rugPadSmall + rugPadLarge + sofaRattanWicker + sofaSectional + loveSeat + threeCushion + fourCushion
			+ futon + stereoComponent + console + speakerPair + tableStandard + tableCoffee + tableEnd + phoneStand + flatScreenSmall + flatScreenLarge + bookCaseSmall + recliner + floorLampLarge
			+ tableLamp + heavyClockLamp) as 'LivingRoom' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>

                        <asp:FormView
                        ID="fvDiningRoom"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Dining Room</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvDiningRoomTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcDiningTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("DiningRoom").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>
                            <br />


                                <asp:Label ID="lblBench" runat="server" Text='<%#(Eval("bench").ToString() == "0") ? " " : "Bench: "+Eval("bench")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblBuffetBase" runat="server" Text='<%#(Eval("buffestBase").ToString() == "0") ? " " : "Buffet Base: "+Eval("buffestBase")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblHutchTop" runat="server" Text='<%#(Eval("hutchTop").ToString() == "0") ? " " : "Hutch Top: "+Eval("hutchTop")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblBookShelves" runat="server" Text='<%#(Eval("cornerCabinet").ToString() == "0") ? " " : "Corner Cabinet: "+Eval("cornerCabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDiningTable" runat="server" Text='<%#(Eval("diningTable").ToString() == "0") ? " " : "Dining Table: "+Eval("diningTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDiningTableChair" runat="server" Text='<%#(Eval("diningTableChair").ToString() == "0") ? " " : "Dining Table Chair: "+Eval("diningTableChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDiningTableLeaf" runat="server" Text='<%#(Eval("diningTableLeaf").ToString() == "0") ? " " : "Dining Table Leaf: "+Eval("diningTableLeaf")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblBakingRack" runat="server" Text='<%#(Eval("bakingRack").ToString() == "0") ? " " : "Baking Rack: "+Eval("bakingRack")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblServerCart" runat="server" Text='<%#(Eval("serverCart").ToString() == "0") ? " " : "Server Cart: "+Eval("serverCart")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTeaCart" runat="server" Text='<%#(Eval("teaCart").ToString() == "0") ? " " : "Tea Cart: "+Eval("teaCart")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallRugPad" runat="server" Text='<%#(Eval("smallRugPad").ToString() == "0") ? " " : "Small Rug/Pad: "+Eval("smallRugPad")  %>'></asp:Label>

                              

                                </div>

                             </div>
                                  </div>
                         <asp:SqlDataSource ID="srcDiningTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(bench + buffestBase + hutchTop + cornerCabinet + diningTable + diningTableChair
			+ diningTableLeaf + bakingRack + serverCart + teaCart + smallRugPad) as 'DiningRoom' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>

                            </ItemTemplate>
                            </asp:FormView>



                        <asp:FormView
                        ID="fvKitchen"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Kitchen</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvKitchenTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcKitchenTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Kitchen").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                            <br />    


                                <asp:Label ID="lblSuiteChairs" runat="server" Text='<%#(Eval("suiteChairs").ToString() == "0") ? " " : "Suite Chairs: "+Eval("suiteChairs")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblLargeTable" runat="server" Text='<%#(Eval("largeTable").ToString() == "0") ? " " : "Large Table: "+Eval("largeTable")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblSmallTable" runat="server" Text='<%#(Eval("smallTable").ToString() == "0") ? " " : "Small Table: "+Eval("smallTable")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblHighChair" runat="server" Text='<%#(Eval("highChair").ToString() == "0") ? " " : "High Chair: "+Eval("highChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblIroningBoard" runat="server" Text='<%#(Eval("ironingBoard").ToString() == "0") ? " " : "Ironing Board: "+Eval("ironingBoard")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblKitchenCabinet" runat="server" Text='<%#(Eval("kitchenCabinet").ToString() == "0") ? " " : "Kitchen Cabinet: "+Eval("kitchenCabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblMicrowave" runat="server" Text='<%#(Eval("microwave").ToString() == "0") ? " " : "Microwave: "+Eval("microwave")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblServingCart" runat="server" Text='<%#(Eval("servingCart").ToString() == "0") ? " " : "Serving Cart: "+Eval("servingCart")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblWaterCooler" runat="server" Text='<%#(Eval("waterCooler").ToString() == "0") ? " " : "Water Cooler: "+Eval("waterCooler")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblStool" runat="server" Text='<%#(Eval("stool").ToString() == "0") ? " " : "Stool: "+Eval("stool")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblMicrowaveStand" runat="server" Text='<%#(Eval("microwaveStand").ToString() == "0") ? " " : "Microwave Stand: "+Eval("microwaveStand")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblKitchenBench" runat="server" Text='<%#(Eval("kitchenBench").ToString() == "0") ? " " : "Kitchen Bench: "+Eval("kitchenBench")  %>'></asp:Label>


                               

                             </div>
                                      </div>
                                  </div>
                         
                            <asp:SqlDataSource ID="srcKitchenTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(suiteChairs + largeTable + smallTable + highChair + ironingBoard
			+ kitchenCabinet + microwave + servingCart + waterCooler + stool
			+ microwaveStand + kitchenBench) as 'Kitchen' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>

                            </ItemTemplate>
                            </asp:FormView>
                         <br />

                         <asp:FormView
                        ID="fvBedroom"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Bedroom</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

<%--                            <asp:FormView
                                    ID="fvBedroomTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcBedroomTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Bedroom").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>
                            <br />--%>

                                <asp:Label ID="lblKingBedSet" runat="server" Text='<%#(Eval("kingBedSet").ToString() == "0") ? " " : "King Bed Set: "+Eval("kingBedSet")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblQueenBedSet" runat="server" Text='<%#(Eval("queenBedSet").ToString() == "0") ? " " : "Queen Bed Set: "+Eval("queenBedSet")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblDoubleBedSet" runat="server" Text='<%#(Eval("doubleBedSet").ToString() == "0") ? " " : "Double Bed Set: "+Eval("doubleBedSet")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblSingleBedSet" runat="server" Text='<%#(Eval("singleBedSet").ToString() == "0") ? " " : "Single Bed Set: "+Eval("singleBedSet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblBunkBedSet" runat="server" Text='<%#(Eval("bunkBedSet").ToString() == "0") ? " " : "Bunk Bed Set: "+Eval("bunkBedSet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDayBedSet" runat="server" Text='<%#(Eval("dayBedSet").ToString() == "0") ? " " : "Day Bed Set: "+Eval("dayBedSet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRollawayBedSet" runat="server" Text='<%#(Eval("rollawayBedSet").ToString() == "0") ? " " : "Rollaway Bed Set: "+Eval("rollawayBedSet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblBookShelvedBedroom" runat="server" Text='<%#(Eval("bookShelvesBedroom").ToString() == "0") ? " " : "Bookshelves: "+Eval("bookShelvesBedroom")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvBedroomTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcBedroomTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Bedroom").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>
                            <br />

                                     <asp:Label ID="lblBedroomChair" runat="server" Text='<%#(Eval("bedroomChair").ToString() == "0") ? " " : "Bedroom Chair: "+Eval("bedroomChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRockerChairBedroom" runat="server" Text='<%#(Eval("rockerChairBedroom").ToString() == "0") ? " " : "Rocker Chair: "+Eval("rockerChairBedroom")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLoungeChair" runat="server" Text='<%#(Eval("loungeChair").ToString() == "0") ? " " : "Lounge Chair: "+Eval("loungechair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblArmoireSmall" runat="server" Text='<%#(Eval("armoireSmall").ToString() == "0") ? " " : "Small Armoire: "+Eval("armoireSmall")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblArmoireLarge" runat="server" Text='<%#(Eval("armoireLarge").ToString() == "0") ? " " : "Large Armoire: "+Eval("armoireLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallChest" runat="server" Text='<%#(Eval("chestSmall").ToString() == "0") ? " " : "Small Chest: "+Eval("chestSmall")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeChest" runat="server" Text='<%#(Eval("chestLarge").ToString() == "0") ? " " : "Large Chest: "+Eval("chestLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblVanityBench" runat="server" Text='<%#(Eval("vanityBench").ToString() == "0") ? " " : "Vanity Bench: "+Eval("vanityBench")  %>'></asp:Label>

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblBedroomBench" runat="server" Text='<%#(Eval("bedroomBench").ToString() == "0") ? " " : "Bedroom Bench: "+Eval("bedroomBench")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblsingleDresser" runat="server" Text='<%#(Eval("singleDresser").ToString() == "0") ? " " : "Single Dresser: "+Eval("singleDresser")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDoubleDresser" runat="server" Text='<%#(Eval("doubleDresser").ToString() == "0") ? " " : "Double Dresser: "+Eval("doubleDresser")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lbltripleDresser" runat="server" Text='<%#(Eval("tripleDresser").ToString() == "0") ? " " : "Triple Dresser: "+Eval("tripleDresser")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblVanityDresser" runat="server" Text='<%#(Eval("vanityDresser").ToString() == "0") ? " " : "Vanity Dresser: "+Eval("vanityDresser")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFloorLampBedroom" runat="server" Text='<%#(Eval("floorLampBedroom").ToString() == "0") ? " " : "Floor Lamp: "+Eval("floorLampBedroom")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblNightTable" runat="server" Text='<%#(Eval("nightTable").ToString() == "0") ? " " : "Night Table: "+Eval("nightTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallWardobe" runat="server" Text='<%#(Eval("smallWardrobe").ToString() == "0") ? " " : "Small Wardrobe: "+Eval("smallWardrobe")  %>'></asp:Label>

                                    </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblLargeWardrobe" runat="server" Text='<%#(Eval("largeWardrobe").ToString() == "0") ? " " : "Large Wardrobe: "+Eval("largeWardrobe")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblJewleryArmoire" runat="server" Text='<%#(Eval("jewleryArmoire").ToString() == "0") ? " " : "Jewler yArmoire: "+Eval("jewleryArmoire")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTableLampBedroom" runat="server" Text='<%#(Eval("tableLampBedroom").ToString() == "0") ? " " : "Table Lamp: "+Eval("tableLampBedroom")  %>'></asp:Label>


                               

                             </div>
                                  </div>
                                </div>
                         
                            <asp:SqlDataSource ID="srcBedroomTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(kingBedSet + queenBedSet + doubleBedSet + singleBedSet + bunkBedSet + dayBedSet
			+ rollawayBedSet + bookShelvesBedroom + bedroomChair + rockerChairBedroom
			+ loungeChair + armoireSmall + armoireLarge + chestSmall + chestLarge + vanityBench
			+ bedroomBench + singleDresser + doubleDresser + tripleDresser + vanityDresser
			+ floorLampBedroom + nightTable + smallWardrobe + largeWardrobe + jewleryArmoire
			+ tableLampBedroom) as 'Bedroom' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>

                            </ItemTemplate>
                            </asp:FormView>

                         <asp:FormView
                        ID="fvNursery"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Nursery</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvNurseryTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcNurseryTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Nursery").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                            <br />    

                                <asp:Label ID="lblBabyCarriage" runat="server" Text='<%#(Eval("babyCarriageNursery").ToString() == "0") ? " " : "Baby Carriage: "+Eval("babyCarriageNursery")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblBassinette" runat="server" Text='<%#(Eval("bassinette").ToString() == "0") ? " " : "Bassinette: "+Eval("bassinette")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblYouthBed" runat="server" Text='<%#(Eval("youthBed").ToString() == "0") ? " " : "Youth Bed: "+Eval("youthBed")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblChildchair" runat="server" Text='<%#(Eval("childChair").ToString() == "0") ? " " : "Child Chair: "+Eval("childChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblhighChairNursery" runat="server" Text='<%#(Eval("highChairNursery").ToString() == "0") ? " " : "High Chair: "+Eval("highChairNursery")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblChestNursery" runat="server" Text='<%#(Eval("chestNursery").ToString() == "0") ? " " : "Chest: "+Eval("chestNursery")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblToyChest" runat="server" Text='<%#(Eval("toyChest").ToString() == "0") ? " " : "Toy Chest: "+Eval("toyChest")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblBabyCrib" runat="server" Text='<%#(Eval("babyCrib").ToString() == "0") ? " " : "Baby Crib: "+Eval("babyCrib")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblPlayPen" runat="server" Text='<%#(Eval("playPen").ToString() == "0") ? " " : "Playpen: "+Eval("playPen")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPlasticToySmall" runat="server" Text='<%#(Eval("plasticToySmall").ToString() == "0") ? " " : "Small Plastic Toy: "+Eval("plasticToySmall")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPlastictoyLarge" runat="server" Text='<%#(Eval("plasticToyLarge").ToString() == "0") ? " " : "Large Plastic Toy: "+Eval("plasticToyLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblChildTable" runat="server" Text='<%#(Eval("childTable").ToString() == "0") ? " " : "Child Table: "+Eval("childTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDraftingTable" runat="server" Text='<%#(Eval("draftingTable").ToString() == "0") ? " " : "Drafting Table: "+Eval("draftingTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeGlass" runat="server" Text='<%#(Eval("largeGlass").ToString() == "0") ? " " : "Large Glass: "+Eval("largeGlass")  %>'></asp:Label>


                                

                                </div>

                             </div>
                                  </div>

                            <asp:SqlDataSource ID="srcNurseryTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(babyCarriageNursery + bassinette + youthBed + childChair + highChairNursery
			+ chestNursery + toyChest + babyCrib + playpen + plasticToySmall + plasticToyLarge
			+ childTable + draftingTable + largeGlass) as 'Nursery' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>
                         

                            </ItemTemplate>
                            </asp:FormView>




                         <asp:FormView
                        ID="fvPorchOutdoor"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Porch/Outdoor</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

<%--                            <asp:FormView
                                    ID="fvPorchOutdoortot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcPorchOutdoorTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("porchOutdoor").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>--%>
                            

                                <asp:Label ID="lblGrillSmall" runat="server" Text='<%#(Eval("grillSmall").ToString() == "0") ? " " : "Small Grill: "+Eval("grillSmall")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblGrillLarge" runat="server" Text='<%#(Eval("grillLarge").ToString() == "0") ? " " : "Large Grill: "+Eval("grillLarge")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblChairAlumPlast" runat="server" Text='<%#(Eval("chairAlumPlast").ToString() == "0") ? " " : "Chair Alum/Plast: "+Eval("chairAlumPlast")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblChairMetal" runat="server" Text='<%#(Eval("chairMetal").ToString() == "0") ? " " : "Metal Chair: "+Eval("chairMetal")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblWoodChair" runat="server" Text='<%#(Eval("chairWood").ToString() == "0") ? " " : "Wood Chair: "+Eval("chairWood")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblhoseAndtools" runat="server" Text='<%#(Eval("hoseAndTools").ToString() == "0") ? " " : "Hose And Tools: "+Eval("hoseAndTools")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblGlider" runat="server" Text='<%#(Eval("glider").ToString() == "0") ? " " : "Glider: "+Eval("glider")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLadderSixFoot" runat="server" Text='<%#(Eval("ladderSixFoot").ToString() == "0") ? " " : "Ladder, 6ft Or Less: "+Eval("ladderSixFoot")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblLadderEightFoot" runat="server" Text='<%#(Eval("ladderEightFoot").ToString() == "0") ? " " : "Ladder, 6-8ft: "+Eval("ladderEightFoot")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLadderExtension" runat="server" Text='<%#(Eval("ladderExtension").ToString() == "0") ? " " : "Ladder, Extension: "+Eval("ladderExtension")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLawnEdger" runat="server" Text='<%#(Eval("lawnEdger").ToString() == "0") ? " " : "Lawn Edger: "+Eval("lawnEdger")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLawnMowerHand" runat="server" Text='<%#(Eval("lawnMowerHand").ToString() == "0") ? " " : "Lawn Mower - Hand: "+Eval("lawnMowerHand")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLawnMowerPower" runat="server" Text='<%#(Eval("lawnMowerPower").ToString() == "0") ? " " : "Lawn Mower - Power: "+Eval("lawnMowerPower")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLawnMowerRide" runat="server" Text='<%#(Eval("lawnMowerRide").ToString() == "0") ? " " : "Lawn Mower - Ride: "+Eval("lawnMowerRide")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLeafSweeper" runat="server" Text='<%#(Eval("leafSweeper").ToString() == "0") ? " " : "Leaf Sweeper: "+Eval("leafSweeper")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPicnicTable" runat="server" Text='<%#(Eval("picnicTable").ToString() == "0") ? " " : "Picnic Table: "+Eval("picnicTable")  %>'></asp:Label>

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvPorchOutdoortot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcPorchOutdoorTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("porchOutdoor").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                                   <br />


                                     <asp:Label ID="lblOutdoorBench" runat="server" Text='<%#(Eval("outdoorBench").ToString() == "0") ? " " : "Outdoor Bench: "+Eval("outdoorBench")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPlasticTote" runat="server" Text='<%#(Eval("plasticTote").ToString() == "0") ? " " : "Plastic Tote: "+Eval("plasticTote")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLawnRoller" runat="server" Text='<%#(Eval("lawnRoller").ToString() == "0") ? " " : "Lawn Roller: "+Eval("lawnRoller")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSandBox" runat="server" Text='<%#(Eval("sandBox").ToString() == "0") ? " " : "Sand Box: "+Eval("sandBox")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSpreader" runat="server" Text='<%#(Eval("spreader").ToString() == "0") ? " " : "Spreader: "+Eval("spreader")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSnowBlower" runat="server" Text='<%#(Eval("snowBlower").ToString() == "0") ? " " : "Snow Blower: "+Eval("snowBlower")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallOutdoorTable" runat="server" Text='<%#(Eval("smallTableOutdoor").ToString() == "0") ? " " : "Small Outdoor Table: "+Eval("smallTableOutdoor")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeOutdoorTable" runat="server" Text='<%#(Eval("largeTableOutdoor").ToString() == "0") ? " " : "Large Outdoor Table: "+Eval("largeTableOutdoor")  %>'></asp:Label>

                                    </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblUmbrella" runat="server" Text='<%#(Eval("umbrella").ToString() == "0") ? " " : "Umbrella: "+Eval("umbrella")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblChildWagon" runat="server" Text='<%#(Eval("childWagon").ToString() == "0") ? " " : "Child Wagon: "+Eval("childWagon")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblWheelBarrow" runat="server" Text='<%#(Eval("whellBarrow").ToString() == "0") ? " " : "Wheel Barrow: "+Eval("whellBarrow")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallAirCompressor" runat="server" Text='<%#(Eval("smallAirCompressor").ToString() == "0") ? " " : "Small Air Compressor: "+Eval("smallAirCompressor")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeAirCompressor" runat="server" Text='<%#(Eval("largeAirCompressor").ToString() == "0") ? " " : "Large Air Compressor: "+Eval("largeAirCompressor")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblGorillaRack" runat="server" Text='<%#(Eval("gorillaRack").ToString() == "0") ? " " : "Gorilla Rack: "+Eval("gorillaRack")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblutilityCabinet" runat="server" Text='<%#(Eval("utilityCabinet").ToString() == "0") ? " " : "Utility Cabinet: "+Eval("utilityCabinet")  %>'></asp:Label>


                               

                                </div>

                             </div>
                                  </div>

                            <asp:SqlDataSource ID="srcPorchOutdoorTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="
select sum(grillSmall + grillLarge + chairalumPlast + chairMetal + chairWood + hoseAndTools
			+ glider + ladderSixFoot + ladderEightFoot + ladderExtension + lawnEdger + lawnMowerHand
			+ lawnMowerPower + lawnMowerRide + leafSweeper + childSlide + childGym + childSwingMed
			+ childSwingLarge + picnicTable + outdoorBench + plasticTote + lawnRoller + sandBox
			+ spreader + snowBlower + smallTableOutdoor + largeTableOutdoor + umbrella + childWagon
			+ whellBarrow + smallAirCompressor + largeAirCompressor + gorillaRack + utilityCabinet) as 'porchOutdoor' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>
                         

                            </ItemTemplate>
                            </asp:FormView>



                         <asp:FormView
                        ID="fvAppliances"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Appliance</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                <asp:Label ID="lblAirconSmall" runat="server" Text='<%#(Eval("airconSmall").ToString() == "0") ? " " : "Small Air Conditioner: "+Eval("airconSmall")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblAirconLarge" runat="server" Text='<%#(Eval("airconLarge").ToString() == "0") ? " " : "Large Air Conditioner: "+Eval("airconLarge")  %>'></asp:Label>


                                <br />

                              
                                
                                    <asp:Label ID="lblDehumid" runat="server" Text='<%#(Eval("dehumid").ToString() == "0") ? " " : "Dehumidifier: "+Eval("dehumid")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDishwasher" runat="server" Text='<%#(Eval("dishWasher").ToString() == "0") ? " " : "Dish Washer: "+Eval("dishWasher")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFreezerTen" runat="server" Text='<%#(Eval("freezerTen").ToString() == "0") ? " " : "Freezer - 10: "+Eval("freezerTen")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFreezerFifteen" runat="server" Text='<%#(Eval("freezerFifteen").ToString() == "0") ? " " : "Freezer - 15: "+Eval("freezerFifteen")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFreezerOver" runat="server" Text='<%#(Eval("freezerOver").ToString() == "0") ? " " : "Freezer - Over: "+Eval("freezerOver")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvAppliancesTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcAppliancesTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Appliances").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                                   <br />

                                     <asp:Label ID="lblRangeWide" runat="server" Text='<%#(Eval("rangeWide").ToString() == "0") ? " " : "Range, Wide: "+Eval("rangeWide")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRefrigeratorSix" runat="server" Text='<%#(Eval("refrigeratorSix").ToString() == "0") ? " " : "Refrigerator - 6: "+Eval("refrigeratorSix")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRefrigeratorTen" runat="server" Text='<%#(Eval("refrigeratorTen").ToString() == "0") ? " " : "Refrigerator - 10: "+Eval("refrigeratorTen")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblRefrigeratorOver" runat="server" Text='<%#(Eval("refrigeratorOver").ToString() == "0") ? " " : "Rerfigerator - Over: "+Eval("refrigeratorOver")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSewingMachine" runat="server" Text='<%#(Eval("sewingMachine").ToString() == "0") ? " " : "Sewing Machine: "+Eval("sewingMachine")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSewingWithCAB" runat="server" Text='<%#(Eval("sewingWithCAB").ToString() == "0") ? " " : "Sewing W/CAB: "+Eval("sewingWithCAB")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblVaccuumCleaner" runat="server" Text='<%#(Eval("vacuumCleaner").ToString() == "0") ? " " : "Vacuum Cleaner: "+Eval("vacuumCleaner")  %>'></asp:Label>


                           

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblHuimd" runat="server" Text='<%#(Eval("humid").ToString() == "0") ? " " : "Humidifier: "+Eval("humid")  %>'></asp:Label>
                                    
                                <br />

                                     <asp:Label ID="lblAirPurifier" runat="server" Text='<%#(Eval("airPurifier").ToString() == "0") ? " " : "Air Purifier: "+Eval("airPurifier")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblShopVac" runat="server" Text='<%#(Eval("shopVac").ToString() == "0") ? " " : "Shop Vac: "+Eval("shopVac")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblWasher" runat="server" Text='<%#(Eval("washer").ToString() == "0") ? " " : "Washer: "+Eval("washer")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblDryer" runat="server" Text='<%#(Eval("dryer").ToString() == "0") ? " " : "Dryer: "+Eval("dryer")  %>'></asp:Label>


                               

                                </div>

                             </div>
                                  </div>

                    <asp:SqlDataSource ID="srcAppliancesTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(airconSmall + airconLarge + babyCarriage + dehumid + dishWasher + freezerTen
			+ freezerFifteen + freezerOver + rangeWide + refrigeratorSix + refrigeratorTen + refrigeratorOver + sewingMachine
			+ sewingWithCAB + steamCleaner + trashCompactor + vacuumCleaner + humid
			+ airPurifier + shopVac + washer + dryer) as 'Appliances' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>
                         

                            </ItemTemplate>
                            </asp:FormView>



                         <asp:FormView
                        ID="fvMisc"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Miscellaneous</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                <asp:Label ID="lblArtificalTree" runat="server" Text='<%#(Eval("fakeTree").ToString() == "0") ? " " : "Artificial Tree: "+Eval("fakeTree")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblBarbellWeights" runat="server" Text='<%#(Eval("barbellWeights").ToString() == "0") ? " " : "Weights: "+Eval("barbellWeights")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblClothesBasket" runat="server" Text='<%#(Eval("clothesBasket").ToString() == "0") ? " " : "Clothes Basket: "+Eval("clothesBasket")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblBike" runat="server" Text='<%#(Eval("bike").ToString() == "0") ? " " : "Bike: "+Eval("bike")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblBowlingBall" runat="server" Text='<%#(Eval("bowlingBall").ToString() == "0") ? " " : "Bowling Set: "+Eval("bowlingBall")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblCardTable" runat="server" Text='<%#(Eval("cardTable").ToString() == "0") ? " " : "Card Table: "+Eval("cardTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblClothesHamper" runat="server" Text='<%#(Eval("clothesHamper").ToString() == "0") ? " " : "Clothes Hamper: "+Eval("clothesHamper")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblCooler" runat="server" Text='<%#(Eval("cooler").ToString() == "0") ? " " : "Cooler: "+Eval("cooler")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblFoldingcot" runat="server" Text='<%#(Eval("foldingCot").ToString() == "0") ? " " : "Folding Cot: "+Eval("foldingCot")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblOfficeDeskLarge" runat="server" Text='<%#(Eval("officeDeskLarge").ToString() == "0") ? " " : "Large Office Desk: "+Eval("officeDeskLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblComputerDesk" runat="server" Text='<%#(Eval("computerDesk").ToString() == "0") ? " " : "Computer Desk: "+Eval("computerDesk")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblStudentDesk" runat="server" Text='<%#(Eval("studentDesk").ToString() == "0") ? " " : "Student Desk: "+Eval("studentDesk")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblOfficeChair" runat="server" Text='<%#(Eval("officeChair").ToString() == "0") ? " " : "Office Chair: "+Eval("officeChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSecretaryChair" runat="server" Text='<%#(Eval("secretaryChair").ToString() == "0") ? " " : "Secretary Chair: "+Eval("secretaryChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPrinterStand" runat="server" Text='<%#(Eval("printerStand").ToString() == "0") ? " " : "Printer Stand: "+Eval("printerStand")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblExerciseEquipment" runat="server" Text='<%#(Eval("exerciseEquip").ToString() == "0") ? " " : "Exercise Equipment: "+Eval("exerciseEquip")  %>'></asp:Label>

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblFan" runat="server" Text='<%#(Eval("miscFan").ToString() == "0") ? " " : "Fan: "+Eval("miscFan")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFernPlantStand" runat="server" Text='<%#(Eval("fernPlantStand").ToString() == "0") ? " " : "Fern Plant Stand: "+Eval("fernPlantStand")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblcardboardCabinet" runat="server" Text='<%#(Eval("cardboardCabinet").ToString() == "0") ? " " : "Cardboard Cabinet: "+Eval("cardboardCabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTwoDrawerCabinet" runat="server" Text='<%#(Eval("twoDrawerCabinet").ToString() == "0") ? " " : "Two Drawer Cabinet: "+Eval("twoDrawerCabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFourDrawerCabinet" runat="server" Text='<%#(Eval("fourDrwaerCabinet").ToString() == "0") ? " " : "Four Drawer Cabinet: "+Eval("fourDrwaerCabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblfishingPole" runat="server" Text='<%#(Eval("fishingPole").ToString() == "0") ? " " : "Fishing Pole: "+Eval("fishingPole")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblFoldingChair" runat="server" Text='<%#(Eval("foldingChair").ToString() == "0") ? " " : "Folding Chair: "+Eval("foldingChair")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblwineRack" runat="server" Text='<%#(Eval("wineRack").ToString() == "0") ? " " : "Wine Rack: "+Eval("wineRack")  %>'></asp:Label>

                                    </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:FormView
                                    ID="fvMiscTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcMisctot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Misc").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                                   <br />

                                     <asp:Label ID="lblfootLocker" runat="server" Text='<%#(Eval("footLocker").ToString() == "0") ? " " : "Foot Locker: "+Eval("footLocker")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeCardTable" runat="server" Text='<%#(Eval("cardTableLarge").ToString() == "0") ? " " : "Large Card Table: "+Eval("cardTableLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblGolfEquip" runat="server" Text='<%#(Eval("golfEquip").ToString() == "0") ? " " : "Golf Equipment: "+Eval("golfEquip")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSpaceHeater" runat="server" Text='<%#(Eval("spaceHeater").ToString() == "0") ? " " : "Space Heater: "+Eval("spaceHeater")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPingPongTable" runat="server" Text='<%#(Eval("pingpongTable").ToString() == "0") ? " " : "Ping Pong Table: "+Eval("pingpongTable")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPoolTablecomp" runat="server" Text='<%#(Eval("poolTablecomp").ToString() == "0") ? " " : "Pool Table Comp: "+Eval("poolTableComp")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPoolTableSlate" runat="server" Text='<%#(Eval("poolTableSlate").ToString() == "0") ? " " : "Pool Table Slate: "+Eval("poolTableSlate")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblPowerTool" runat="server" Text='<%#(Eval("powerTool").ToString() == "0") ? " " : "Power Tool: "+Eval("powerTool")  %>'></asp:Label>

                                     </div>
                                <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblPowerToolStand" runat="server" Text='<%#(Eval("powerToolStand").ToString() == "0") ? " " : "Power Tool Stand: "+Eval("powerToolStand")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSkis" runat="server" Text='<%#(Eval("skis").ToString() == "0") ? " " : "Skis: "+Eval("skis")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSled" runat="server" Text='<%#(Eval("sled").ToString() == "0") ? " " : "Sled: "+Eval("sled")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSuitCase" runat="server" Text='<%#(Eval("suitCase").ToString() == "0") ? " " : "Suitcase: "+Eval("suitCase")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTackleBox" runat="server" Text='<%#(Eval("tackleBox").ToString() == "0") ? " " : "Tackle Box: "+Eval("tackleBox")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lbltire" runat="server" Text='<%#(Eval("tire").ToString() == "0") ? " " : "Tire: "+Eval("tire")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTireAndRims" runat="server" Text='<%#(Eval("tireAndRims").ToString() == "0") ? " " : "Tire and Rims: "+Eval("tireAndRims")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallToolchest" runat="server" Text='<%#(Eval("toolChestSmall").ToString() == "0") ? " " : "Small Tool Chest: "+Eval("toolChestSmall")  %>'></asp:Label>

                                     </div>
                               <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblMedToolChest" runat="server" Text='<%#(Eval("toolChestMed").ToString() == "0") ? " " : "Med Tool Chest: "+Eval("toolChestMed")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeToolChest" runat="server" Text='<%#(Eval("toolChestLarge").ToString() == "0") ? " " : "Large Tool Chest: "+Eval("toolChestLarge")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lbltoolChestXL" runat="server" Text='<%#(Eval("toolChestXL").ToString() == "0") ? " " : "XL Tool Chest: "+Eval("toolChestXL")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTrashCan" runat="server" Text='<%#(Eval("trashCan").ToString() == "0") ? " " : "Trash Can: "+Eval("trashCan")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTrampoline" runat="server" Text='<%#(Eval("trampoline").ToString() == "0") ? " " : "Trampoline: "+Eval("trampoline")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTreadmill" runat="server" Text='<%#(Eval("treadmill").ToString() == "0") ? " " : "Treadmill: "+Eval("treadmill")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblTricycle" runat="server" Text='<%#(Eval("tricycle").ToString() == "0") ? " " : "Tricycle: "+Eval("tricycle")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblWorkBench" runat="server" Text='<%#(Eval("workBench").ToString() == "0") ? " " : "Workbench: "+Eval("workBench")  %>'></asp:Label>

                                    </div>
                              <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                                     <asp:Label ID="lblSewingCabinet" runat="server" Text='<%#(Eval("sewingCabinet").ToString() == "0") ? " " : "Sewing Cabinet: "+Eval("sewingCabinet")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeSafe" runat="server" Text='<%#(Eval("largeSafe").ToString() == "0") ? " " : "Large Safe: "+Eval("largeSafe")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblMedSafe" runat="server" Text='<%#(Eval("medSafe").ToString() == "0") ? " " : "Med Safe: "+Eval("medSafe")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblSmallSafe" runat="server" Text='<%#(Eval("smallSage").ToString() == "0") ? " " : "Small Safe: "+Eval("smallSage")  %>'></asp:Label>
                               
                                <br />

                                     <asp:Label ID="lblgunSafe" runat="server" Text='<%#(Eval("gunSafe").ToString() == "0") ? " " : "Gun Safe: "+Eval("gunSafe")  %>'></asp:Label>
                               
                                <br />

                                     <asp:Label ID="lblStatue" runat="server" Text='<%#(Eval("statue").ToString() == "0") ? " " : "Statue: "+Eval("statue")  %>'></asp:Label>
                               

                              

                                </div>

                             </div>
                                  </div>

                            <asp:SqlDataSource ID="srcMiscTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(fakeTree+barbellWeights+clothesBasket+bike+bowlingBall+cardTable+clothesHamper
			+ cooler + foldingCot + officeDeskLarge + computerDesk + studentDesk 
			+ officeChair + secretaryChair + printerStand + exerciseEquip + miscFan 
			+ fernPlantStand + cardboardCabinet + twoDrawerCabinet + fourDrwaerCabinet
			+ fishingPole + fireArms + foldingChair + wineRack + footLocker + cardTableLarge
			+ golfEquip + spaceHeater + metalShelves + pingpongTable + poolTableComp + poolTableSlate + hottubFour
			+ hottubSix + hottubEight + powerTool + powerToolStand + skis + sled + suitCase + tackleBox
			+ tire + tireAndRims + toolChestSmall + toolChestMed + toolChestLarge + toolChestXL
			+ trashCan + trampoline + treadmill + tricycle + workBench + sewingCabinet + largeSafe
			+ medSafe + smallSage + gunSafe + statue) as 'Misc' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>
                         

                            </ItemTemplate>
                            </asp:FormView>




                         <asp:FormView
                        ID="fvPackingOrder"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Packing</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

                            <asp:FormView
                                    ID="fvPackingTot"
                                    DefaultMode="ReadOnly"
                                    DataSourceID="srcPackingTot"
                                    runat="server">
                                      <ItemTemplate>
                                    
                                          <asp:Label ID="lblTotal" runat="server" Text='<%#(Eval("Packing").ToString() == "0") ? "No Items Selected!" : " "  %>'></asp:Label>

                                      </ItemTemplate>


                                  </asp:FormView>

                                   <br />

                                <asp:Label ID="lblBar" runat="server" Text='<%#(Eval("dishPack").ToString() == "0") ? " " : "Dish Pack: "+Eval("dishPack")  %>'></asp:Label>
                            
                               
                                <br />
                                    
                                <asp:Label ID="lblWardrobeLayFlat" runat="server" Text='<%#(Eval("wardrobeLayFlat").ToString() == "0") ? " " : "Wardrobe Lay Flat: "+Eval("wardrobeLayFlat")  %>'></asp:Label>


                                <br />

                              <asp:Label ID="lblWardrobeStandup" runat="server" Text='<%#(Eval("wardrobeStandup").ToString() == "0") ? " " : "Wardrobe Standup: "+Eval("wardrobeStandup")  %>'></asp:Label>


                                <br />
                                
                                    <asp:Label ID="lblsmallBooks" runat="server" Text='<%#(Eval("smallBooks").ToString() == "0") ? " " : "Small Books: "+Eval("smallBooks")  %>'></asp:Label>
                                <br />
                                        <br />
                                   
                        </div>
                            
                                    <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">
                           
                                     <asp:Label ID="lblSmallCartons" runat="server" Text='<%#(Eval("smallCartons").ToString() == "0") ? " " : "Small Cartons: "+Eval("smallCartons")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblMedCartons" runat="server" Text='<%#(Eval("mediumCartons").ToString() == "0") ? " " : "Medium Cartons: "+Eval("mediumCartons")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblLargeCartons" runat="server" Text='<%#(Eval("largeCartons").ToString() == "0") ? " " : "Large Cartons: "+Eval("largeCartons")  %>'></asp:Label>


                                <br />
                                     <asp:Label ID="lblXLCarton" runat="server" Text='<%#(Eval("XLCartons").ToString() == "0") ? " " : "XL Cartons: "+Eval("XLCartons")  %>'></asp:Label>

                                   <br />

                                     <asp:Label ID="lblMirrorCarton" runat="server" Text='<%#(Eval("mirrorCarton").ToString() == "0") ? " " : "Mirror Cartons: "+Eval("mirrorCarton")  %>'></asp:Label>
                                     <br />
                                        <br />
                                        <br />

                            

                                </div>

                             </div>
                                  </div>

                            <asp:SqlDataSource ID="srcPackingTot" runat="server"
                                       ConnectionString="<%$ ConnectionStrings:Connect %>"
                                       SelectCommand="select sum(dishPack + wardrobeLayFlat + wardrobeStandup + smallBooks + smallCartons
			+ mediumCartons + largeCartons + XLCartons + mirrorCarton) as 'Packing' from cubeSheet where serviceID=@serviceID">
                                     <SelectParameters>
                                         <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                     </SelectParameters>
                                  </asp:SqlDataSource>
                         

                            </ItemTemplate>
                            </asp:FormView>




                     </div>


                 




                         


                         <asp:SqlDataSource
                                ID="srcCubeSheet"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                               
                            </asp:SqlDataSource>


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
