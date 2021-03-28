<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="auctionAssessment.aspx.cs" Inherits="GreenValleySystem.auctionAssessment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card card-body">

        <asp:FormView
            ID="fvAuctionAssessment"
            runat="server"
            DataKeyNames="serviceID"
            OnItemCommand="fvAuctionAssessment_ItemCommand"
            DataSourceID="srcAuctionAssessment"
            DefaultMode="ReadOnly">
            <ItemTemplate>
                <asp:LinkButton ID="Edit"
                    Text="Edit"
                    CommandName="Edit"
                    runat="server" />

                <div class="form-group row">
                    <asp:Label ID="lblSell" for="txtBoxSell" runat="server" class="col-sm-2 col-form-label" Text="What to Sell"></asp:Label>

                    <div class="col-sm-10">
                        <asp:TextBox ID="txtBoxSell" Text='<%# Bind("whatSell") %>' TextMode="MultiLine" ReadOnly="true" Rows="4" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblWhySell" for="txtWhySell" runat="server" class="col-sm-2 col-form-label" Text="Why Sell:"></asp:Label>

                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlReason" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("whySell") %>'>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Settling and Estate</asp:ListItem>
                            <asp:ListItem>Moving and Need to Downsize</asp:ListItem>
                            <asp:ListItem>Just Getting Rid of Some Stuff</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblScheduled" for="chHome" runat="server" class="col-sm-2 col-form-label" Text="Schedule:"></asp:Label>

                    <div class="col-sm-10">
                        <div class="row form-group justify-content-around">
                            <div class="form-check">
                                <asp:CheckBox ID="chHome" Text="Bring In" Checked='<%# Bind("bringIn") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chMobile" Text="Auction Walk Through" Checked='<%# Bind("auctionWalkThrough") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chText" Text="Pick Up" Checked='<%# Bind("pickUp") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chEmail" Text="Trash Removal" Checked='<%# Bind("trashRemoval") %>' runat="server" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group row" >
                    <div class="col-sm-10">
                        <div class="form-check" >
                            <asp:RadioButton ID="rdoCust" Checked='<%# Bind("custLookAt") %>' runat="server" Text="Customer Requests Auction Look At" GroupName="lookAt" visible='<%#Eval("auctionWalkThrough")%>'/>
                        </div>
                        <div class="form-check">
                            <asp:RadioButton ID="rdoGV" Checked='<%# Bind("gvLookAt") %>' runat="server" Text="Green Valley Requires Look At"  GroupName="lookAt" visible='<%#Eval("auctionWalkThrough") %>'/>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <div class="form-check">
                            <asp:CheckBox ID="chPhotos" Text="Requested Photos" Checked='<%# Bind("photos") %>' runat="server" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <div class="form-check">
                            <asp:CheckBox ID="chItems" Text="Requested Items" Checked='<%# Bind("items") %>' runat="server" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblAdditional" for="chMove" runat="server" class="col-sm-2 col-form-label" Text="Additional Services Needed:"></asp:Label>
                    <div class="col-sm-10">
                        <div class="row form-group justify-content-around">
                            <div class="form-check">
                                <asp:CheckBox ID="chMove" Text="Move" Checked='<%# Bind("move") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chAppraisal" Text="Appraisal" Checked='<%# Bind("appraisal") %>' runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>

            <EditItemTemplate>
                <asp:LinkButton ID="UpdateButton"
                    Text="Update"
                    CommandName="Update"
                    runat="server" />
                <asp:LinkButton ID="CancelButton"
                    Text="Cancel"
                    CommandName="Cancel"
                    runat="server" />

                <div class="form-group row">
                    <asp:Label ID="lblSell" for="txtBoxSell" runat="server" class="col-sm-2 col-form-label" Text="What to Sell"></asp:Label>

                    <div class="col-sm-10">
                        <asp:TextBox ID="txtBoxSell" Text='<%# Bind("whatSell") %>' TextMode="MultiLine" Rows="4" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>


                <div class="form-group row">
                    <asp:Label ID="lblWhySell" for="txtWhySell" runat="server" class="col-sm-2 col-form-label" Text="Why Sell:"></asp:Label>

                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddlReason" runat="server" class="dropdown form-control" SelectedValue='<%# Bind("whySell") %>'>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>Settling and Estate</asp:ListItem>
                            <asp:ListItem>Moving and Need to Downsize</asp:ListItem>
                            <asp:ListItem>Just Getting Rid of Some Stuff</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblScheduled" for="chHome" runat="server" class="col-sm-2 col-form-label" Text="Schedule:"></asp:Label>

                    <div class="col-sm-10">
                        <div class="row form-group justify-content-around">
                            <div class="form-check">
                                <asp:CheckBox ID="chBringIn" Text="Bring In" Checked='<%# Bind("bringIn") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chWalkThrough" Text="Auction Walk Through" Checked='<%# Bind("auctionWalkThrough") %>' runat="server" data-toggle="collapse" data-target="#collapseExample" aria-controls="collapseExample"/>
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chPickUp" Text="Pick Up" Checked='<%# Bind("pickUp") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chTrash" Text="Trash Removal" Checked='<%# Bind("trashRemoval") %>' runat="server" />
                            </div>
                        </div>
                    </div>
                </div>

                 <div class="form-group row collapse show" id="collapseExample">
                    <div class="col-sm-10">
                        <div class="form-check">
                            <asp:RadioButton ID="rdoCust" Checked='<%# Bind("custLookAt") %>' runat="server" Text="Customer Requests Auction Look At" GroupName="lookAt" visible='<%#Eval("auctionWalkThrough") %>'/>
                        </div>
                        <div class="form-check">
                            <asp:RadioButton ID="rdoGV" Checked='<%# Bind("gvLookAt") %>' runat="server" Text="Green Valley Requires Look At"  GroupName="lookAt" visible='<%#Eval("auctionWalkThrough") %>'/>
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <div class="form-check">
                            <asp:CheckBox ID="chPhotos" Text="Requested Photos" Checked='<%# Bind("photos") %>' runat="server" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="col-sm-10">
                        <div class="form-check">
                            <asp:CheckBox ID="chItems" Text="Requested Items" Checked='<%# Bind("items") %>' runat="server" />
                        </div>
                    </div>
                </div>

                <div class="form-group row">
                    <asp:Label ID="lblAdditional" for="chMove" runat="server" class="col-sm-2 col-form-label" Text="Additional Services Needed:"></asp:Label>
                    <div class="col-sm-10">
                        <div class="row form-group justify-content-around">
                            <div class="form-check">
                                <asp:CheckBox ID="chMove" Text="Move" Checked='<%# Bind("move") %>' runat="server" />
                            </div>
                            <div class="form-check">
                                <asp:CheckBox ID="chAppraisal" Text="Appraisal" Checked='<%# Bind("appraisal") %>' runat="server" />
                            </div>
                        </div>
                    </div>
                </div>


            </EditItemTemplate>

        </asp:FormView>
    </div>

    <asp:SqlDataSource
        ID="srcAuctionAssessment"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:Connect %>"
        SelectCommand="Select * from auctionAssessment where serviceID=@serviceID"
        UpdateCommand="UPDATE auctionAssessment Set whatSell=@whatSell, whySell=@whySell, bringIn=@bringIn, auctionWalkThrough=@auctionWalkThrough, custLookAt=@custLookAt, gvLookAt=@gvLookAt,
        pickUp=@pickUp, trashRemoval=@trashRemoval, photos=@photos, items=@items, move=@move, appraisal=@appraisal where serviceID=@serviceID">
        <SelectParameters>
            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
