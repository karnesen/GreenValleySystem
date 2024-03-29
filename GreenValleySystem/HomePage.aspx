﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Lab2.HomePage" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-10">
      <div class="row">
        <%--<div class="card p-3 mb-6 col-6" style="border: 1px solid #bb9739;height:500px; overflow:scroll">
            <p class="text-sm-center #bb9739">Recent Notes</p>
            <%-- <asp:ListView
                ID="lvNotes"
                runat="server"
                DataSourceID="srcNotes"
                DataKeyNames="customerID"
                >
                <LayoutTemplate>

                    <div runat="server" id="lstProducts">
                        <div runat="server" id="itemPlaceholder" />
                    </div>
                    <asp:DataPager runat="server" PageSize="3" ID="dataPager">
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkNote" Text='<%#Eval("NoteTitle")%>' runat="server" CommandName="Edit">LinkButton</asp:LinkButton>
                    </br>
                <asp:Label ID="noteText" runat="server" Text='<%# (Eval("noteText").ToString().Length>=200) ? Eval("noteText").ToString().Substring(0,100) + "..." : Eval("noteText") %>'></asp:Label>
                    </br>
                <asp:Label ID="lblCreatedBy" runat="server" Font-Italic="true" Text=' <%#"Created by " + Eval("CreatedBy") + " on " + Eval("CreationDate") %>'></asp:Label>
                    </br>
                </br>

                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lnkNote" Text='<%#Bind("NoteTitle")%>' runat="server" data-toggle="modal" data-target="#exampleModal">LinkButton</asp:LinkButton>
                    </br>
                    <asp:TextBox ID="txtNoteText" runat="server" TextMode="MultiLine" Rows="5" Text='<%#Bind("noteText")%>' Class="form-control"></asp:TextBox>
                    </br>
                    <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    <br />
                    <br />
                </EditItemTemplate>
            </asp:ListView>

            
             <asp:GridView
                ID="gvNotesRecent"
                runat="server"
                DataKeyNames="customerID"
                DataSourceID="srcNotes"
                AutoGenerateColumns="false"
                OnRowDataBound="gvNotesRecent_RowDataBound"
                OnSelectedIndexChanged="gvNotesRecent_SelectedIndexChanged"
                class="table table-bordered table-condensed table-hover"
                AllowPaging="false"
                OnPageIndexChanging="gvNotesRecent_PageIndexChanging"
                PageSize="5"
                AllowSorting="true">
                <HeaderStyle BackColor="#266141" ForeColor="White" />
                <Columns>

                    <asp:BoundField DataField="FirstName" HeaderText="First Name"
                         SortExpression="FirstName"/>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name"
                         SortExpression="LastName"/>

                    <asp:TemplateField HeaderText="Note Title" SortExpression="noteTitle">
                        <ItemTemplate>
                            <asp:Label ID="lblService" runat="server" Text='<%#(Eval("noteTitle").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Note Text" SortExpression="noteText">
                        <ItemTemplate>
                            <asp:Label ID="lblContact" runat="server" Text='<%#(Eval("noteText").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Created By" SortExpression="createdBy">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%#(Eval("createdBy").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date" SortExpression="creationDate">
                        <ItemTemplate>
                            <asp:Label ID="lblProgress" runat="server" Text='<%#(Eval("creationDate").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>




            </div>--%>
          <br />
          
             <div class="card p-3 mb-6 col-12" style="border: 1px solid #bb9739;height:500px; overflow:scroll">
                 <p class="text-sm-center #bb9739">Global Notes</p>
                 <asp:Button ID="btnNewGlobalNote" runat="server" Text="New Global Note" OnClick="btnNewGlobalNote_Click" Class="btn btn-secondary" />
             <%--<asp:ListView
                ID="ListView1"
                runat="server"
                DataSourceID="srcUpcoming"
                DataKeyNames="customerID"
                >
                <LayoutTemplate>

                    <div runat="server" id="lstProducts">
                        <div runat="server" id="itemPlaceholder" />
                    </div>
                    <asp:DataPager runat="server" PageSize="3" ID="dataPager">
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkNote" Text='<%#Eval("customerName")%>' runat="server" OnClick="lnkNote_Click">LinkButton</asp:LinkButton>
                    </br>
                
                <asp:Label ID="lblStartDate" runat="server"  Text=' <%#"Deadline Start: " + Eval("serviceDeadlineStart") %>'></asp:Label>
                    </br>
                </br>

                </ItemTemplate>
                <%--<EditItemTemplate>
                    <asp:LinkButton ID="lnkNote" Text='<%#Bind("NoteTitle")%>' runat="server" data-toggle="modal" data-target="#exampleModal">LinkButton</asp:LinkButton>
                    </br>
                    <asp:TextBox ID="txtNoteText" runat="server" TextMode="MultiLine" Rows="5" Text='<%#Bind("noteText")%>' Class="form-control"></asp:TextBox>
                    </br>
                    <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    <br />
                    <br />
                </EditItemTemplate>--%>
            <%--</asp:ListView>--%>

            <div style="border-radius: 8px; -moz-border-radius: 8px; -webkit-border-radius: 8px; overflow:hidden">
                  <asp:GridView
                ID="gvUpcomingServices"
                runat="server"
                DataKeyNames="employeeID"
                DataSourceID="srcGlobals"
                AutoGenerateColumns="false" 
                class="table table-bordered table-condensed table-hover"
                AllowPaging="false"
                OnPageIndexChanging="gvUpcomingServices_PageIndexChanging"
                PageSize="5"
                AllowSorting="true"
                AutoGenerateEditButton="true">
                <HeaderStyle BackColor="#266141" ForeColor="White" />
                
                    
            
                      <Columns>
                    <asp:BoundField DataField="authorName" HeaderText="Author Name"
                         SortExpression="authorName" ReadOnly="true"/>
                    

                    <asp:TemplateField HeaderText="Creation Date" SortExpression="creationDate">
                        <ItemTemplate>
                            <asp:Label ID="creationDate" runat="server" Text='<%#(Eval("creationDate").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Note Title" SortExpression="noteTitle">
                        <ItemTemplate>
                            <asp:Label ID="noteTitle" runat="server" Text='<%#(Eval("noteTitle").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Note Text" SortExpression="noteText">
                        <ItemTemplate>
                            <asp:Label ID="noteText" runat="server" Text='<%#(Eval("noteText").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Addressed To" SortExpression="noteReciever">
                        <ItemTemplate>
                            <asp:Label ID="noteReciever" runat="server" Text='<%#(Eval("noteReciever").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Completed" SortExpression="completed">
                        
                        <ItemTemplate>
                            <asp:Label ID="lblCompleted" runat="server" Enabled="false" Text='<%# Eval("completed").ToString() == "0" ? "No" : "Yes" %>'></asp:Label>
                        </ItemTemplate>
                    

               
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCompleted" runat="server" CssClass="form-control" DataValueField="completed" selectedvalue='<%#Bind("completed") %>'>
                                    <asp:ListItem Value="0">No</asp:ListItem>
                                    <asp:ListItem Value="1">Yes</asp:ListItem>

                            </asp:DropDownList>
                
                
                            
                        </EditItemTemplate>
                   
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Note ID" SortExpression="noteID">
                        <ItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%# (Eval("noteID").ToString()) %>'></asp:Label>
                            
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblID" runat="server" Text='<%#Bind("noteID") %>'></asp:Label>

                        </EditItemTemplate>
                    </asp:TemplateField>
                   
                </Columns>
                      
            </asp:GridView>

             </div>

            
            </div>
          </div>
        <br />

        
        <div class="card p-3 mb-3" style="border: 1px solid #bb9739; height:500px; overflow:scroll">
            <p class="text-sm-center #bb9739">Active Customers</p>

            <div style="border-radius: 8px; -moz-border-radius: 8px; -webkit-border-radius: 8px; overflow:hidden">
            <asp:GridView
                ID="gvCustomerTickets"
                runat="server"
                DataKeyNames="customerID"
                DataSourceID="srcServices"
                AutoGenerateColumns="false"
                OnRowDataBound="gvCustomer_RowDataBound"
                OnSelectedIndexChanged="gvCustomer_SelectedIndexChanged"
                class="table table-bordered table-condensed table-hover"
                AllowPaging="false"
                OnPageIndexChanging="gvCustomerTickets_PageIndexChanging"
                PageSize="5"
                AllowSorting="true">
                <HeaderStyle BackColor="#266141" ForeColor="White" />
                <Columns>

                    <asp:BoundField DataField="FirstName" HeaderText="First Name"
                         SortExpression="FirstName"/>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name"
                         SortExpression="LastName"/>

                    <asp:TemplateField HeaderText="Service Type" SortExpression="serviceType">
                        <ItemTemplate>
                            <asp:Label ID="lblService" runat="server" Text='<%#Eval("serviceType").ToString() == "M" ? "Move" :  Eval("serviceType").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Initial Contact" SortExpression="dateAdded">
                        <ItemTemplate>
                            <asp:Label ID="lblContact" runat="server" Text='<%#(Eval("dateAdded").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="City" SortExpression="city">
                        <ItemTemplate>
                            <asp:Label ID="lblCity" runat="server" Text='<%#(Eval("city").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Progress" SortExpression="serviceEvent">
                        <ItemTemplate>
                            <asp:Label ID="lblProgress" runat="server" Text='<%#(Eval("serviceEvent").ToString())%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </div>
        </div>
 
            <script type='text/javascript'>                    
                var divElement = document.getElementById('viz1619199502141');
                var vizElement = divElement.getElementsByTagName('object')[0];
                vizElement.style.width = '100%';
                vizElement.style.height = (divElement.offsetWidth * 0.75) + 'px';
                var scriptElement = document.createElement('script'); scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js';
                vizElement.parentNode.insertBefore(scriptElement, vizElement);

            </script>


            <asp:SqlDataSource
                ID="srcServices"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:Connect %>"
                SelectCommand="Select customer.customerID, customer.city, serviceHistory.dateAdded, customer.FirstName as 'FirstName', customer.LastName as 'LastName', customer.FirstName + ' ' + customer.LastName as 'customerName', serviceStatus, service.serviceType, serviceOpenDate, service.serviceID, serviceEvent, FORMAT(service.serviceDeadlineStart,'MM/dd/yy') AS 'serviceDeadlineStart', FORMAT(service.lastUpdated, 'MM-dd-yy') as 'lastUpdated'
                from Customer inner join Service on customer.customerID = service.customerID
            inner join ServiceHistory on service.serviceID = servicehistory.serviceID
            inner join serviceEvents on serviceHistory.eventID=serviceEvents.eventID 
            where serviceStatus=1 AND
            serviceHistory.stepID IN
            (select max(stepID) from serviceHistory inner join service on serviceHistory.serviceID=service.serviceID group by service.serviceID)  
			order by serviceHistory.dateAdded"></asp:SqlDataSource>

            <asp:SqlDataSource 
                 ID="srcNotes"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT customer.customerID, TICKETNOTE.ticketID, CUSTOMER.firstName, CUSTOMER.lastName, TICKETNOTE.noteTitle, TICKETNOTE.noteText, EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as 'CreatedBy', FORMAT(TICKETNOTE.creationDate, 'MM/dd/yy') as 'CreationDate'
                         FROM TICKETNOTE INNER JOIN
                         CUSTOMER ON TICKETNOTE.customerID = CUSTOMER.customerID INNER JOIN
                         EMPLOYEE ON TICKETNOTE.noteCreator = EMPLOYEE.employeeID
                         order by TICKETNOTE.creationDate desc"></asp:SqlDataSource>
        <asp:SqlDataSource 
                 ID="srcUpcoming"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT customer.customerID, CUSTOMER.firstName, CUSTOMER.lastName, format(SERVICE.serviceDeadlineStart,'MM/dd/yy') as 'serviceDeadlineStart' FROM SERVICE INNER JOIN CUSTOMER ON SERVICE.customerID = CUSTOMER.customerID WHERE service.serviceDeadlineStart > CURRENT_TIMESTAMP">

        </asp:SqlDataSource>

        <asp:SqlDataSource 
                 ID="srcGlobals"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="SELECT globalNotes.noteID, globalNotes.noteTitle, globalNotes.noteText, globalNotes.noteAuthor, globalNotes.noteReciever, globalNotes.creationDate as 'creationDate', globalNotes.completed, EMPLOYEE.employeeID, EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as 'authorName' FROM EMPLOYEE INNER JOIN globalNotes ON EMPLOYEE.employeeID = globalNotes.noteAuthor order by creationDate desc"
                 UpdateCommand="Update globalNotes set completed=@completed where noteID=@noteID">
            

        </asp:SqlDataSource>

        </div>
    </div>
    </div>
</asp:Content>
