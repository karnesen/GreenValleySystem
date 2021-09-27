<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="auctionAssessment.aspx.cs" Inherits="GreenValleySystem.auctionAssessment" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card mb-2">
        <div class="card-header">
            <div class="text-center h5">
            Assessment Form
                </div>
            <ul class="nav nav-tabs card-header-tabs pull-right" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class='<%= state4 %>' id="pre-tab" data-toggle="tab" href="#prelim" role="tab" aria-controls="prelim" aria-selected="true">Preliminary</a>
                </li>
                <li class="nav-item">
                    <a class='<%= state5 %>' id="assess-tab" data-toggle="tab" href="#assessment" role="tab" aria-controls="assessment" aria-selected="false">Assessment</a>
                </li>
                <li>
                    <a class='<%= state6 %>' id="rooms-tab" data-toggle="tab" href="#rooms" role="tab" aria-controls="rooms" aria-selected="false">Cube Sheet</a>
                </li>
            </ul>
        </div>


        <div class="card-body">
            <div class="tab-content" id="myTabContent">

                <%-- Preliminary Auction Assessment Information --%>
                <div class='<%= state3 %>' id="prelim" role="tabpanel" aria-labelledby="pre-tab">
                    <asp:FormView
                        ID="fvAuctionAssessment"
                        runat="server"
                        DataKeyNames="serviceID"
                        DataSourceID="srcAuctionAssessment"
                        DefaultMode="edit">
                        <EditItemTemplate>
                            <div class="form-group">
                                <asp:Label ID="lblSell" for="txtBoxSell" runat="server" class="col-sm-2 col-form-label" Text="What to Sell"></asp:Label>
                                <asp:TextBox ID="txtBoxSell" Text='<%# Bind("whatSell") %>' TextMode="MultiLine" Rows="4" class="form-control" runat="server"></asp:TextBox>
                                <%--<asp:RegularExpressionValidator 
	                                id="revSell"  
                                    runat="server"
                                    ControlToValidate="txtBoxSell" 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                    ErrorMessage="Invalid Input" 
                                    ForeColor="Red">
                                </asp:regularexpressionvalidator>--%>
                            </div>


                            <div class="form-group">
                                <asp:Label ID="lblWhySell" for="txtWhySell" runat="server" class="col-sm-2 col-form-label" Text="Why Sell:"></asp:Label>
                                <asp:DropDownList ID="ddlReason" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("whySell") %>'>
                                    <asp:ListItem></asp:ListItem>
                                    <asp:ListItem>Settling and Estate</asp:ListItem>
                                    <asp:ListItem>Moving and Need to Downsize</asp:ListItem>
                                    <asp:ListItem>Just Getting Rid of Some Stuff</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <asp:Label ID="lblScheduled" for="chHome" runat="server" class="form-label" Text="Schedule:"></asp:Label>
                            <div class="row form-group justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chBringIn" Text="Bring In" Checked='<%# Bind("bringIn") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chWalkThrough" Text="Auction Walk Through" Checked='<%# Bind("auctionWalkThrough") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chPickUp" Text="Pick Up" Checked='<%# Bind("pickUp") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chPacking" Text="Packing" Checked='<%# Bind("packing") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chTrash" Text="Trash Removal" Checked='<%# Bind("trashRemoval") %>' runat="server" />

                                </div>
                            </div>
                            <asp:TextBox ID="txtTrash" Text='<%# Bind("trashDesc")%>' TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            <%--<asp:RegularExpressionValidator 
	                            id="RegularExpressionValidator1"  
                                runat="server"
                                ControlToValidate="txtTrash" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                ErrorMessage="Invalid Input" 
                                ForeColor="Red">
                            </asp:regularexpressionvalidator>--%>

                            <div class="form-group row justify-content-around">
                                <div class="form-check">
                                    <asp:RadioButton ID="rdoCust" Checked='<%# Bind("custLookAt") %>' runat="server" Text="Customer Requests Auction Look At" GroupName="lookAt" Visible='<%#Eval("auctionWalkThrough") %>' />
                                </div>
                                <div class="form-check">
                                    <asp:RadioButton ID="rdoGV" Checked='<%# Bind("gvLookAt") %>' runat="server" Text="Green Valley Requires Look At" GroupName="lookAt" Visible='<%#Eval("auctionWalkThrough") %>' />
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="form-check">
                                    <asp:CheckBox ID="chPhotos" Text="Requested Photos" Checked='<%# Bind("photos") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chItems" Text="Requested Items" Checked='<%# Bind("items") %>' runat="server" />
                                </div>
                            </div>


                            <asp:Label ID="lblAdditional" for="chMove" runat="server" Text="Additional Services Needed:"></asp:Label>
                            <div class="row form-group justify-content-around">
                                <div class="form-check">
                                    <asp:CheckBox ID="chMove" Text="Move" Checked='<%# Bind("move") %>' runat="server" />
                                </div>
                                <div class="form-check">
                                    <asp:CheckBox ID="chAppraisal" Text="Appraisal" Checked='<%# Bind("appraisal") %>' runat="server" />
                                </div>
                            </div>

                            <asp:LinkButton ID="UpdateButton"
                                Text="Save"
                                CommandName="Update"
                                runat="server" 
                                Class="btn btn-outline-primary"/>
                        </EditItemTemplate>
                    </asp:FormView>
                </div>

                <asp:SqlDataSource
                    ID="srcAuctionAssessment"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="Select * from auctionAssessment where serviceID=@serviceID"
                    UpdateCommand="UPDATE auctionAssessment Set whatSell=@whatSell, whySell=@whySell, bringIn=@bringIn, auctionWalkThrough=@auctionWalkThrough, custLookAt=@custLookAt, gvLookAt=@gvLookAt,
        pickUp=@pickUp, packing=@packing, trashRemoval=@trashRemoval, trashDesc=@trashdesc, photos=@photos, items=@items, move=@move, appraisal=@appraisal where serviceID=@serviceID">
                    <SelectParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <%-- Auction Assessment --%>
                <div class='<%= state2 %>' id="assessment" role="tabpanel" aria-labelledby="assess-tab">
                    <div class="row">
                        
                        <div class="col">
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

                                    <div class="collapse" id="collapseApt">
                                        <div class="card card-body">
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

                                    <div class="collapse" id="collapseStor">
                                        <div class="card card-body">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chIndoor" Checked='<%# Bind("Indoor")%>' Text="Indoor" runat="server" />
                                            </div>
                                            <div class="form-check">
                                                <asp:CheckBox ID="chOutdoor" Checked='<%# Bind("Outdoor")%>' Text="Outdoor" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="collapse" id="collapseBus">
                                        <div class="card card-body">
                                            <asp:Label ID="lblBusiness" For="txtBusiness" runat="server" Text="Place of Business"></asp:Label>
                                            <asp:TextBox ID="txtBusiness" runat="server" Text='<%# Bind("businessText")%>' class="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblAccessability" for="txtAccessability" runat="server" Text="Truck Accessability"></asp:Label>
                                        <asp:TextBox ID="txtAccessability" TextMode="MultiLine" Text='<%# Bind("truckAccess")%>' runat="server" class="form-control"></asp:TextBox>
                                        <%--<asp:RegularExpressionValidator 
	                                        id="revEquipment"  
                                            runat="server"
                                            ControlToValidate="txtAccessability" 
                                            ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                            ErrorMessage="Invalid Input" 
                                            ForeColor="Red">
                                        </asp:regularexpressionvalidator>--%>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblFar" for="txtFarFromLoading" runat="server" Text="Distance from Loading Door"></asp:Label>
                                        <asp:TextBox ID="txtFarFromLoading" TextMode="MultiLine" Text='<%# Bind("howFar")%>' runat="server" class="form-control"></asp:TextBox>
                                        <%--<asp:RegularExpressionValidator 
	                                        id="RegularExpressionValidator2"  
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

                                    <asp:Label ID="lblMaterials" runat="server" Text="Boxes and Packing Materials"></asp:Label>
                                    <div class="form-group row">
                                        <div class="form-check">
                                            <asp:CheckBox ID="chSmall" Text="Small" Checked='<%# Bind("small")%>' runat="server" />
                                            <asp:TextBox ID="txtSmall" runat="server" Text='<%# Bind("smallamt")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chMedium" Text="Medium" Checked='<%# Bind("med")%>' runat="server" />
                                            <asp:TextBox ID="txtMedium" runat="server" Text='<%# Bind("medamt")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chLarge" Text="Large" Checked='<%# Bind("large")%>' runat="server" />
                                            <asp:TextBox ID="txtLarge" runat="server" Text='<%# Bind("largeamt")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chArt" Text="Art" Checked='<%# Bind("art")%>' runat="server" />
                                            <asp:TextBox ID="txtArt" runat="server" Text='<%# Bind("artamt")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chSmallPads" Text="Small Pads" Checked='<%# Bind("smallPads")%>' runat="server" />
                                            <asp:TextBox ID="txtSmallPads" runat="server" Text='<%# Bind("smallPadsamt")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-check">
                                            <asp:CheckBox ID="chLargePads" Text="Large Pads" Checked='<%# Bind("largePads")%>' runat="server" />
                                            <asp:TextBox ID="txtLargePads" runat="server" Text='<%# Bind("largePadsamt")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <table class="table borderless">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblPickUp" For="txtPickUp" runat="server" Text="Pick Up Fee"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtPickUp" runat="server" Text='<%# Bind("pickUpFee")%>' TextMode="Number" class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblConsignment" For="txtConsignment" runat="server" Text="Consignment Rate"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtConsignment" runat="server" TextMode="Number" Text='<%# Bind("Consignment")%>' class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTrash" For="txtTrash" runat="server" Text="Trash Removal"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTrash" TextMode="Number" runat="server" Text='<%# Bind("Trash")%>' class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblAdditional" For="txtAdd" runat="server" Text="Additional Fees"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAdd" TextMode="Number" runat="server" Text='<%# Bind("additional")%>' class="form-control"></asp:TextBox>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <%--<asp:TextBox ID="txtInventory" TextMode="MultiLine" Rows="20"  Class="form-control  fixed-bottom w-25" PlaceHolder="Inventory" Text='<%# Bind("invDesc") %>' runat="server"></asp:TextBox>--%>
                                    <asp:Button ID="btnSaveChanges" Text="Save" runat="server" CommandName="Update" Class="btn btn-outline-primary" />

                                </EditItemTemplate>
                            </asp:FormView>


                            <div class="form-control fixed-bottom w-25 h-25" style="overflow:scroll" runat="server">
                                <h6>Add Inventory</h6>
                                <asp:TextBox ID="txtInvDesc" class="form-control" runat="server" placeholder="Description"></asp:TextBox>
