<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="appraisalServiceOrder.aspx.cs" Inherits="GreenValleySystem.appraisalServiceOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="card">
        <div class="card-header text-center">
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

            <li class="list-group-item">
                <asp:FormView
                    ID="fvAppraisal"
                    runat="server"
                    DataSourceID="srcAppraisal"
                    DefaultMode="edit">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlPurpose" runat="server" class="form-control" SelectedValue='<%#Bind("appraisalPurpose")%>'>
                            <asp:ListItem Value="0" Text="Tax"></asp:ListItem>
                            <asp:ListItem Value="1" Text="Family Division"></asp:ListItem>
                        </asp:DropDownList>

                        <div class="row">
                            <div class="col">
                                Deadline Start
                                <asp:TextBox ID="txtAppraisalStartDate" runat="server" Text='<%#Bind("serviceDeadlineStart", "{0:yyyy-MM-ddTHH:mm}")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </div>
                            <div class="col">
                                Deadline End
                                <asp:TextBox ID="txtAppraisalEndDate" runat="server" Text='<%#Bind("serviceDeadlineEnd", "{0:yyyy-MM-ddTHH:mm}")%>' class="form-control" TextMode="DateTimeLocal"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            Appraisal Size
                            <asp:TextBox ID="txtAppraisalSize" Class="form-control" Text='<%#Bind("appraisalSize")%>' TextMode="MultiLine" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator 
	                            id="revEquipment"  
                                runat="server"
                                ControlToValidate="txtAppraisalSize" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                ErrorMessage="Invalid Input" 
                                ForeColor="Red">
                            </asp:regularexpressionvalidator>
                        </div>

                        <div class="form-group">
                            Inventory
                            <asp:TextBox ID="txtInventory" Class="form-control" Text='<%#Bind("inventory")%>' TextMode="MultiLine" runat="server"></asp:TextBox>
                            <asp:RegularExpressionValidator 
	                            id="RegularExpressionValidator1"  
                                runat="server"
                                ControlToValidate="txtInventory" 
                                ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                ErrorMessage="Invalid Input" 
                                ForeColor="Red">
                            </asp:regularexpressionvalidator>
                        </div>

                        <asp:LinkButton ID="lbtnSave" runat="server" CommandName="Update">Save</asp:LinkButton>

                    </EditItemTemplate>

                </asp:FormView>

                <asp:SqlDataSource
                    ID="srcAppraisal"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    UpdateCommand="Update appraisal set appraisalSize=@appraisalSize, inventory=@inventory, appraisalPurpose=appraisalPurpose where serviceID=@serviceID;
                        Update service set serviceDeadlineStart=parse(@serviceDeadlineStart as dateTime), serviceDeadlineEnd=parse(@serviceDeadlineEnd as dateTime) where serviceID=@serviceID;"
                    SelectCommand="Select * from appraisal inner join service on appraisal.serviceID = service.serviceID where service.serviceID=@serviceID">
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
    </div>
</asp:Content>
