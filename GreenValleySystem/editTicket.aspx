<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="editTicket.aspx.cs" Inherits="Lab2.editTicket" EnableEventValidation="false" %>

<%--Kirsi And Josh Coleman 2/15/21--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center mb-4">
        <asp:Label ID="lblSelect" Text="Select Service" runat="server"></asp:Label>
        <asp:DropDownList
            ID="ddlServices"
            runat="server"
            DataSourceID="srcServices"
            DataTextField="ServiceOutput"
            DataValueField="serviceID"
            OnDataBound="ddlServices_DataBound">
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" Text="Select" />
    </div>

    <asp:SqlDataSource
        ID="srcServices"
        ConnectionString="<%$ ConnectionStrings:Connect %>"
        SelectCommand="SELECT CUSTOMER.firstName + ' ' + CUSTOMER.lastName as ServiceOutput, SERVICE.serviceID, CUSTOMER.customerID FROM CUSTOMER INNER JOIN
                  SERVICE ON CUSTOMER.customerID = SERVICE.customerID"
        runat="server"></asp:SqlDataSource>

    <div class="row justify-content-around">
        <div class=" col-5">
            <div class="card" id="serviceCard">
                <div class="card-header">
                    <ul class="nav nav-tabs card-header-tabs pull-right" id="myTab" role="tablist">
                        <li class="nav-item" runat="Server" id="navMove">
                            <a class="nav-link active" id="move-tab" data-toggle="tab" href="#moveDetails" role="tab" aria-controls="moveDetails" aria-selected="true">Move</a>
                        </li>
                        <li class="nav-item" runat="Server" id="navAuction">
                            <a class="nav-link" id="auction-tab" data-toggle="tab" href="#auctionDetails" role="tab" aria-controls="auctionDetails" aria-selected="false">Auction</a>
                        </li>
                        <li class="nav-item" runat="Server" id="navLookAt">
                            <a class="nav-link" id="lookAt-tab" data-toggle="tab" href="#lookAt" role="tab" aria-controls="lookAt" aria-selected="false">Auction</a>
                        </li>
                    </ul>
                </div>

                <div class="card-body">
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="moveDetails" role="tabpanel" aria-labelledby="move-tab">
                            <asp:DetailsView
                                ID="dvMove"
                                DataKeyNames="serviceID"
                                EmptyDataText ="This Ticket has no Move Request"
                                DataSourceID="srcMoveData"
                                AutoGenerateEditButton="false"
                                AutoGenerateRows="false"
                                DefaultMode="ReadOnly"
                                class="table table-bordered table-condensed"
                                runat="server">
                                <Fields>
                                    <asp:BoundField DataField="serviceDeadlineStart" HeaderText="Deadline Start" />
                                    <asp:BoundField DataField="serviceDeadlineEnd" HeaderText="Deadline End" />
                                    <asp:BoundField DataField="serviceCost" HeaderText="Cost" />
                                </Fields>
                            </asp:DetailsView>

                            <asp:SqlDataSource
                                ID="srcMoveData"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="SELECT MOVE.serviceDeadlineStart, MOVE.serviceDeadlineEnd, SERVICE.serviceCost, SERVICE.serviceID FROM
                                MOVE INNER JOIN SERVICE ON MOVE.serviceID = SERVICE.serviceID WHERE SERVICE.serviceID = @serviceID"
                                runat="server">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="serviceID"
                                        Type="Int32"
                                        ControlID="ddlServices" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:GridView
                                ID="gvMoveAddress"
                                AutoGenerateColumns="false"
                                runat="server"
                                DataKeyNames="serviceID"
                                DataSourceID="srcMoveDataDetails"
                                class="table table-bordered table-condensed">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="addressType" runat="server" Text='<%# (Eval("addressType").ToString() == "mp") ? "Pick Up Location" : "Drop Off Location" %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="streetAddress" HeaderText="Street Address" />
                                    <asp:BoundField DataField="city" HeaderText="City" />
                                    <asp:BoundField DataField="state" HeaderText="State" />
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource
                                ID="srcMoveDataDetails"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="SELECT ADDRESSES.streetAddress, ADDRESSES.city, ADDRESSES.state, ADDRESSES.zipcode, ADDRESSES.addressType, ADDRESSES.serviceID
                                    FROM ADDRESSES INNER JOIN MOVE ON ADDRESSES.serviceID = MOVE.serviceID WHERE ((ADDRESSES.addressType = 'mP') OR (ADDRESSES.addressType = 'mD'))
				                    AND MOVE.serviceID = @serviceID"
                                runat="server">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="serviceID"
                                        Type="Int32"
                                        ControlID="ddlServices" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                        <div class="tab-pane fade" id="auctionDetails" role="tabpanel" aria-labelledby="auction-tab">
                            <asp:DetailsView
                                ID="dvAuction"
                                DataKeyNames="serviceID"
                                EmptyDataText ="This Ticket has no Auction Request"
                                DataSourceID="srcAuctionData"
                                AutoGenerateEditButton="false"
                                AutoGenerateRows="false"
                                DefaultMode="ReadOnly"
                                class="table table-bordered table-condensed"
                                runat="server">
                                <Fields>
                                    <asp:BoundField DataField="serviceDeadlineStart" HeaderText="Deadline Start" />
                                    <asp:BoundField DataField="serviceDeadlineEnd" HeaderText="Deadline End" />
                                    <asp:BoundField DataField="serviceCost" HeaderText="Cost" />
                                </Fields>
                            </asp:DetailsView>

                            <asp:SqlDataSource
                                ID="srcAuctionData"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="SELECT AUCTION.serviceDeadlineStart, AUCTION.serviceDeadlineEnd, SERVICE.serviceCost, SERVICE.serviceID FROM
                                AUCTION INNER JOIN SERVICE ON AUCTION.serviceID = SERVICE.serviceID WHERE SERVICE.serviceID = @serviceID"
                                runat="server">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="serviceID"
                                        Type="Int32"
                                        ControlID="ddlServices" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:GridView
                                ID="gvAuctionDetails"
                                AutoGenerateColumns="false"
                                runat="server"
                                DataKeyNames="serviceID"
                                DataSourceID="srcAuctionDetails"
                                class="table table-bordered table-condensed">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="addressType" runat="server" Text='<%# (Eval("addressType").ToString() == "aP") ? "Pick Up Location" : "Other" %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="streetAddress" HeaderText="Street Address" />
                                    <asp:BoundField DataField="city" HeaderText="City" />
                                    <asp:BoundField DataField="state" HeaderText="State" />
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource
                                ID="srcAuctionDetails"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="SELECT ADDRESSES.streetAddress, ADDRESSES.city, ADDRESSES.state, ADDRESSES.zipcode, ADDRESSES.addressType, ADDRESSES.serviceID
                                    FROM ADDRESSES INNER JOIN AUCTION ON ADDRESSES.serviceID = AUCTION.serviceID WHERE (ADDRESSES.addressType = 'aP')
				                    AND Auction.serviceID = @serviceID"
                                runat="server">
                                <SelectParameters>
                                    <asp:ControlParameter
                                        Name="serviceID"
                                        Type="Int32"
                                        ControlID="ddlServices" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="tab-pane fade" id="lookAt" role="tabpanel" aria-labelledby="lookAt-tab">
                            <div class="form-group">

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <asp:Label ID="lblInventory" Text="Inventory" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <div class="card-body">
                    <asp:Button ID="btnAddInventory" runat="server" Text="Add Inventory" OnClick="btnAddInventory_Click" class="btn btn-outline-secondary"/>
                    <asp:Button ID="btnAuctionInventory" runat="server" Text="Auction Inventory" OnClick="btnAuctionInventory_Click" class="btn btn-outline-secondary"/>
                    <asp:GridView
                        ID="gvInventory"
                        runat="server"
                        DataSourceID="srcAuctionAssignment"
                        DataKeyNames="itemID"
                        AutoGenerateColumns="false"
                        class="table table-bordered table-condensed">
                        <Columns>
                            <asp:BoundField DataField="itemDescription" HeaderText="Item" />
                            <asp:BoundField DataField="auctionType" HeaderText="Auction Description" />
                            <asp:BoundField DataField="auctionStartDate" HeaderText="Auction Start" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource
                        ID="srcAuctionAssignment"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT AUCTIONEVENT.auctionType, AUCTIONEVENT.auctionStartDate, INVENTORY.itemDescription, INVENTORY.itemID FROM atAUCTION INNER JOIN
                            AUCTIONEVENT ON atAUCTION.auctionEventID = AUCTIONEVENT.auctionEventID RIGHT OUTER JOIN
                            INVENTORY ON atAUCTION.itemID = INVENTORY.itemID WHERE Inventory.serviceID = @serviceID">
                        <SelectParameters>
                            <asp:ControlParameter
                                Name="serviceID"
                                Type="Int32"
                                ControlID="ddlServices" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>

        <div class="col-5">
            <div class="card mb-2">
                <div class="card-header">
                    <asp:Label ID="lblAssignment" Text="Ticket Holder History" runat="server" Font-Bold="true"></asp:Label>
                </div>


                <ul class="list-group">
                    <li class="list-group-item">
                        <asp:Label ID="lblCurrent" Text="Current Ticket Holder: " runat="server" Font-Bold="true"></asp:Label>
                        <br />
                        <asp:Label ID="lblChange" Text="Assign to: " runat="server" Font-Bold="true"></asp:Label>
                        <asp:DropDownList
                            ID="ddlEmployee"
                            DataSourceID="srcEmployee"
                            DataTextField="Name"
                            DataValueField="employeeID"
                            runat="server">
                        </asp:DropDownList>
                        <asp:TextBox ID="txtAssignTicket" PlaceHolder="Assignment Note" runat="server"></asp:TextBox>
                        <asp:SqlDataSource
                            ID="srcEmployee"
                            ConnectionString="<%$ ConnectionStrings:Connect %>"
                            SelectCommand="Select employeeID, firstName + ' ' + lastName as Name from Employee"
                            runat="server"></asp:SqlDataSource>
                        <asp:Button ID="btnAssign" runat="server" Text="Assign" OnClick="btnAssign_Click" class="btn btn-outline-secondary" />
                    </li>

                    <li class="list-group-item">
                        <asp:GridView
                            ID="gvHolder"
                            DataSourceID="srcHolder"
                            runat="server"
                            class="table table-bordered table-condensed">
                        </asp:GridView>

                        <asp:SqlDataSource
                            ID="srcHolder"
                            ConnectionString="<%$ ConnectionStrings:Connect %>"
                            SelectCommand="SELECT EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as Employee, TICKETHOLDER.creationDate as Assigned, TICKETHOLDER.note 
                            FROM EMPLOYEE INNER JOIN TICKETHOLDER ON EMPLOYEE.employeeID = TICKETHOLDER.employeeID  
                            WHERE TICKETHOLDER.serviceTicketID = @serviceID
                            ORDER BY TICKETHOLDER.creationDate desc"
                            runat="server">
                            <SelectParameters>
                                <asp:ControlParameter
                                    Name="serviceID"
                                    Type="Int32"
                                    ControlID="ddlServices" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </li>
                </ul>
            </div>

            <div class="card mb-2">
                <div class="card-header">
                    <asp:Label ID="lblNotes" Text="Service Notes" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <div class="card-body">
                    <asp:GridView
                        ID="gvNotes"
                        DataSourceID="srcNotes"
                        OnRowDataBound="gvNotes_RowDataBound"
                        OnSelectedIndexChanged="gvNotes_SelectedIndexChanged"
                        runat="server"
                        class="table table-bordered table-condensed">
                    </asp:GridView>

                    <asp:SqlDataSource
                        ID="srcNotes"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT TICKETNOTE.ticketID as 'ID', TICKETNOTE.creationDate as 'Creation Date', EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as 'Created By', TICKETNOTE.noteTitle as 'Note Title' 
                            FROM TICKETNOTE INNER JOIN EMPLOYEE on TICKETNOTE.noteCreator = EMPLOYEE.employeeID WHERE serviceTicketID = @serviceID"
                        runat="server">
                        <SelectParameters>
                            <asp:ControlParameter
                                Name="serviceID"
                                Type="Int32"
                                ControlID="ddlServices" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Button ID="btnNewNote" runat="server" Text="Add Note" OnClick="btnNewNote_Click" Class="btn btn-outline-secondary" />
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <asp:Label ID="lblWorkflow" Text="Service Workers" runat="server" Font-Bold="true"></asp:Label>
                </div>
                <div class="card-body">
                    <asp:GridView
                        ID="gvAssignmnets"
                        DataSourceID="srcAssignments"
                        runat="server"
                        class="table table-bordered table-condensed">
                    </asp:GridView>

                    <asp:SqlDataSource
                        ID="srcAssignments"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="SELECT EMPLOYEE.firstName as 'First Name', EMPLOYEE.lastName as 'Last Name', ASSIGNMENT.startDate 'Start Date', ASSIGNMENT.employeeRole as 'Role' FROM ASSIGNMENT INNER JOIN
                  EMPLOYEE ON ASSIGNMENT.employeeID = EMPLOYEE.employeeID WHERE ASSIGNMENT.serviceTicketID = @serviceID"
                        runat="server">
                        <SelectParameters>
                            <asp:ControlParameter
                                Name="serviceID"
                                Type="Int32"
                                ControlID="ddlServices" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
