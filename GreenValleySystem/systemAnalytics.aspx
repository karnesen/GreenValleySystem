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
        </div>





        </div>
            </div>

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

    </form>
</body>
</html>
