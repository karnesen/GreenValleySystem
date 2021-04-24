<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="auctionAssessment.aspx.cs" Inherits="GreenValleySystem.auctionAssessment" %>

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
                                <asp:RegularExpressionValidator 
	                                id="revSell"  
                                    runat="server"
                                    ControlToValidate="txtBoxSell" 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                    ErrorMessage="Invalid Input" 
                                    ForeColor="Red">
                                </asp:regularexpressionvalidator>
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
                            <asp:RegularExpressionValidator 
	                            id="RegularExpressionValidator1"  
                                runat="server"
                                ControlToValidate="txtTrash" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                ErrorMessage="Invalid Input" 
                                ForeColor="Red">
                            </asp:regularexpressionvalidator>

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
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblFar" for="txtFarFromLoading" runat="server" Text="Distance from Loading Door"></asp:Label>
                                        <asp:TextBox ID="txtFarFromLoading" TextMode="MultiLine" Text='<%# Bind("howFar")%>' runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label ID="lblSteps" for="txtSteps" runat="server" Text="Steps"></asp:Label>
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
                                                    <asp:TextBox ID="txtPickUp" runat="server" Text='<%# Bind("pickUpFee")%>' class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblConsignment" For="txtConsignment" runat="server" Text="Consignment Rate"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtConsignment" runat="server" Text='<%# Bind("Consignment")%>' class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblTrash" For="txtTrash" runat="server" Text="Trash Removal"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtTrash" runat="server" Text='<%# Bind("Trash")%>' class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblAdditional" For="txtAdd" runat="server" Text="Additional Fees"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAdd" runat="server" Text='<%# Bind("additional")%>' class="form-control"></asp:TextBox>

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <asp:TextBox ID="txtInventory" TextMode="MultiLine" Rows="20"  Class="form-control  fixed-bottom w-25" PlaceHolder="Inventory" Text='<%# Bind("Inventory") %>' runat="server"></asp:TextBox>
                                    <asp:Button ID="btnSaveChanges" Text="Save" runat="server" CommandName="Update" Class="btn btn-outline-primary" />

                                </EditItemTemplate>
                            </asp:FormView>


                            <asp:SqlDataSource
                                ID="srcAssessment"
                                runat="server"
                                SelectCommand="Select * from auctionAssessment where serviceID=@serviceID"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                UpdateCommand="Update auctionAssessment set inventory=@inventory,
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

            </div>
        </div>
    </div>
</asp:Content>
