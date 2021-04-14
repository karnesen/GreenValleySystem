<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="completion.aspx.cs" Inherits="GreenValleySystem.completion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card card-body">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">
                <h4>Customer Information</h4>
                <asp:FormView
                    ID="fvCustomerInfo"
                    runat="server"
                    DataSourceID="srcCustomerInfo">
                    <ItemTemplate>
                        <div class="mb-2">
                            <asp:Label ID="lblServiceType" Class="h6" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" : Eval("serviceType").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                        </div>
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
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
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
                    SelectCommand="Select serviceType, email, firstName + ' ' + lastName as customerName, phoneNumber + ' ' + phoneType as phone1, altphoneNumber + ' ' + phoneType2 as phone2
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
                        <h4>Addresses</h4>
                        <div id="itemPlaceholder" runat="server"></div>
                    </li>
                </LayoutTemplate>
                <EmptyItemTemplate>
                    No Addresses Specificed
                </EmptyItemTemplate>
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

            <li class="list-group-item">
                <h4>Service Review</h4>
                <asp:FormView
                    ID="fvCompletion"
                    DefaultMode="Edit"
                    runat="server"
                    DataSourceID="srcCompletion">
                    <EditItemtemplate>
                        <div class="mb-2">
                            <asp:TextBox ID="txtComments" Class="form-control" Text='<%# Bind("comments") %>' TextMode="MultiLine" Placeholder="Comments" runat="server"></asp:TextBox>
                        </div>
                        <div class="mb-2">
                            <asp:DropDownList ID="ddlExperience" runat="server" class="form-control" SelectedValue='<%# Bind("positiveExperience") %>'>
                                <asp:ListItem Value="0">Positive</asp:ListItem>
                                <asp:ListItem Value="1">Negative</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <asp:LinkButton ID="lbtnSave" runat="server" CommandName="Update">Save</asp:LinkButton>
                    </EditItemtemplate>
                </asp:FormView>

                <asp:SqlDataSource
                ID="srcCompletion"
                ConnectionString="<%$ ConnectionStrings:Connect %>"
                SelectCommand="SELECT * from completion inner join service on completion.serviceID = service.serviceID where service.serviceID = @serviceID"
                UpdateCommand="Update completion set comments=@comments, positiveExperience=@positiveExperience where serviceID = @serviceID; UPDATE service set serviceStatus=0 where serviceID = @serviceID"
                runat="server">
                <SelectParameters>
                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                </SelectParameters>
                     <UpdateParameters>
                    <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </li>

        </ul>
    </div>
</asp:Content>
