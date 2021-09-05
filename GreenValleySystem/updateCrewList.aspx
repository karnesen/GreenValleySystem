<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="updateCrewList.aspx.cs" Inherits="GreenValleySystem.updateCrewList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container col-10">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblUdpateEmployees" runat="server" Text="Crew Lists" Class="h3 m-2"></asp:Label>
            </div>
        
            <asp:GridView ID="gvCrews"
                runat="server"
                DataSourceID="srcCrews"
                AutoGenerateEditButton="true"
                DataKeyNames="employeeID"
                AllowPaging="false"
                class="table table-bordered table-condensed table-hover rounded"
                AllowSorting="true"
                AutoGenerateColumns="false">
                <HeaderStyle BackColor="#266141" ForeColor="White" />

                <Columns>
                    <asp:BoundField DataField="Customer First Name" HeaderText="Customer First Name" SortExpression="Customer First Name" ReadOnly="true"/>
                    <asp:BoundField DataField="Customer Last Name" HeaderText="Customer First Name" SortExpression="Customer Last Name" ReadOnly="true"/>
                    
                    <asp:TemplateField HeaderText="Service Type" SortExpression="Service Type">
                        <ItemTemplate>
                            <asp:Label ID="lblServiceType" runat="server" Text='<%#Eval("Service Type").ToString() == "M" ? "Move" :  Eval("Service Type").ToString() == "A" ? "Auction" : "Appraisal"%>'></asp:Label>
                            
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Employee First Name" HeaderText="Employee First Name" SortExpression="Employee First Name" ReadOnly="true" />
                    <asp:BoundField DataField="Employee Last Name" HeaderText="Employee Last Name" SortExpression="Employee Last Name" ReadOnly="true" />
                  
                    
                    <asp:TemplateField SortExpression="Role" HeaderText="Employee Role" Visible="true">
                        <ItemTemplate>
                            <%#Eval("Role").ToString() %>
                        </ItemTemplate>
                        <EditItemTemplate>

                            <asp:DropDownList ID="ddlRole" runat="server" DataTextField="Role" DataValueField="Role" Visible="true">
                                <asp:ListItem>--select--</asp:ListItem>
                               <asp:ListItem Value="packing" Text="packing">packing</asp:ListItem>
                                <asp:ListItem Value="trash" Text="trash">trash</asp:ListItem>
                                <asp:ListItem Value="move" Text="move">move</asp:ListItem>
                            </asp:DropDownList>
                        
                        
                        
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>




            </asp:GridView>
            <asp:SqlDataSource ID="srcCrews" 
                runat="server"
                ConnectionString="<%$ ConnectionStrings:Connect %>"
                SelectCommand="SELECT CUSTOMER.firstName as 'Customer First Name', CUSTOMER.lastName as 'Customer Last Name', SERVICE.serviceType as 'Service Type', EMPLOYEE.employeeID,EMPLOYEE.firstName as 'Employee First Name', EMPLOYEE.lastName as 'Employee Last Name', ASSIGNMENT.employeeRole as 'Role' FROM ASSIGNMENT INNER JOIN SERVICE ON ASSIGNMENT.serviceID = SERVICE.serviceID INNER JOIN CUSTOMER ON SERVICE.customerID = CUSTOMER.customerID INNER JOIN EMPLOYEE ON ASSIGNMENT.employeeID = EMPLOYEE.employeeID"
                UpdateCommand="update assignment set employeeRole=@Role where serviceID=@serviceID and employeeID=@employeeID">
                <UpdateParameters>
                    <asp:ControlParameter Name="employeeID" ControlID="gvCrews" />
                    <asp:ControlParameter Name="Role" ControlID="ddlRole" Type="String"/>
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
   




        




    </div>







</asp:Content>
