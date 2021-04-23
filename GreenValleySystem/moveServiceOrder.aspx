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
                                            <td>Packing Materials
                                            </td>
                                            <td>
                                                <asp:Label ID="Label1" runat="server"
                                                    Text='<%# (Eval("smallamt").ToString() == "0") ? "" : "Small " + Eval("smallamt").ToString() +  "<br>" %>'></asp:Label>
                                                <asp:Label ID="Label2" runat="server"
                                                    Text='<%# (Eval("medamt").ToString() == "0") ? "" : " Medium " + Eval("medamt").ToString() +  "<br>"  %>'></asp:Label>
                                                <asp:Label ID="Label3" runat="server"
                                                    Text='<%# (Eval("largeamt").ToString() == "0") ? "" : " Large " + Eval("largeamt").ToString() +  "<br>"  %>'></asp:Label>
                                                <asp:Label ID="Label4" runat="server"
                                                    Text='<%# (Eval("smallPadsamt").ToString() == "0") ? "" : " Small Pads " + Eval("smallPadsamt").ToString() +  "<br>" %>'></asp:Label>
                                                <asp:Label ID="Label5" runat="server"
                                                    Text='<%# (Eval("largePadsamt").ToString() == "0") ? "" : " Large Pads " + Eval("largePadsamt").ToString() +  "<br>"  %>'></asp:Label>

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
                            <div class="col">
                                <asp:Button ID="btnAddtoPickup" runat="server" Text="Add" OnClick="btnAddtoPickup_Click" class="btn btn-primary" />
                            </div>

                            <asp:SqlDataSource
                                ID="srcAllEmployees"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:Connect %>"
                                SelectCommand="Select employeeID, firstName + ' ' + lastName as employeeName from Employee where currentEmployee=1"></asp:SqlDataSource>

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
                            InsertCommand="Insert into assignment values(@employeeId, @serviceID, 'packing')"
                            DeleteCommand="Delete from assignment where employeeID=@employeeID and serviceID=@serviceID">
                            <SelectParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                                <asp:ControlParameter Name="employeeID" ControlID="ddlEmployees" />
                            </InsertParameters>
                            <DeleteParameters>
                                <asp:SessionParameter Name="serviceID" SessionField="selectedService" />
                            </DeleteParameters>
                        </asp:SqlDataSource>
                    </div>
                </li>

                <%-- Trash Service Order --%>
                <li class="list-group-item">
                    <asp:FormView
                        ID="fvTrash"
                        runat="server"
                        DefaultMode="Edit"
                        DataSourceID="srcService">
                        <EmptyDataTemplate>
                        </EmptyDataTemplate>
                        <EditItemTemplate>
                            <h4>Trash Removal Service Order</h4>
                            <%--<div class="row">
                                <div class="col">
                                    <asp:CheckBox ID="chDumpster" Checked='<%# Bind("dumpster")%>' Text="Need Dumpster?" runat="server" />
                                </div>--%>

                                <%--<div class="col">
                                    <asp:Label ID="lblMen" For="txtMen" runat="server" Text="Men Needed"></asp:Label>
                                    <asp:TextBox ID="txtMen" Text='<%# Bind("men")%>' TextMode="Number" Class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="col">
                                    <asp:Label ID="lblCharge" For="txtCharge" runat="server" Text="Cost"></asp:Label>
                                    <asp:TextBox ID="txtCharge" Text='<%# Bind("trash")%>' Class="form-control" runat="server"></asp:TextBox>
                                </div>--%>
<%--                            </div>--%>

                            <div class="mb-2 form-group form-row">
                                <asp:Label ID="lblTrash" For="txtTrashDesc" runat="server" Text="Trash Description"></asp:Label>
                                <asp:TextBox ID="txtTrashDesc" Text='<%# Bind("trashDesc")%>' TextMode="MultiLine" Class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <asp:LinkButton ID="lbtnSave" CommandName="Update" runat="server">Save</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:FormView>

                    <asp:SqlDataSource
                        ID="srcService"
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:Connect %>"
                        SelectCommand="Select * from moveAssessment  where moveAssessment.serviceID = @serviceID and moveAssessment.trash=1"
                        UpdateCommand="Update moveAssessment set dumpster = @dumpster, men=@men trash=@trash, trashdesc=@trashdesc where serviceID=@serviceID">
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
