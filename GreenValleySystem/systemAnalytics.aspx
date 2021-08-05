<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="systemAnalytics.aspx.cs" Inherits="GreenValleySystem.systemAnalytics"  EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type='text/javascript' src='https://code.jquery.com/jquery-1.11.0.js'></script>
    <script type='text/javascript' src="https://rawgit.com/RobinHerbots/jquery.inputmask/3.x/dist/jquery.inputmask.bundle.js"></script>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" />
</head>
<body>

    
    <form id="form1" runat="server">
        <div class="container col-11">
            <div class="row">
          <asp:Button ID="Button1" runat="server" class="btn btn-primary btn-block mb-3" Text="Return to Home Page" OnClick="btnHome_Click" />
                <asp:Button ID="btnPrint" runat="server" class="btn btn-primary btn-block mb-3" Text="Print All Sheets" OnClick="btnPrint_Click" />
          

         <div class="card p-3 mb-6 col-12" style="border: 1px solid #bb9739; height:420px; overflow:scroll">
             <h2 class="text-center">Customers</h2>
             <asp:Button ID="btnPrintPhonebook" runat="server" Text="Print Customer List" OnClick="btnPrintPhonebook_Click" Class="btn btn-secondary" />
             <asp:GridView
                ID="gvPhonebook"
                runat="server"
                DataKeyNames="customerID"
                DataSourceID="srcPhonebook"
                AutoGenerateColumns="false"
                
                class="table table-bordered table-condensed table-hover"
                AllowPaging="false"
                OnSelectedIndexChanged="gvPhonebook_SelectedIndexChanged"
                OnRowDataBound="gvPhonebook_RowDataBound"
              
                PageSize="5"
                AllowSorting="true">
                <HeaderStyle BackColor="#266141" ForeColor="White" />
                <Columns>

                    <asp:BoundField DataField="First Name" HeaderText="First Name"
                         SortExpression="First Name"/>
                    <asp:BoundField DataField="Last Name" HeaderText="Last Name"
                         SortExpression="Last Name"/>

                    <asp:TemplateField HeaderText="Phone" SortExpression="Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblPHone" runat="server" Text='<%#(Eval("Phone").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%#(Eval("Email").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%#(Eval("Address").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="City" SortExpression="City">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%#(Eval("City").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="State" SortExpression="State">
                        <ItemTemplate>
                            <asp:Label ID="lblState" runat="server" Text='<%#(Eval("State").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Zip Code" SortExpression="ZipCode">
                        <ItemTemplate>
                            <asp:Label ID="lblZipCode" runat="server" Text='<%#(Eval("ZipCode").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Initial Contact" SortExpression="Initial Contact Date">
                        <ItemTemplate>
                            <asp:Label ID="lblInitialContact" runat="server" Text='<%#(Eval("Initial Contact Date").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
                
         <div class="card p-3 mb-6 col-12">
        </div>

                <br />

          <div class="container col-12">
            <div class="row">
                 <div class="card p-3 mb-6 col-4" style="border: 1px solid #bb9739; height:420px; overflow:scroll">
                     <h2 class="text-center">Hear About</h2>
                     <asp:Button ID="btnPrintHearAbout" runat="server" Text="Print Hear About" OnClick="btnPrintHearAbout_Click" Class="btn btn-secondary" />
                    <asp:GridView
                        ID="gvHearAbout"
                        runat="server"
                        DataKeyNames="Hear About"
                        DataSourceID="srcHearAbout"
                        AutoGenerateColumns="false"
                
                        class="table table-bordered table-condensed table-hover"
                        AllowPaging="false"
              
                        PageSize="5"
                        AllowSorting="true">
                        <HeaderStyle BackColor="#266141" ForeColor="White" />
                        <Columns>

                            <asp:BoundField DataField="Hear About" HeaderText="Hear About"
                                 SortExpression="Hear About"/>
                            <asp:BoundField DataField="Frequency" HeaderText="Frequency"
                                 SortExpression="Frequency"/>

                            
                        </Columns>
            </asp:GridView>

                </div>
                 <div class="card p-3 mb-6 col-4" style="border: 1px solid #bb9739; height:420px; overflow:scroll">
                     <h2 class="text-center">Zip Codes</h2>
                     <asp:Button ID="btnPrintZipCodes" runat="server" Text="Print Zip Codes" OnClick="btnPrintZipCodes_Click" Class="btn btn-secondary" />
                     <asp:GridView
                        ID="gvZipCodes"
                        runat="server"
                        DataKeyNames="zipcode"
                        DataSourceID="srcZipCodes"
                        AutoGenerateColumns="false"
                
                        class="table table-bordered table-condensed table-hover"
                        AllowPaging="false"
              
                        PageSize="5"
                        AllowSorting="true">
                        <HeaderStyle BackColor="#266141" ForeColor="White" />
                        <Columns>

                            <asp:BoundField DataField="city" HeaderText="City"
                                 SortExpression="city"/>
                            <asp:BoundField DataField="state" HeaderText="State"
                                 SortExpression="state"/>
                            <asp:BoundField DataField="zipcode" HeaderText="Zip Code"
                                 SortExpression="zipcode"/>
                            <asp:BoundField DataField="count" HeaderText="Frequency"
                                 SortExpression="count"/>

                     </Columns>
            </asp:GridView>

                </div>
                 <div class="card p-3 mb-6 col-4" style="border: 1px solid #bb9739; height:420px; overflow:scroll">
                     <h2 class="text-center">Storage Locations</h2>
                     <asp:Button ID="btnPrintStorage" runat="server" Text="Print Storage Locations" OnClick="btnPrintStorage_Click" Class="btn btn-secondary" />
                     <asp:GridView
                        ID="gvStorage"
                        runat="server"
                        DataKeyNames="Filled Storage Location"
                        DataSourceID="srcStorage"
                        AutoGenerateColumns="false"
                
                        class="table table-bordered table-condensed table-hover"
                        AllowPaging="false"
              
                        PageSize="5"
                        AllowSorting="true">
                        <HeaderStyle BackColor="#266141" ForeColor="White" />
                        <Columns>

                            <asp:BoundField DataField="Filled Storage Location" HeaderText="Filled Storage Location"
                                    SortExpression="Filled Storage Location"/>
                            <asp:BoundField DataField="Customer First Name" HeaderText="Customer First Name"
                                    SortExpression="Customer First Name"/>
                            <asp:BoundField DataField="Customer Last Name" HeaderText="Customer Last Name"
                                    SortExpression="Customer Last Name"/>
                        </Columns>
            </asp:GridView>
                            
                </div>
            </div>

              <div class="card p-3 mb-6 col-12">
        </div>

                <br />

              <div class="row">
                  <div class="card p-3 mb-6 col-12" style="border: 1px solid #bb9739; height:420px; overflow:scroll">
                      <h2 class="text-center">Cube Sheets</h2>
                      <asp:Button ID="btnPrintCubes" runat="server" Text="Print Cube Sheets" OnClick="btnPrintCubes_Click" Class="btn btn-secondary" />
                      <asp:GridView
                          ID="gvCubeSheet"
                          runat="server"
                          DataKeyNames="serviceID"
                          AutoGenerateColumns="true"
                          AllowSorting="true"
                          AllowPaging="false"
                          DataSourceID="srcCubeSheet"
                          class="table table-bordered table-condensed table-hover">
                          <HeaderStyle BackColor="#266141" ForeColor="White" />

                      </asp:GridView>
                  </div>
              </div>



        </div>





        </div>
            </div>

        <div class="card p-3 mb-6 col-12">
        </div>

                <br />

        <asp:SqlDataSource 
                 ID="srcPhonebook"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT customerID,firstName as 'First Name', lastName as 'Last Name', phoneNumber as 'Phone', altPhoneNumber as 'Alternate Phone', email as 'Email', streetAddress as 'Address',city as 'City',state as 'State',zipcode as 'ZipCode', format(initialContactDate,'MM/dd/yy') as 'Initial Contact Date', completion.positiveExperience as 'Positive Expereince'
                 FROM            completion CROSS JOIN
                         CUSTOMER group by customerID, firstName, lastName,phoneNumber,altPhoneNumber,email,streetAddress,city,state,zipcode,initialContactDate, positiveExperience"></asp:SqlDataSource>
        <asp:SqlDataSource 
                 ID="srcHearAbout"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT        hearAbout as 'Hear About', count(hearAbout) as 'Frequency'
                 FROM            CUSTOMER
                 GROUP BY	     hearAbout"></asp:SqlDataSource>
        <asp:SqlDataSource 
                 ID="srcZipCodes"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT        city, state, zipcode, count(zipcode) as 'count'
                 FROM            ADDRESSES
                 group by city,state,zipcode"></asp:SqlDataSource>
        <asp:SqlDataSource 
                 ID="srcStorage"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT        STORAGE.storageLocation as 'Filled Storage Location', CUSTOMER.firstName as 'Customer First Name', CUSTOMER.lastName as 'Customer Last Name'
                 FROM            STORAGE INNER JOIN
                         AUCTIONSTORAGE ON STORAGE.storageID = AUCTIONSTORAGE.storageID INNER JOIN
                         SERVICE ON AUCTIONSTORAGE.serviceID = SERVICE.serviceID INNER JOIN
                         CUSTOMER ON SERVICE.customerID = CUSTOMER.customerID"></asp:SqlDataSource>
        <asp:SqlDataSource 
                 ID="srcServices"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT        SERVICE.serviceType as 'Type', format(SERVICE.serviceDeadlineStart, 'MM/dd/yy') AS 'Start Date', format(SERVICE.serviceDeadlineEnd, 'MM/dd/yy') AS 'Deadline End Date', CUSTOMER.firstName as 'First Name', CUSTOMER.lastName as 'Last Name', serviceEvents.serviceEvent as 'Progress'
                 FROM            SERVICE INNER JOIN
                         CUSTOMER ON SERVICE.customerID = CUSTOMER.customerID INNER JOIN
                         SERVICEHISTORY ON SERVICE.serviceID = SERVICEHISTORY.serviceID INNER JOIN
                         serviceEvents ON SERVICEHISTORY.eventID = serviceEvents.eventID"></asp:SqlDataSource>
        <asp:SqlDataSource 
            ID="srcCubeSheet"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Connect %>"
            SelectCommand="SELECT        CUSTOMER.firstName as 'First Name', CUSTOMER.lastName as 'Last Name', cubeSheet.serviceID as 'serviceID', bar as 'Bar',pianoBench as 'Piano Bench',largeBookcase as 'Large Book Case',	bookShelves	as 'Book Shelves',cabinet as 'Cabinet',straightChair as 'Straight Chair',armChair as 'Arm Chair',	rockerChair as 'Rocker Chair',	occasionalChair as 'Occasional Chair',	overStuffedChair as 'Overstuffed Chair',	cedarChest as 'Cedar Chest',	computer as 'Computer',	smallDesk as 'Small Desk',	ottoman as 'Ottoman',	secretaryDesk as 'Secretary Desk',	ETcetner as 'Entertainment Center',	fireplaceEquipment as 'Fireplace Equipment',	footStool as 'Foot Stool',	grandClock as 'Grandfather Clock',	coatRack as 'Coat Rack',	coatRackLarge as 'Large Coat Rack',	floorLamp as 'Floor Lamp',	magazineRack as 'Magazine Rack',	musicCabinet as 'Music Cabinet',	smallOrgan as 'Small Organ',	pianoBabyGrUpr as 'Baby Grand / Upper Piano',	pianoParlorGrd as 'Parlor Grand Piano',	pianoSpinet as 'Spinet Piano',	radiotTable as 'Radio Table',	recordPlayerPortable as 'Portable Record Player',	rugPadSmall as 'Small Rug/Pad',	rugPadLarge as 'Large Rug/Pad',	sofaRattanWicker as 'Rattan Wicker Sofa',	sofaSectional as 'Sectional Sofa',	loveSeat as 'Love Seat',	threeCushion as 'Three Cushion',	fourCushion as 'Four Cuschion',	futon as 'Futon',	stereoComponent as 'Stereo Component',	console as 'Console',	speakerPair as 'Speakers',	tableStandard as 'Standard Table',	tableCoffee as 'Coffee Table',	tableEnd as 'Endtable',	phoneStand as 'Phone Stand',	flatScreenSmall	as 'Small Flatscreen',flatScreenLarge as 'Large Flatscreen',	bookCaseSmall as 'Small Bookcase',	recliner as 'Recliner',	floorLampLarge as 'Large Floorlamp',	tableLamp as 'Table Lamp',	heavyClockLamp as 'Heavy Lamp',	bench as 'Bench',	buffestBase as 'Buffet Base',	hutchTop as 'Hutch',	cornerCabinet as 'Coner Cabinet',	diningTable as 'Dining Table',	diningTableChair as 'Dining Table Chair',	diningTableLeaf as 'Dining Table Leaf',	bakingRack as 'Baking Rack',	serverCart as 'Server Cart',	teaCart as 'Tea Cart',	smallRugPad as 'Small Rug/Pad',	suiteChairs as 'Suite Chairs',	largeTable as 'Large Table',	smallTable as 'Small Table',	highChair as 'High Chair',	ironingBoard as 'Ironing Board',	kitchenCabinet as 'Kitchen Cabinet',	microwave as 'Mivrowave',	servingCart as 'Serving Cart',	waterCooler as 'Water Cooler',	stool as 'Stool',	microwaveStand as 'Microwave Stand',	kitchenBench as 'Kitchen Bench',	kingBedSet as 'King Bed Set',	queenBedSet as 'Queen Bed Set',	doubleBedSet as 'Duoble Bed Set',	singleBedSet as 'Single Bed Set',	bunkBedSet as 'Bunk Bed Set',	dayBedSet as 'Day Bed Set',	rollawayBedSet as 'Rollaway Bed Set',	bookShelvesBedroom as 'Bookshelves in Bedroom',	bedroomChair as 'Bedroom Chair',	rockerChairBedroom as 'Bedroom Rocker Chair',	loungeChair as 'Lounge Chair',	armoireSmall as 'Small Armoire',	armoireLarge as 'Large Armoire',	chestSmall as 'Small Chest',	chestLarge as 'Large Chest', 	vanityBench as 'Vanity Bench',	bedroomBench as 'Bedroom Bench',	singleDresser as 'Single Dresser',	doubleDresser as 'Double Dresser',tripleDresser as 'Triple Dresser',	vanityDresser as 'Vanity Dresser',	floorLampBedroom as 'Floor Lamp, Bedroom',	nightTable as 'Night Table',	smallWardrobe as 'Small Wardrobe',	largeWardrobe as 'Large Wardrobe',	jewleryArmoire as  'Jewlery Armoire',	tableLampBedroom as 'Table Lamp Bedroom',	babyCarriageNursery as 'Baby Carriage Nursery',	bassinette as 'Bassinette',	youthBed as 'Youth Bed',	childChair as 'Child Chair',	highChairNursery as 'High Chair Nursery',	chestNursery as 'Nursery Chest',	toyChest as 'Toy Chest',	babyCrib as 'Baby Crib',	playpen as 'Playpen',	plasticToySmall as 'Small Plastic Toy',	plasticToyLarge as 'Large Plastic Toy',	childTable as 'Child Table',	draftingTable as 'Drafting Table',	largeGlass as 'Large Glass',	grillSmall as 'Small Grill',	grillLarge as 'Large Grill',	chairAlumPlast as 'Alum/Plast Chair',	chairMetal as 'Metal Chair',	chairWood as 'Wooden Chair',	hoseAndTools as 'Hose And Tools',	glider as 'Glider',	ladderSixFoot as 'Six Foot Ladder',	ladderEightFoot as 'Eight Foot Ladder',	ladderExtension as 'Extension Ladder',	lawnEdger as 'Lawn Edger',	lawnMowerHand as 'Hand Mower',	lawnMowerPower as 'Power Mower',	lawnMowerRide as 'Riding Mower',	leafSweeper as 'Leaf Sweeper',	childSlide as 'Child Slide',	childGym as 'Child Gym',	childSwingSmall as 'Child Swing Small',	childSwingMed as 'Child swing Medium',	childSwingLarge as 'Large Child Swing',	picnicTable as 'Picnic Table',	outdoorBench as 'Outdoor Bench',	plasticTote as 'Plastic Tote',	lawnRoller as 'Lawn Roller',	sandBox as 'Sand Box',	spreader as 'Spreader',	snowBlower as 'Snow Blower',	smallTableOutdoor as 'Small Outdoor Table',	largeTableOutdoor as 'Large Outdoor Table',	umbrella as 'Umbrella',	childWagon as 'Child Wagon',	whellBarrow as 'Wheel Barrow',	smallAirCompressor as 'Small Air Compressor',	largeAirCompressor as 'Large Air Compressor',	gorillaRack as 'Gorilla Rack',	utilityCabinet as 'Utility Cabinet',	airconSmall as 'Small Air conditionder',	airconLarge as 'Large Air Conditioner',	babyCarriage as 'Baby Carriage',	dehumid as 'Dehumidifier',	dishWasher as 'Dishwasher',	freezerTen as 'Ten Freezer',	freezerFifteen as 'Fifteen Freezer',	freezerOver as 'Large+ Freezer',	rangeWide as 'Wide Range',	refrigeratorSix as 'Six Refrigerator',	refrigeratorTen as 'Ten Refrigerator',	refrigeratorOver as 'Ten+ Refrigerator',	sewingMachine as 'Sewing Machine',	sewingWithCAB as 'Sewing With Cabinet',	steamCleaner as 'Steam Cleaner',	trashCompactor as 'Trash Compactor',	vacuumCleaner as 'Vaccuum Cleaner',	humid as 'Humidifer',	airPurifier	as 'Air Purifier',shopVac as 'Shop Vac',	washer as 'Washer',	dryer as 'Dryer',	fakeTree as 'Houseplant',	barbellWeights as 'Weights',	clothesBasket as 'Clothes Basket',	bike as 'Bike',	bowlingBall as 'Bowling Set',	cardTable as 'Card Table',	clothesHamper as 'Clothes Hamper',	cooler as 'Cooler',	foldingCot as 'Folding Cot',	officeDeskLarge as 'Large Office Desk',	computerDesk as 'Computer Desk',	studentDesk as 'Student Desk',	officeChair as 'Office Chair',	secretaryChair as 'Secretary Chair',	printerStand as 'Printer Stand',	exerciseEquip as 'Exercise Equipment',	miscFan as 'Miscellaneous Fan',	fernPlantStand as 'Fern Stand',	cardboardCabinet as 'Cardboard Cabinet',	twoDrawerCabinet as 'Two Drawer Cabinet',	fourDrwaerCabinet as 'four Drawer Cabinet',	fishingPole as 'Fishing Pole',	fireArms as 'Fire Arms',	foldingChair as 'Folding Chair',	wineRack as 'Wine Rack',	footLocker as 'Foot Locker',	cardTableLarge as 'Large Card Table',	golfEquip as 'Golf Equipment',	spaceHeater as 'Space Heater',	metalShelves as 'Metal Shelves',	pingpongTable as 'Ping Pong Table',	poolTableComp as 'Pool Table Comp',	poolTableSlate as 'Pool Table Slate',	hottubFour as 'Hot Tub 4',	hottubSix as 'Hot Tub 6',	hottubEight as 'Hot Tub 8',	powerTool as 'Power Tools',	powerToolStand as 'Power Tool Stand',	skis as 'Skis',	sled as 'Sled',	suitCase as 'Suitcase',	tackleBox as 'Tackle Box',	tire as 'Tire',	tireAndRims as 'Tire and Rims',	toolChestSmall as 'Small Toolchest',	toolChestMed as 'Medium toolchest',	toolChestLarge as 'Large Toolchest',	toolChestXL as 'XL Toolchest',	trashCan as 'Trash Can',	trampoline as 'Trampoline',	treadmill as 'Treadmill',	tricycle as 'Trike',	workBench as 'Workbench',	sewingCabinet as 'Sewing Cabinet',	largeSafe as 'Large Safe',	medSafe as 'Medium Safe',	smallSage as 'Small Safe',	gunSafe as 'Gun Safe',	statue as 'Statue',	smallMotorcycle as 'Small MotorBike',	medMotorcycle as 'Med Motorcycle',	largeMotorcycle as 'Large Motorcycle',	fourWheeler as 'Four Wheeler',	dishPack as 'Dish Pack',	wardrobeLayFlat as  'Layflat Wardrobe',	wardrobeStandup as 'Standup Wardrobe',smallBooks as 'Small Books',smallCartons as 'Small Cartons',mediumCartons as 'Medium Cartons',largeCartons as 'Large Cartons',XLCartons as 'XL Cartons',mirrorCarton as 'Mirror Carton'
            FROM            cubeSheet INNER JOIN
                         SERVICE ON cubeSheet.serviceID = SERVICE.serviceID INNER JOIN
                         CUSTOMER ON SERVICE.customerID = CUSTOMER.customerID"></asp:SqlDataSource>

    </form>
</body>
</html>
