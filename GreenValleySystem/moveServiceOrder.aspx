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
                                    <h6 style="text-decoration:underline">Building Type</h6>
                                

                                <asp:Label ID="lblApartmentStatus" runat="server" Text='<%#(Eval("apartment").ToString() == "True") ? "Apartment Selected" : " " %>'></asp:Label>
                            
                               
                                <br />
                                    
                              

                                    <asp:Label ID="lblHouseStatus" runat="server" Text='<%#(Eval("house").ToString() == "True") ? "House Selected" : " " %>'></asp:Label>
                                <br />

                               

                                    <asp:Label ID="lblStorageUnitStatus" runat="server" Text='<%#(Eval("storageUnit").ToString() == "True") ? "Storage Unit Selected" : " " %>'></asp:Label>
                                <br />
                                
                                   

                                    <asp:Label ID="lbBusinessStatus" runat="server" Text='<%#(Eval("business").ToString() == "True") ? "Business Selected" : " " %>'></asp:Label>
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
                     <div class="form-group row justify-content-around">
                        
                           
                            <asp:FormView
                        ID="FormView2"
                        DefaultMode="ReadOnly"
                        DataSourceID="srcCubeSheet"
                        runat="server">
                            <EmptyDataTemplate>
                                No Building Type Selected
                            </EmptyDataTemplate>
                        <ItemTemplate>
                            <h6 style="text-align:center;text-decoration:underline">Living Room Information</h6>  
                            <div class="form-group row justify-content-around">
                                <div class="mb-2">
                                   
                                
                        <div class="form-group justify-content-around p-3" style="display:inline-block;vertical-align:middle;float:left">

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
