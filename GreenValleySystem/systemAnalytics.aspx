<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="systemAnalytics.aspx.cs" Inherits="GreenValleySystem.systemAnalytics" %>

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
           <%-- <div class='tableauPlaceholder' id='viz1618779381606' style='position: relative'>
                            <asp:Button ID="btnHome" runat="server" class="btn btn-primary btn-block mb-3" Text="Return to Home Page" OnClick="btnHome_Click" />
                            
                <noscript>
                    <a href='#'>
                        <img alt=' ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Gr&#47;GreenValleyWorkbook&#47;StorageLocations&#47;1_rss.png' style='border: none' />

                    </a>

                </noscript>
                <object class='tableauViz'  style='display:none;'>
                    <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
                    <param name='embed_code_version' value='3' />
                    <param name='site_root' value='' />
                    <param name='name' value='GreenValleyWorkbook&#47;StorageLocations' />
                    <param name='tabs' value='yes' />
                    <param name='toolbar' value='yes' />
                    <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Gr&#47;GreenValleyWorkbook&#47;StorageLocations&#47;1.png' />
                    <param name='animate_transition' value='yes' />
                    <param name='display_static_image' value='yes' />
                    <param name='display_spinner' value='yes' />
                    <param name='display_overlay' value='yes' />
                    <param name='display_count' value='yes' />
                    <param name='language' value='en' />
                    <param name='filter' value='publish=yes' />
                </object>

            </div>                
            <script type='text/javascript'>                 
                var divElement = document.getElementById('viz1618779381606');
                var vizElement = divElement.getElementsByTagName('object')[0];
                vizElement.style.width = '100%';
                vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
                var scriptElement = document.createElement('script');
                scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
                vizElement.parentNode.insertBefore(scriptElement, vizElement);                

            </script>--%>

         <div class="card p-3 mb-6 col-12" style="border: 1px solid #bb9739; height:420px; overflow:scroll">
             <h2 class="text-center">Phonebook</h2>
             <asp:GridView
                ID="gvPhonebook"
                runat="server"
                DataKeyNames="customerID"
                DataSourceID="srcPhonebook"
                AutoGenerateColumns="false"
                
                class="table table-bordered table-condensed table-hover"
                AllowPaging="false"
              
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

                    <asp:TemplateField HeaderText="Alternate Phone" SortExpression="Alternate Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblAltPhone" runat="server" Text='<%#(Eval("Alternate Phone").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Text='<%#(Eval("Address").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%#(Eval("Email").ToString())%>'></asp:Label>
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
                 SelectCommand="SELECT customerID,firstName as 'First Name', lastName as 'Last Name', phoneNumber as 'Phone', altPhoneNumber as 'Alternate Phone', email as 'Email', streetAddress as 'Address', format(initialContactDate,'MM/dd/yy') as 'Initial Contact Date'
                 FROM            CUSTOMER"></asp:SqlDataSource>
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
