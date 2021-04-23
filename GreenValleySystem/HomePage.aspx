<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab2.HomePage" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-10">
            <div class="card p-3" style="border: 1px solid #bb9739;">
               <asp:GridView
            ID="gvCustomerTickets"


            runat="server"
            DataKeyNames="customerID"
            DataSourceID="srcServices"
            AutoGenerateColumns="false"
            OnRowDataBound="gvCustomer_RowDataBound"
            OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged"
            class="table table-bordered table-condensed table-hover"
            AllowPaging="true"
            OnPageIndexChanging="gvCustomerTickets_PageIndexChanging"
            PageSize="10">
            <HeaderStyle BackColor="#266141" ForeColor="White"/>
            <Columns>
                
                <asp:BoundField DataField="customerName" HeaderText="Customer" />

                <asp:TemplateField HeaderText="Service Type">
                    <ItemTemplate>
                        <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" :  Eval("serviceType").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Progress">
                    <ItemTemplate>
                        <asp:Label ID="lblProgress" runat="server" Text='<%#(Eval("serviceEvent").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                <div class='tableauPlaceholder' id='viz1619145717008' style='position: relative'>
                    <noscript>
                        <a href='#'><img alt='Sheet 1 ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;ca&#47;calendar_16191456893770&#47;Sheet1&#47;1_rss.png' style='border: none' />

                        </a>

                    </noscript>
                    <object class='tableauViz'  style='display:none;'>
                        <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' />
                        <param name='embed_code_version' value='3' />
                        <param name='site_root' value='' />
                        <param name='name' value='calendar_16191456893770&#47;Sheet1' />
                        <param name='tabs' value='no' />
                        <param name='toolbar' value='yes' />
                        <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;ca&#47;calendar_16191456893770&#47;Sheet1&#47;1.png' />
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
                    var divElement = document.getElementById('viz1619145717008');
                    var vizElement = divElement.getElementsByTagName('object')[0];
                    vizElement.style.width = '100%';
                    vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
                    var scriptElement = document.createElement('script');
                    scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
                    vizElement.parentNode.insertBefore(scriptElement, vizElement);                

                </script>
                

        <asp:SqlDataSource
            ID="srcServices"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:Connect %>"
            SelectCommand="Select customer.customerID, serviceHistory.dateAdded, customer.FirstName + ' ' +  customer.LastName as customerName, serviceStatus, service.serviceType, serviceOpenDate, service.serviceID, serviceEvent
                from Customer inner join Service on customer.customerID = service.customerID
            inner join ServiceHistory on service.serviceID = servicehistory.serviceID
            inner join serviceEvents on serviceHistory.eventID=serviceEvents.eventID 
            where serviceStatus=1 AND
            serviceHistory.stepID IN
            (select max(stepID) from serviceHistory inner join service on serviceHistory.serviceID=service.serviceID group by service.serviceID)  
			order by serviceHistory.dateAdded">
        </asp:SqlDataSource>

        </div>
    </div>
</asp:Content>