<%--                                <input ID="txtInvDesc" class="form-control" placeholder="Description" runat="server"/>--%>
                                <asp:Button ID="btnAddInventory" runat="server" Text="Add To Catalog" OnClick="btnAddInventory_Click" CommandName="Insert" Class="btn btn-outline-primary" type=submit/>
<%--                                <input id="btnAddInventory" type="submit" value="submit" class="btn btn-outline-primary" onserverclick="btnAddInventory_Click"/>--%>
                                  
                             <%--<script>
                                 var input = document.getElementById("txtInvDesc");
                                 input.addEventListener("keypress", function (event) {
                                     if (event.keyCode === 13) {
                                         event.preventDefault();
                                         document.getElementById("btnAddInventory").click();
                                     }
                                 });
                             </script>--%>

                                <script type="text/javascript">
                                    window.addEventListener('keydown', function (e) { if (e.keyIdentifier == 'U+000A' || e.keyIdentifier == 'Enter' || e.keyCode == 13) { if (e.target.nodeName == 'INPUT' && e.target.type == 'text') { e.preventDefault(); return false; } } }, true);
                                </script>
                        
                                
                                <br />
                                <h6>Catalouged Inventory</h6>
                                <asp:Button ID="btnPrintInventory" runat="server" Text="Print Inventory" OnClick="btnPrintInventory_Click" Class="btn btn-secondary"/>
                                <asp:GridView ID="gvInvCatalog"
                                    runat="server" 
                                    class="table table-bordered table-condensed table-hover" 
                                    DataSourceID="srcInvCatalog" 
                                    DataKeyNames="catalogID" 
                                    AutoGenerateColumns="false"
                                    AllowPaging="false"
                                    AutoGenerateDeleteButton="true">
                                    <HeaderStyle BackColor="#266141" ForeColor="White" />
                                    <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="catalogID" HeaderText="Catalog Number"
                                 SortExpression="catalogID"/>
                            <asp:BoundField DataField="invDesc" HeaderText="Description"
                                 SortExpression="Description"/>
                                        </Columns>
                                        </asp:GridView>

                            </div>


                            <asp:SqlDataSource
                                ID="srcAssessment"
                                runat="server"
                                SelectCommand="Select * from auctionAssessment where serviceID=@serviceID"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                UpdateCommand="Update auctionAssessment set 
                            apartment=@apartment, floor=@floor, elevator=@elevator, elevatorWalk=@elevatorWalk, house=@house, storageUnit=@storageUnit, indoor=@indoor, outdoor=@outdoor,
                            business=@business, businessText=@businessText, truckAccess=@truckAccess, howFar=@howFar, steps=@steps, appCart=@appCart, pianoDolly=@pianoDolly,
                            pianoboard=@pianoboard, gunSafe=@gunSafe, blankets=@blankets, small=@small, large=@large, med=@med, smallPads=@smallPads, largePads=@largePads,
                            smallamt=@small, largeamt=@large, medamt=@medamt, smallPadsamt=@smallPads, largePadsamt=@largePads, pickUpFee=@pickUpFee, consignment=@consignment,
                            trash=@trash, additional=@additional 
                        where serviceID=@serviceID">
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                 
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:SqlDataSource
                                ID="srcInvCatalog"
                                runat="server"
                                SelectCommand="Select * from inventoryCatalog where serviceID=@serviceID"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                InsertCommand="Insert into inventoryCatalog(serviceID,invDesc) values(@serviceID,@invDesc)"
                                DeleteCommand="Delete from inventoryCatalog where catalogID=@catalogID and serviceID=@serviceID">
                                <InsertParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                    <asp:ControlParameter Name="catalogID" ControlID="gvInvCatalog"/>
                                    <asp:ControlParameter Name="invDesc" ControlID="txtInvDesc"/>
                              </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                    <asp:ControlParameter Name="catalogID" ControlID="gvInvCatalog"/>
                                </DeleteParameters>
                            </asp:SqlDataSource>

                            <%-- Assign Trucks --%>
                            <div class="card card-body m-2">
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
                                        <asp:Button ID="btnEquipment" runat="server" Text="Add" OnClick="btnEquipment_Click" class="btn btn-primary" />
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
                                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" OnClick="lnkDelete_Click"><i class="fas fa-times"></i></asp:LinkButton>
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
                                DeleteCommand="Delete from utilizeEquipment where equipmentID=@equipmentID and serviceID=@serviceID">
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

                        
                    </div>
                </div>
                
               
                <div class='<%=state7 %>' id="rooms" role="tabpanel" aria-labelledby="rooms-tab">
                    <br />
                    <ul class="list-group list-group-flush">
                        <%-- button and label for calculating and presenting cube sheet totals --%>

                        <h6>USE WHOLE NUMBERS</h6>

                        <asp:Button ID="btnCubeCalc" runat="server" Text="Calculate" Class="btn-primary col-2 rounded" OnClick="btnCubeCalc_Click1" />
                        
                        <br />

                        <asp:Label ID="lblCubeTotal" runat="server" class="col-form-label" Text="Total Cubic Feet: "></asp:Label>
                        <asp:Label ID="lblColumnOne" runat="server" class="col-form-label" Text="Living Room, Dining Room, and Kitchen: "></asp:Label>
                        <asp:Label ID="lblColumnTwo" runat="server" class="col-form-label" Text="Bedrooms, Nursery, and Porch/Outdoors: "></asp:Label>
                        <asp:Label ID="lblColumnThree" runat="server" class="col-form-label" Text="Appliances and Misc: "></asp:Label>
                        <asp:Label ID="lblPacking" runat="server" class="col-form-label" Text="Total Cartons: "></asp:Label>

                        <br />



                        <%-- Living Room --%>
                        <asp:LinkButton ID="btnCollapseLivingRoom" runat="server" href="#collapseLivingRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseLivingRoom">
                            Living Room <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseLivingRoom">
                            <asp:FormView
                                ID="fvRooms"
                                runat="server"
                                DataSourceID="srcCubeSheetLivingRoom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                    <asp:LinkButton ID="LinkButton1" CommandName="Update" runat="server" class="mb-2" OnClick="btnSaveTab3_Click">Save</asp:LinkButton>

                                    
                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Bar</td>
                                                <td>
                                                    <asp:TextBox ID="txtBar" runat="server" Text='<%# Bind("bar") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Piano Bench</td>
                                                <td>
                                                    <asp:TextBox ID="txtPianoBench" runat="server" Text='<%# Bind("pianoBench") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Bookcase</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeBookCase" runat="server" Text='<%# Bind("largeBookCase") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Book Shelves</td>
                                                <td>
                                                    <asp:TextBox ID="txtBookShelves" runat="server" Text='<%# Bind("bookShelves") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Cabinets</td>
                                                <td>
                                                    <asp:TextBox ID="txtCabinets" runat="server" Text='<%# Bind("cabinet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Striaght Chairs</td>
                                                <td>
                                                    <asp:TextBox ID="txtStriaghtchair" runat="server" Text='<%# Bind("straightChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Arm Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtArmChair" runat="server" Text='<%# Bind("armChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Rocker Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtRockerChair" runat="server" Text='<%# Bind("rockerChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Occasional Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtOccasionalChair" runat="server" Text='<%# Bind("occasionalChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Overstuffed Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtOverStuffedChair" runat="server" Text='<%# Bind("overStuffedChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Cedar Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtCedarChest" runat="server" Text='<%# Bind("cedarChest") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Computer</td>
                                                <td>
                                                    <asp:TextBox ID="txtComputer" runat="server" Text='<%# Bind("computer") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Desk</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallDesk" runat="server" Text='<%# Bind("smallDesk") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Ottoman</td>
                                                <td>
                                                    <asp:TextBox ID="txtOttoman" runat="server" Text='<%# Bind("ottoman") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Secretary Desk</td>
                                                <td>
                                                    <asp:TextBox ID="txtSecretarydesk" runat="server" Text='<%# Bind("secretaryDesk") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>ET Center</td>
                                                <td>
                                                    <asp:TextBox ID="txtETcenter" runat="server" Text='<%# Bind("ETcetner") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Fireplace Equipment</td>
                                                <td>
                                                    <asp:TextBox ID="txtFireplaceEquip" runat="server" Text='<%# Bind("fireplaceEquipment") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Foot Stool</td>
                                                <td>
                                                    <asp:TextBox ID="txtFootStool" runat="server" Text='<%# Bind("footStool") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Grand Clock</td>
                                                <td>
                                                    <asp:TextBox ID="txtGrandclock" runat="server" Text='<%# Bind("grandClock") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Coat Rack</td>
                                                <td>
                                                    <asp:TextBox ID="txtCoatRack" runat="server" Text='<%# Bind("coatRack") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Coat Rack</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeCoatRack" runat="server" Text='<%# Bind("coatRackLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Floor Lamp</td>
                                                <td>
                                                    <asp:TextBox ID="txtFloorLamp" runat="server" Text='<%# Bind("floorLamp") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Magazine Rack</td>
                                                <td>
                                                    <asp:TextBox ID="txtMagRack" runat="server" Text='<%# Bind("magazineRack") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Music Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtMusicCabinet" runat="server" Text='<%# Bind("musicCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Organ</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallOrgan" runat="server" Text='<%# Bind("smallOrgan") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Piano Baby/Gr/Upr</td>
                                                <td>
                                                    <asp:TextBox ID="txtpianoBabyGrUpr" runat="server" Text='<%# Bind("pianoBabyGrUpr") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Piano Parlor/Grd</td>
                                                <td>
                                                    <asp:TextBox ID="txtpianoParlorGrd" runat="server" Text='<%# Bind("pianoParlorGrd") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Piano Spinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtPianoSpinet" runat="server" Text='<%# Bind("pianoSpinet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Radio table</td>
                                                <td>
                                                    <asp:TextBox ID="txtRadioTable" runat="server" Text='<%# Bind("radiotTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Record Player</td>
                                                <td>
                                                    <asp:TextBox ID="txtRecordPlayer" runat="server" Text='<%# Bind("recordPlayerPortable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Rug/Pad Small</td>
                                                <td>
                                                    <asp:TextBox ID="txtrugPadSmall" runat="server" Text='<%# Bind("rugPadSmall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Rug/Pad Large</td>
                                                <td>
                                                    <asp:TextBox ID="txtRugPadLarge" runat="server" Text='<%# Bind("rugPadLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Sofa Rattan Wicker</td>
                                                <td>
                                                    <asp:TextBox ID="txtSofaRattanWicker" runat="server" Text='<%# Bind("sofaRattanWicker") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Sofa Sectional</td>
                                                <td>
                                                    <asp:TextBox ID="txtSofaSectional" runat="server" Text='<%# Bind("sofaSectional") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Love Seat</td>
                                                <td>
                                                    <asp:TextBox ID="txtLoveSeat" runat="server" Text='<%# Bind("loveSeat") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Three Cushion Couch</td>
                                                <td>
                                                    <asp:TextBox ID="txtThreeCushion" runat="server" Text='<%# Bind("threeCushion") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Four Cushion Couch</td>
                                                <td>
                                                    <asp:TextBox ID="txtFourCushion" runat="server" Text='<%# Bind("fourCushion") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Futon</td>
                                                <td>
                                                    <asp:TextBox ID="txtFuton" runat="server" Text='<%# Bind("futon") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Stereo Component</td>
                                                <td>
                                                    <asp:TextBox ID="txtStereoComp" runat="server" Text='<%# Bind("stereoComponent") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Console</td>
                                                <td>
                                                    <asp:TextBox ID="txtConsole" runat="server" Text='<%# Bind("console") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Speaker Pair</td>
                                                <td>
                                                    <asp:TextBox ID="txtSpeakerPair" runat="server" Text='<%# Bind("speakerPair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Standard Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtStandardTable" runat="server" Text='<%# Bind("tableStandard") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Coffee Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtCoffeeTable" runat="server" Text='<%# Bind("tableCoffee") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>End Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtEndtable" runat="server" Text='<%# Bind("tableEnd") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Phone Stand</td>
                                                <td>
                                                    <asp:TextBox ID="txtPhoneStand" runat="server" Text='<%# Bind("phoneStand") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Flat Screen</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallFlatScreen" runat="server" Text='<%# Bind("flatScreenSmall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Flat Screen</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeFlatScreen" runat="server" Text='<%# Bind("flatScreenLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Book Case</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallBookCase" runat="server" Text='<%# Bind("bookCaseSmall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Recliner</td>
                                                <td>
                                                    <asp:TextBox ID="txtRecliner" runat="server" Text='<%# Bind("recliner") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Floor Lamp</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeFloorLamp" runat="server" Text='<%# Bind("floorLampLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Table Lamp</td>
                                                <td>
                                                    <asp:TextBox ID="txtTableLamp" runat="server" Text='<%# Bind("tableLamp") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Heavy Clock Lamp</td>
                                                <td>
                                                    <asp:TextBox ID="txtHeavyClockLamp" runat="server" Text='<%# Bind("heavyClockLamp") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveLiving" CommandName="Update" runat="server" class="mb-2" OnClick="btnSaveTab3_Click">Save</asp:LinkButton>
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
                                DataSourceID="srcCubeSheetDiningRoom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" CommandName="Update" runat="server" class="mb-2" OnClick="btnSaveTab3_Click">Save</asp:LinkButton>
                                    
                                    <table class="table table-condensed">
                                        <tbody>
                                            
                                            <tr>
                                                <td>Bench</td>
                                                <td>
                                                    <asp:TextBox ID="txtBench" runat="server" Text='<%# Bind("bench") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Buffet Base</td>
                                                <td>
                                                    <asp:TextBox ID="txtBuffetBase" runat="server" Text='<%# Bind("buffestBase") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hutch Top</td>
                                                <td>
                                                    <asp:TextBox ID="txtHutchTop" runat="server" Text='<%# Bind("hutchTop") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Corner Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtCornerCabinet" runat="server" Text='<%# Bind("cornerCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Dining Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtDiningTable" runat="server" Text='<%# Bind("diningTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Dining Table Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtDiningChair" runat="server" Text='<%# Bind("diningTableChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Dining Table Leaf</td>
                                                <td>
                                                    <asp:TextBox ID="txtDiningLead" runat="server" Text='<%# Bind("diningTableLeaf") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Baking Rack</td>
                                                <td>
                                                    <asp:TextBox ID="txtBakingRack" runat="server" Text='<%# Bind("bakingRack") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Server Cart</td>
                                                <td>
                                                    <asp:TextBox ID="txtServerCart" runat="server" Text='<%# Bind("serverCart") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Tea Cart</td>
                                                <td>
                                                    <asp:TextBox ID="txtTeaCart" runat="server" Text='<%# Bind("teaCart") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Rug/Pad</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallRugPad" runat="server" Text='<%# Bind("smallRugPad") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveDining" CommandName="Update" runat="server" class="mb-2" OnClick="btnSaveTab3_Click">Save</asp:LinkButton>
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
                                DataSourceID="srcCubeSheetKitchen"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                    <asp:LinkButton ID="LinkButton3" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Suite Chairs</td>
                                                <td>
                                                    <asp:TextBox ID="txtSuiteChairs" runat="server" Text='<%# Bind("suiteChairs") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeTable" runat="server" Text='<%# Bind("largeTable") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Small Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallTable" runat="server" Text='<%# Bind("smallTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>High Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtHighChair" runat="server" Text='<%# Bind("highChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Ironing Board</td>
                                                <td>
                                                    <asp:TextBox ID="txtIroningBoard" runat="server" Text='<%# Bind("ironingBoard") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Kitchen Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtKitchenCabinet" runat="server" Text='<%# Bind("kitchenCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Microwave</td>
                                                <td>
                                                    <asp:TextBox ID="txtMicrowave" runat="server" Text='<%# Bind("microwave") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Serving Cart</td>
                                                <td>
                                                    <asp:TextBox ID="txtServingCart" runat="server" Text='<%# Bind("servingCart") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Water Cooler</td>
                                                <td>
                                                    <asp:TextBox ID="txtWaterCooler" runat="server" Text='<%# Bind("waterCooler") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Stool</td>
                                                <td>
                                                    <asp:TextBox ID="txtStool" runat="server" Text='<%# Bind("stool") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Microwave Stand</td>
                                                <td>
                                                    <asp:TextBox ID="txtMicrowaveStand" runat="server" Text='<%# Bind("microwaveStand") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Kitchen Bench</td>
                                                <td>
                                                    <asp:TextBox ID="txtKitchenBench" runat="server" Text='<%# Bind("kitchenBench") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveKitchen" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
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
                            Bedroom <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseDenRoom">
                            <asp:FormView
                                ID="fvDen"
                                runat="server"
                                DataSourceID="srcCubeSheetBedroom"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                    <asp:LinkButton ID="LinkButton4" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                                    <table class="table table-condensed">
                                        <tbody>
                                            
                                            <tr>
                                                <td>King Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtKingBedSet" runat="server" Text='<%# Bind("kingBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Queen Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtQueenBedSet" runat="server" Text='<%# Bind("queenBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Double Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtDoubleBedSet" runat="server" Text='<%# Bind("doubleBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Single Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtSingleBedSet" runat="server" Text='<%# Bind("singleBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Bunk Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtBunkBedSet" runat="server" Text='<%# Bind("bunkBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Day Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtDayBedSet" runat="server" Text='<%# Bind("dayBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Rollaway Bed Set</td>
                                                <td>
                                                    <asp:TextBox ID="txtRollawayBed" runat="server" Text='<%# Bind("rollawayBedSet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Book Shelves</td>
                                                <td>
                                                    <asp:TextBox ID="txtBookShelves" runat="server" Text='<%# Bind("bookShelvesBedroom") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Bedroom Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtBedroomChair" runat="server" Text='<%# Bind("bedroomChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Rocker Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtRockerChairBedroom" runat="server" Text='<%# Bind("rockerChairBedroom") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Lounge Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtLoungeChairBedroom" runat="server" Text='<%# Bind("loungeChair") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Amoire Small</td>
                                                <td>
                                                    <asp:TextBox ID="txtArmoireSmall" runat="server" Text='<%# Bind("armoireSmall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Armoire Large</td>
                                                <td>
                                                    <asp:TextBox ID="txtArmoireLarge" runat="server" Text='<%# Bind("armoireLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallChest" runat="server" Text='<%# Bind("chestSmall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeChest" runat="server" Text='<%# Bind("chestLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Vanity Bench</td>
                                                <td>
                                                    <asp:TextBox ID="txtVanitybench" runat="server" Text='<%# Bind("vanityBench") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Bedroom Bench</td>
                                                <td>
                                                    <asp:TextBox ID="txtBedroomBench" runat="server" Text='<%# Bind("bedroomBench") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Single Dresser</td>
                                                <td>
                                                    <asp:TextBox ID="txtSingleDresser" runat="server" Text='<%# Bind("singleDresser") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Double Dresser</td>
                                                <td>
                                                    <asp:TextBox ID="txtDoubleDresser" runat="server" Text='<%# Bind("doubleDresser") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Triple Dresser</td>
                                                <td>
                                                    <asp:TextBox ID="txtTripleDresser" runat="server" Text='<%# Bind("tripleDresser") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Vanity Dresser</td>
                                                <td>
                                                    <asp:TextBox ID="txtVanityDresser" runat="server" Text='<%# Bind("vanityDresser") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Floor Lamp Bedroom</td>
                                                <td>
                                                    <asp:TextBox ID="txtFloorLampBedroom" runat="server" Text='<%# Bind("floorLampBedroom") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Night Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtNightTable" runat="server" Text='<%# Bind("nightTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Wardrobe</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallWardrobe" runat="server" Text='<%# Bind("smallWardrobe") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Wardrobe</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeWardrobe" runat="server" Text='<%# Bind("largeWardrobe") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Jewlery Armoire</td>
                                                <td>
                                                    <asp:TextBox ID="txtJewleryArmoire" runat="server" Text='<%# Bind("jewleryArmoire") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Table Lamp</td>
                                                <td>
                                                    <asp:TextBox ID="txtTableLampBedroom" runat="server" Text='<%# Bind("tableLampBedroom") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveDen" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
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
                            Nursery <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseOfficeRoom">
                            <asp:FormView
                                ID="fvOffice"
                                runat="server"
                                DataSourceID="srcCubeSheetNursery"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                   <asp:LinkButton ID="LinkButton5" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Baby Carriage</td>
                                                <td>
                                                    <asp:TextBox ID="txtbabyCarriageNursery" runat="server" Text='<%# Bind("babyCarriageNursery") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Bassinette</td>
                                                <td>
                                                    <asp:TextBox ID="txtBassinette" runat="server" Text='<%# Bind("bassinette") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Youth Bed</td>
                                                <td>
                                                    <asp:TextBox ID="txtYouthBed" runat="server" Text='<%# Bind("youthBed") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Child Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildChair" runat="server" Text='<%# Bind("childChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>High Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtHighChair" runat="server" Text='<%# Bind("highChairNursery") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtNurseryChest" runat="server" Text='<%# Bind("chestNursery") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Toy Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtToyChest" runat="server" Text='<%# Bind("toyChest") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Baby Crib</td>
                                                <td>
                                                    <asp:TextBox ID="txtBabyCrib" runat="server" Text='<%# Bind("babyCrib") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Playpen</td>
                                                <td>
                                                    <asp:TextBox ID="txtPlaypen" runat="server" Text='<%# Bind("playpen") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Plastic Toys Small</td>
                                                <td>
                                                    <asp:TextBox ID="txtPlasticToySmall" runat="server" Text='<%# Bind("plasticToySmall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Plastic Toys Large</td>
                                                <td>
                                                    <asp:TextBox ID="txtPlasticToyLarge" runat="server" Text='<%# Bind("plasticToyLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Child Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildTable" runat="server" Text='<%# Bind("childTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Drafting Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtDraftingTable" runat="server" Text='<%# Bind("draftingTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Glass</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeGlass" runat="server" Text='<%# Bind("largeGlass") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveOffice" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
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
                            Porch/Outdoor <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseBedRoom">
                            <asp:FormView
                                ID="fvBedroom"
                                runat="server"
                                DataSourceID="srcCubeSheetOutdoor"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                   <asp:LinkButton ID="LinkButton6" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Small Grill</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallGrill" runat="server" Text='<%# Bind("grillSmall") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Grill</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeGrill" runat="server" Text='<%# Bind("grillLarge") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Aluminum/Plastic Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtAlumPlastChair" runat="server" Text='<%# Bind("chairAlumPlast") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Metal Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtMetalChair" runat="server" Text='<%# Bind("chairMetal") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wood Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtWoodChair" runat="server" Text='<%# Bind("chairWood") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Hose and Tools</td>
                                                <td>
                                                    <asp:TextBox ID="txtHoseAndTools" runat="server" Text='<%# Bind("hoseAndTools") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Glider</td>
                                                <td>
                                                    <asp:TextBox ID="txtGlider" runat="server" Text='<%# Bind("glider") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ladder, 6ft or Less</td>
                                                <td>
                                                    <asp:TextBox ID="txtLadderSix" runat="server" Text='<%# Bind("ladderSixFoot") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ladder, 6-8ft</td>
                                                <td>
                                                    <asp:TextBox ID="txtLadderEight" runat="server" Text='<%# Bind("ladderEightFoot") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Ladder, Extension</td>
                                                <td>
                                                    <asp:TextBox ID="txtLadderExtension" runat="server" Text='<%# Bind("ladderExtension") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Lawn Edger</td>
                                                <td>
                                                    <asp:TextBox ID="txtLawnEdger" runat="server" Text='<%# Bind("lawnEdger") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Lawn Mower - Hand</td>
                                                <td>
                                                    <asp:TextBox ID="txtLawnMowerHand" runat="server" Text='<%# Bind("lawnMowerHand") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Lawn Mower - Power</td>
                                                <td>
                                                    <asp:TextBox ID="txtLawnMowerPower" runat="server" Text='<%# Bind("lawnMowerPower") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Lawn Mower - Ride</td>
                                                <td>
                                                    <asp:TextBox ID="txtLawnMowerRide" runat="server" Text='<%# Bind("lawnMowerRide") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Leaf Sweeper</td>
                                                <td>
                                                    <asp:TextBox ID="txtLeafSweeper" runat="server" Text='<%# Bind("leafSweeper") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <%--<tr>
                                                <td>Child Slide</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildSlide" runat="server" Text='<%# Bind("childSlide") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Child Gym</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildGym" runat="server" Text='<%# Bind("childGym") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Child Swing Small</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildSwingSmall" runat="server" Text='<%# Bind("childSwingSmall") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Child Swing Medium</td>
                                                <td>
                                                    <asp:TextBox ID="txtchildSwingMed" runat="server" Text='<%# Bind("childSwingMed") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Child Swing Large</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildSwingLarge" runat="server" Text='<%# Bind("childSwingLarge") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td>Picnic Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtPicnicTable" runat="server" Text='<%# Bind("picnicTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Outdoor Bench</td>
                                                <td>
                                                    <asp:TextBox ID="txtOutdoorBench" runat="server" Text='<%# Bind("outdoorBench") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Plastic Tote</td>
                                                <td>
                                                    <asp:TextBox ID="txtplasticTote" runat="server" Text='<%# Bind("plasticTote") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Lawn Roller</td>
                                                <td>
                                                    <asp:TextBox ID="txtLawnRoller" runat="server" Text='<%# Bind("lawnRoller") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Sand Box</td>
                                                <td>
                                                    <asp:TextBox ID="txtSandBox" runat="server" Text='<%# Bind("sandBox") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Spreader</td>
                                                <td>
                                                    <asp:TextBox ID="txtSpreader" runat="server" Text='<%# Bind("spreader") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Snow Blower</td>
                                                <td>
                                                    <asp:TextBox ID="txtSnowBlower" runat="server" Text='<%# Bind("snowBlower") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Outdoor Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallTableOutdoor" runat="server" Text='<%# Bind("smallTableOutdoor") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Outdoor Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeTableOutdoor" runat="server" Text='<%# Bind("largeTableOutdoor") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Umbrella</td>
                                                <td>
                                                    <asp:TextBox ID="txtUmbrella" runat="server" Text='<%# Bind("umbrella") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Child Wagon</td>
                                                <td>
                                                    <asp:TextBox ID="txtChildWagon" runat="server" Text='<%# Bind("childWagon") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Wheel Barrow</td>
                                                <td>
                                                    <asp:TextBox ID="txtWhellBarrow" runat="server" Text='<%# Bind("whellBarrow") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Small Air Compressor</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallAirCompressor" runat="server" Text='<%# Bind("smallAirCompressor") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Air Compressor</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeAirCompressor" runat="server" Text='<%# Bind("largeAirCompressor") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Gorilla Rack</td>
                                                <td>
                                                    <asp:TextBox ID="txtGorillaRack" runat="server" Text='<%# Bind("gorillaRack") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Utility Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtUtilityCabinet" runat="server" Text='<%# Bind("utilityCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveOffice" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
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
                            Appliances <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseAtticRoom">
                            <asp:FormView
                                ID="fvAttic"
                                runat="server"
                                DataSourceID="srcCubeSheetAppliances"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                   <asp:LinkButton ID="LinkButton7" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                              

                                    <table class="table table-condensed">
                                        <tbody>
                                           
                                             <tr>
                                                <td>Small Air Conditioner</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallAircon" runat="server" Text='<%# Bind("airconSmall") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Air Conditioner</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeAircon" runat="server" Text='<%# Bind("airconLarge") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td>Baby Carriage</td>
                                                <td>
                                                    <asp:TextBox ID="txtBabyCarriageAppliances" runat="server" Text='<%# Bind("babyCarriage") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td>Dehumidifier</td>
                                                <td>
                                                    <asp:TextBox ID="txtDehumid" runat="server" Text='<%# Bind("dehumid") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Dish Washer</td>
                                                <td>
                                                    <asp:TextBox ID="txtDishwasher" runat="server" Text='<%# Bind("dishWasher") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Freezer - 10</td>
                                                <td>
                                                    <asp:TextBox ID="txtFreezerTen" runat="server" Text='<%# Bind("freezerTen") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Freezer - 15</td>
                                                <td>
                                                    <asp:TextBox ID="txtFreezerFifteen" runat="server" Text='<%# Bind("freezerFifteen") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>Freezer - Over</td>
                                                <td>
                                                    <asp:TextBox ID="txtFreezerOver" runat="server" Text='<%# Bind("freezerOver") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Range, Wide</td>
                                                <td>
                                                    <asp:TextBox ID="txtRangeWide" runat="server" Text='<%# Bind("rangeWide") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Refrigerator - 6</td>
                                                <td>
                                                    <asp:TextBox ID="txtRefrigeratorSix" runat="server" Text='<%# Bind("refrigeratorSix") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Refrigerator - 10</td>
                                                <td>
                                                    <asp:TextBox ID="txtrefrigeratorTen" runat="server" Text='<%# Bind("refrigeratorTen") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Refrigerator - Over</td>
                                                <td>
                                                    <asp:TextBox ID="txtrefrigeratorOver" runat="server" Text='<%# Bind("refrigeratorOver") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Sewing Machine</td>
                                                <td>
                                                    <asp:TextBox ID="txtSewingMachine" runat="server" Text='<%# Bind("sewingMachine") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Sewing W/CAB</td>
                                                <td>
                                                    <asp:TextBox ID="txtSewingWCAB" runat="server" Text='<%# Bind("sewingWithCAB") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                             <%--<tr>
                                                <td>Steam Cleaner</td>
                                                <td>
                                                    <asp:TextBox ID="txtSteamCleaner" runat="server" Text='<%# Bind("steamCleaner") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>--%>
                                            <%--<tr>
                                                <td>Trash Compactor</td>
                                                <td>
                                                    <asp:TextBox ID="txtTrashCompactor" runat="server" Text='<%# Bind("trashCompactor") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td>Vacuum Cleaner</td>
                                                <td>
                                                    <asp:TextBox ID="txtVacuumCleaner" runat="server" Text='<%# Bind("vacuumCleaner") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Humidifer</td>
                                                <td>
                                                    <asp:TextBox ID="txtHumidifier" runat="server" Text='<%# Bind("humid") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Air Purifier</td>
                                                <td>
                                                    <asp:TextBox ID="txtAirPurifier" runat="server" Text='<%# Bind("airPurifier") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Shop Vac</td>
                                                <td>
                                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("shopVac") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Washer</td>
                                                <td>
                                                    <asp:TextBox ID="txtWasher" runat="server" Text='<%# Bind("washer") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Dryer</td>
                                                <td>
                                                    <asp:TextBox ID="txtDryer" runat="server" Text='<%# Bind("dryer") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveOffice" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
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
                            Misc <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseBasementRoom">
                            <asp:FormView
                                ID="fvBasement"
                                runat="server"
                                DataSourceID="srcCubeSheetMisc"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                   <asp:LinkButton ID="LinkButton8" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                                 

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Artificial Tree</td>
                                                <td>
                                                    <asp:TextBox ID="txtTreeFake" runat="server" Text='<%# Bind("fakeTree") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Weights</td>
                                                <td>
                                                    <asp:TextBox ID="txtWeights" runat="server" Text='<%# Bind("barbellWeights") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Clothes Basket</td>
                                                <td>
                                                    <asp:TextBox ID="txtClothesBasket" runat="server" Text='<%# Bind("clothesBasket") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Bike</td>
                                                <td>
                                                    <asp:TextBox ID="txtBike" runat="server" Text='<%# Bind("bike") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Bowling Set w/Bag</td>
                                                <td>
                                                    <asp:TextBox ID="txtBowling" runat="server" Text='<%# Bind("bowlingBall") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Card Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtCardTable" runat="server" Text='<%# Bind("cardTable") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Clothes Hamper</td>
                                                <td>
                                                    <asp:TextBox ID="txtClothesHamper" runat="server" Text='<%# Bind("clothesHamper") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Cooler</td>
                                                <td>
                                                    <asp:TextBox ID="txtCooler" runat="server" Text='<%# Bind("cooler") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Folding Cot</td>
                                                <td>
                                                    <asp:TextBox ID="txtFoldingCot" runat="server" Text='<%# Bind("foldingCot") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Office Desk - Large</td>
                                                <td>
                                                    <asp:TextBox ID="txtOfficeDeskLarge" runat="server" Text='<%# Bind("officeDeskLarge") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Computer Desk</td>
                                                <td>
                                                    <asp:TextBox ID="txtComputerDesk" runat="server" Text='<%# Bind("computerDesk") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Student Desk</td>
                                                <td>
                                                    <asp:TextBox ID="txtStudentDesk" runat="server" Text='<%# Bind("studentDesk") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Office Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtOfficeChair" runat="server" Text='<%# Bind("officeChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Secretary Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtSecretaryChair" runat="server" Text='<%# Bind("secretaryChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Printer Stand</td>
                                                <td>
                                                    <asp:TextBox ID="txtPrinterStand" runat="server" Text='<%# Bind("printerStand") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Exercise Equipment</td>
                                                <td>
                                                    <asp:TextBox ID="txtExerciseEquip" runat="server" Text='<%# Bind("exerciseEquip") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Fan</td>
                                                <td>
                                                    <asp:TextBox ID="txtMiscFan" runat="server" Text='<%# Bind("miscFan") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Fern Plant Stand</td>
                                                <td>
                                                    <asp:TextBox ID="txtFernPlantStand" runat="server" Text='<%# Bind("fernPlantStand") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Cardboard Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtCardboardCabinet" runat="server" Text='<%# Bind("cardboardCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Two Drawer Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtTwoDrawerCabinet" runat="server" Text='<%# Bind("twoDrawerCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                                <td>Four Drawer Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtFourDrawerCabinet" runat="server" Text='<%# Bind("fourDrwaerCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Fishing Pole</td>
                                                <td>
                                                    <asp:TextBox ID="txtFishingPole" runat="server" Text='<%# Bind("fishingPole") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <%--<tr>
                                                <td>Firearms</td>
                                                <td>
                                                    <asp:TextBox ID="txtFireArms" runat="server" Text='<%# Bind("fireArms") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td>Folding Chair</td>
                                                <td>
                                                    <asp:TextBox ID="txtfoldingChair" runat="server" Text='<%# Bind("foldingChair") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Wine Rack</td>
                                                <td>
                                                    <asp:TextBox ID="txtwineRack" runat="server" Text='<%# Bind("wineRack") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Foot Locker</td>
                                                <td>
                                                    <asp:TextBox ID="txtfootLocker" runat="server" Text='<%# Bind("footLocker") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Card Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtcardTableLarge" runat="server" Text='<%# Bind("cardTableLarge") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Golf Equipment</td>
                                                <td>
                                                    <asp:TextBox ID="txtgolfEquip" runat="server" Text='<%# Bind("golfEquip") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Heater</td>
                                                <td>
                                                    <asp:TextBox ID="txtspaceHeater" runat="server" Text='<%# Bind("spaceHeater") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Metal Shelves</td>
                                                <td>
                                                    <asp:TextBox ID="txtmetalShelves" runat="server" Text='<%# Bind("metalShelves") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Ping Pong Table</td>
                                                <td>
                                                    <asp:TextBox ID="txtpingpongTable" runat="server" Text='<%# Bind("pingpongTable") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Pool Table Comp</td>
                                                <td>
                                                    <asp:TextBox ID="txtpoolTableComp" runat="server" Text='<%# Bind("poolTableComp") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Pool Table Slate</td>
                                                <td>
                                                    <asp:TextBox ID="txtpoolTableSlate" runat="server" Text='<%# Bind("poolTableSlate") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <%--<tr>
                                                <td>Hot Tub - Four Person</td>
                                                <td>
                                                    <asp:TextBox ID="txtHotTubFour" runat="server" Text='<%# Bind("hottubFour") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Hot Tub - Six Person</td>
                                                <td>
                                                    <asp:TextBox ID="txtHotTubSix" runat="server" Text='<%# Bind("hottubSix") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Hot Tub - Eight Person</td>
                                                <td>
                                                    <asp:TextBox ID="txtHotTubEight" runat="server" Text='<%# Bind("hottubEight") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td>Power Tools</td>
                                                <td>
                                                    <asp:TextBox ID="txtPowerTools" runat="server" Text='<%# Bind("powerTool") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Power Tool Stand</td>
                                                <td>
                                                    <asp:TextBox ID="txtPowerToolStand" runat="server" Text='<%# Bind("powerToolStand") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Skis</td>
                                                <td>
                                                    <asp:TextBox ID="txtSkis" runat="server" Text='<%# Bind("skis") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Sled</td>
                                                <td>
                                                    <asp:TextBox ID="txtSled" runat="server" Text='<%# Bind("sled") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Suitcase</td>
                                                <td>
                                                    <asp:TextBox ID="txtSuitcase" runat="server" Text='<%# Bind("suitCase") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Tackle Box</td>
                                                <td>
                                                    <asp:TextBox ID="txtTackleBox" runat="server" Text='<%# Bind("tacklebox") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Tire</td>
                                                <td>
                                                    <asp:TextBox ID="txtTire" runat="server" Text='<%# Bind("tire") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Tire and Rims</td>
                                                <td>
                                                    <asp:TextBox ID="txtTireAndRim" runat="server" Text='<%# Bind("tireAndRims") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Tool Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallToolChest" runat="server" Text='<%# Bind("toolChestSmall") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Med Tool Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtMedToolChest" runat="server" Text='<%# Bind("toolChestMed") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Tool Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeToolChest" runat="server" Text='<%# Bind("toolChestLarge") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>XL Tool Chest</td>
                                                <td>
                                                    <asp:TextBox ID="txtXLToolChest" runat="server" Text='<%# Bind("toolChestXL") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Trash Can</td>
                                                <td>
                                                    <asp:TextBox ID="txtTrashCan" runat="server" Text='<%# Bind("trashCan") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Trampoline</td>
                                                <td>
                                                    <asp:TextBox ID="txttrampoline" runat="server" Text='<%# Bind("trampoline") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Treadmill</td>
                                                <td>
                                                    <asp:TextBox ID="txtTreadmill" runat="server" Text='<%# Bind("treadmill") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Tricycle</td>
                                                <td>
                                                    <asp:TextBox ID="txtTricycle" runat="server" Text='<%# Bind("tricycle") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Workbench</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkBench" runat="server" Text='<%# Bind("workBench") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Sewing Cabinet</td>
                                                <td>
                                                    <asp:TextBox ID="txtSewingCabinet" runat="server" Text='<%# Bind("sewingCabinet") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Safe</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeSafe" runat="server" Text='<%# Bind("largeSafe") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Med Safe</td>
                                                <td>
                                                    <asp:TextBox ID="txtMedSafe" runat="server" Text='<%# Bind("medSafe") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Safe</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallSafe" runat="server" Text='<%# Bind("smallSage") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Gun Safe</td>
                                                <td>
                                                    <asp:TextBox ID="txtGunSafe" runat="server" Text='<%# Bind("gunSafe") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Statue</td>
                                                <td>
                                                    <asp:TextBox ID="txtStatue" runat="server" Text='<%# Bind("statue") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td>Small Motorcycle</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallMotorcycle" runat="server" Text='<%# Bind("smallMotorcycle") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Med Motorcycle</td>
                                                <td>
                                                    <asp:TextBox ID="txtMedMotorcycle" runat="server" Text='<%# Bind("medMotorcycle") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Large Motorcycle</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeMotorcycle" runat="server" Text='<%# Bind("largeMotorcycle") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Four Wheeler</td>
                                                <td>
                                                    <asp:TextBox ID="txtFourWheeler" runat="server" Text='<%# Bind("fourWheeler") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>--%>


                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveBasement" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
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

                            <asp:SqlDataSource
                                ID="srcCubeSheetLivingRoom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set bar=@bar,pianoBench=@pianoBench,largeBookCase=@largeBookCase,bookShelves=@bookShelves,cabinet=@cabinet,straightChair=@straightChair,armChair=@armChair,rockerChair=@rockerChair,occasionalChair=@occasionalChair,overStuffedChair=@overStuffedChair,cedarChest=@cedarChest,computer=@computer,smallDesk=@smallDesk,ottoman=@ottoman,secretaryDesk=@secretaryDesk,ETcetner=@ETcetner,fireplaceEquipment=@fireplaceEquipment,footStool=@footStool,grandClock=@grandClock,coatRack=@coatRack,coatRackLarge=@coatRackLarge,floorLamp=@floorLamp,magazineRack=@magazineRack,musicCabinet=@musicCabinet,smallOrgan=@smallOrgan,pianoBabyGrUpr=@pianoBabyGrUpr,pianoParlorGrd=@pianoParlorGrd,pianoSpinet=@pianoSpinet,radiotTable=@radiotTable,recordPlayerPortable=@recordPlayerPortable,rugPadSmall=@rugPadSmall,rugPadLarge=@rugPadLarge,sofaRattanWicker=@sofaRattanWicker,sofaSectional=@sofaSectional,loveSeat=@loveSeat,threeCushion=@threeCushion,fourCushion=@fourCushion,futon=@futon,stereoComponent=@stereoComponent,console=@console,speakerPair=@speakerPair,tableStandard=@tableStandard,tableCoffee=@tableCoffee,tableEnd=@tableEnd,phoneStand=@phoneStand,flatScreenSmall=@flatScreenSmall,flatScreenLarge=@flatScreenLarge,bookCaseSmall=@bookCaseSmall,recliner=@recliner,floorLampLarge=@floorLampLarge,tableLamp=@tableLamp,heavyClockLamp=@heavyClockLamp where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                       

                        <asp:SqlDataSource
                                ID="srcCubeSheetDiningRoom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set bench=@bench,buffestBase=@buffestBase,hutchTop=@hutchTop,cornerCabinet=@cornerCabinet,diningTable=@diningTable,diningTableChair=@diningTableChair,diningTableLeaf=@diningTableLeaf,bakingRack=@bakingRack,serverCart=@serverCart,teaCart=@teaCart,smallRugPad=@smallRugPad where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetKitchen"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set suiteChairs=@suiteChairs,largeTable=@largeTable,smallTable=@smallTable,highChair=@highChair,ironingBoard=@ironingBoard,kitchenCabinet=@kitchenCabinet,microwave=@microwave,servingCart=@servingCart,waterCooler=@waterCooler,stool=@stool,microwaveStand=@microwaveStand,kitchenBench=@kitchenBench where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetBedroom"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set kingBedSet=@kingBedSet,queenBedSet=@queenBedSet,doubleBedSet=@doubleBedSet,singleBedSet=@singleBedSet,bunkBedSet=@bunkBedSet,dayBedSet=@dayBedSet,rollawayBedSet=@rollawayBedSet,bookShelvesBedroom=@bookShelvesBedroom,bedroomChair=@bedroomChair,rockerChairBedroom=@rockerChairBedroom,loungeChair=@loungeChair,armoireSmall=@armoireSmall,armoireLarge=@armoireLarge,chestSmall=@chestSmall,chestLarge=@chestLarge,vanityBench=@vanityBench,bedroomBench=@bedroomBench,singleDresser=@singleDresser,doubleDresser=@doubleDresser,tripleDresser=@tripleDresser,vanityDresser=@vanityDresser,floorLampBedroom=@floorLampBedroom,nightTable=@nightTable,smallWardrobe=@smallWardrobe,largeWardrobe=@largeWardrobe,jewleryArmoire=@jewleryArmoire,tableLampBedroom=@tableLampBedroom where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetNursery"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set babyCarriageNursery=@babyCarriageNursery,bassinette=@bassinette,youthBed=@youthBed,childChair=@childChair,highChairNursery=@highChairNursery,chestNursery=@chestNursery,toyChest=@toyChest,babyCrib=@babyCrib,playpen=@playpen,plasticToySmall=@plasticToySmall,plasticToyLarge=@plasticToyLarge,childTable=@childTable,draftingTable=@draftingTable,largeGlass=@largeGlass where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetOutdoor"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set grillSmall=@grillSmall,grillLarge=@grillLarge,chairAlumPlast=@chairAlumPlast,chairMetal=@chairMetal,chairWood=@chairWood,hoseAndTools=@hoseAndTools,glider=@glider,ladderSixFoot=@ladderSixFoot,ladderEightFoot=@ladderEightFoot,ladderExtension=@ladderExtension,lawnEdger=@lawnEdger,lawnMowerHand=@lawnMowerHand,lawnMowerPower=@lawnMowerPower,lawnMowerRide=@lawnMowerRide,leafSweeper=@leafSweeper,picnicTable=@picnicTable,outdoorBench=@outdoorBench,plasticTote=@plasticTote,lawnRoller=@lawnRoller,sandBox=@sandBox,spreader=@spreader,snowBlower=@snowBlower,smallTableOutdoor=@smallTableOutdoor,largeTableOutdoor=@largeTableOutdoor,umbrella=@umbrella,childWagon=@childWagon,whellBarrow=@whellBarrow,smallAirCompressor=@smallAirCompressor,largeAirCompressor=@largeAirCompressor,gorillaRack=@gorillaRack,utilityCabinet=@utilityCabinet where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetAppliances"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set airconSmall=@airconSmall,airconLarge=@airconLarge,dehumid=@dehumid,dishWasher=@dishWasher,freezerTen=@freezerTen,freezerFifteen=@freezerFifteen,freezerOver=@freezerOver,rangeWide=@rangeWide,refrigeratorSix=@refrigeratorSix,refrigeratorTen=@refrigeratorTen,refrigeratorOver=@refrigeratorOver,sewingMachine=@sewingMachine,sewingWithCAB=@sewingWithCAB,humid=@humid,airPurifier=@airPurifier,shopVac=@shopVac,washer=@washer,dryer=@dryer where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetMisc"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select * from cubeSheet where serviceID=@serviceID"
                                UpdateCommand="Update cubeSheet set fakeTree=@fakeTree,barbellWeights=@barbellWeights,clothesBasket=@clothesBasket,bike=@bike,bowlingBall=@bowlingBall,cardTable=@cardTable,clothesHamper=@clothesHamper,cooler=@cooler,foldingCot=@foldingCot,officeDeskLarge=@officeDeskLarge,computerDesk=@computerDesk,studentDesk=@studentDesk,officeChair=@officeChair,secretaryChair=@secretaryChair,printerStand=@printerStand,exerciseEquip=@exerciseEquip,miscFan=@miscFan,fernPlantStand=@fernPlantStand,cardboardCabinet=@cardboardCabinet,twoDrawerCabinet=@twoDrawerCabinet,fourDrwaerCabinet=@fourDrwaerCabinet,fishingPole=@fishingPole,foldingChair=@foldingChair,wineRack=@wineRack,footLocker=@footLocker,cardTableLarge=@cardTableLarge,golfEquip=@golfEquip,spaceHeater=@spaceHeater,metalShelves=@metalShelves,pingpongTable=@pingpongTable,poolTableComp=@poolTableComp,poolTableSlate=@poolTableSlate,powerTool=@powerTool,powerToolStand=@powerToolStand,skis=@skis,sled=@sled,suitCase=@suitCase,tackleBox=@tackleBox,tire=@tire,tireAndRims=@tireAndRims,toolChestSmall=@toolChestSmall,toolChestMed=@toolChestMed,toolChestLarge=@toolChestLarge,toolChestXL=@toolChestXL,trashCan=@trashCan,trampoline=@trampoline,treadmill=@treadmill,tricycle=@tricycle,workBench=@workBench,sewingCabinet=@sewingCabinet,largeSafe=@largeSafe,medSafe=@medSafe,smallSage=@smallSage,gunSafe=@gunSafe,statue=@statue where serviceID=@serviceID">
                                <SelectParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        <asp:SqlDataSource
                                ID="srcCubeSheetPacking"
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


                        </li>

                        <asp:LinkButton ID="btnGarageCollapse" runat="server" href="#collapseGarageRoom" class="nav-link h6" data-toggle="collapse" aria-expanded="false" aria-controls="collapseGarageRoom">
                            Packing <i class="fas fa-caret-square-down"></i></asp:LinkButton>
                        <li class="list-group-item collapse" id="collapseGarageRoom">
                            <asp:FormView
                                ID="fvGarage"
                                runat="server"
                                DataSourceID="srcCubeSheetPacking"
                                DefaultMode="Edit">
                                <EditItemTemplate>
                                    
                                   <asp:LinkButton ID="LinkButton9" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>

                                    <table class="table table-condensed">
                                        <tbody>
                                            <tr>
                                                <td>Dish Pack</td>
                                                <td>
                                                    <asp:TextBox ID="txtDishPack" runat="server" Text='<%# Bind("dishPack") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Lay Flat</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobeLayflat" runat="server" Text='<%# Bind("wardrobeLayFlat") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Wardrobe Standup</td>
                                                <td>
                                                    <asp:TextBox ID="txtWardrobeStandup" runat="server" Text='<%# Bind("wardrobeStandup") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Books</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallBooks" runat="server" Text='<%# Bind("smallBooks") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Small Cartons</td>
                                                <td>
                                                    <asp:TextBox ID="txtSmallCartons" runat="server" Text='<%# Bind("smallCartons") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Medium Cartons</td>
                                                <td>
                                                    <asp:TextBox ID="txtMedCartons" runat="server" Text='<%# Bind("mediumCartons") %>' class="form-control" TextMode="Number"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Large Cartons</td>
                                                <td>
                                                    <asp:TextBox ID="txtLargeCartons" runat="server" Text='<%# Bind("largeCartons") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>XL Cartons</td>
                                                <td>
                                                    <asp:TextBox ID="txtXLCartons" runat="server" Text='<%# Bind("XLCartons") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td>Mirror Carton</td>
                                                <td>
                                                    <asp:TextBox ID="txtMirrorCarton" runat="server" Text='<%# Bind("mirrorCarton") %>' class="form-control" TextMode="Number"></asp:TextBox></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:LinkButton ID="btnSaveGarage" CommandName="Update" runat="server" OnClick="btnSaveTab3_Click" class="mb-2">Save</asp:LinkButton>
                                </EditItemTemplate>
                            </asp:FormView><%--
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


                        </li>--%>


                    </ul>
                </div>


            </div>
        </div>
    </div>
</asp:Content>
