﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="updateEmployees.aspx.cs" Inherits="GreenValleySystem.updateEmployees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblUdpateEmployees" runat="server" Text="Employees" Class="h3 m-2"></asp:Label>
            </div>
            <div class="card-body">
                <asp:GridView
                    ID="gvEmployees"
                    AutoGenerateColumns="false"
                    AutoGenerateDeleteButton="true"
                    AutoGenerateEditButton="true"
                    runat="server"
                    DataKeyNames="employeeID"
                    DataSourceID="srcEmployees"
                    class="table table-bordered table-condensed">
                    <Columns>
                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Bind("firstName") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName"
                                        Text="Please Enter A First Name.">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="firstNameValid"
                                         runat="server"
                                         ErrorMessage="Only Spaces and letters are valid characters!"
                                         ControlToValidate="txtFirstName"
                                         ValidationExpression="[a-zA-Z ]*$"
                                         ValidationGroup="newEmployee"
                                         ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("lastName") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName"
                                        Text="Please Enter A Last Name.">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="lastNameValid"
                                        runat="server"
                                        ErrorMessage="Only Spaces and letters are valid characters!"
                                        ControlToValidate="txtLastName"
                                        ValidationGroup="newEmployee"
                                        ValidationExpression="[a-zA-Z ]*$"
                                        ForeColor="Red"></asp:RegularExpressionValidator>

                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmployeeFirstName" runat="server" Text='<%# Bind("firstName")%>'></asp:Label>
                                <asp:Label ID="lblEmployeeLastName" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Position">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployeePosition" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPosition" runat="server" Text='<%# Bind("position") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPosition" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPosition"
                                        Text="Please Enter A Position." ValidationGroup="newEmployee">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="positionValid"
                                         runat="server"
                                         ErrorMessage="Only Spaces and letters are valid characters!"
                                         ControlToValidate="txtPosition"
                                         ValidationGroup="newEmployee"
                                         ValidationExpression="[a-zA-Z ]*$"
                                         ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmployeeEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                                        Text="Please Enter An Email." ValidationGroup="newEmployee">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                          runat="server"
                                          ControlToValidate="txtEmail"
                                          ForeColor="Red"
                                        ValidationGroup="newEmployee"
                                          ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                          Display = "Dynamic"
                                          ErrorMessage = "Invalid email address"/>
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

                <table class="table-borderless">
                    <tbody>
                        <tr>
                            
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" PlaceHolder="First Name" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName" ValidationGroup="newEmployee"
                                    Text="Please Enter A First Name.">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="firNameValid"
                                    runat="server"
                                    ValidationGroup="newEmployee"
                                    ErrorMessage="Only Spaces and letters are valid characters!"
                                    ControlToValidate="txtFirstName"
                                    ValidationExpression="[a-zA-Z ]*$"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name" class="form-control"></asp:TextBox>


                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName" ValidationGroup="newEmployee"
                                    Text="Please Enter A Last Name.">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="lastValid"
                                    runat="server"
                                    ErrorMessage="Only Spaces and letters are valid characters!"
                                    ControlToValidate="txtLastName"
                                    ValidationExpression="[a-zA-Z ]*$"
                                    ValidationGroup="newEmployee"
                                    ForeColor="Red">
                                </asp:RegularExpressionValidator>
                            </td>

                            <td>
                                <asp:TextBox ID="txtPosition" runat="server" PlaceHolder="Position" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPosition" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPosition"
                                    Text="Please Enter A Position." ValidationGroup="newEmployee">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="positionValid"
                                    runat="server"
                                    ErrorMessage="Only Spaces and letters are valid characters!"
                                    ControlToValidate="txtPosition"
                                    ValidationExpression="[a-zA-Z ]*$"
                                    ValidationGroup="newEmployee"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>

                            <td class="align-top">
                                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" class="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="emailValidate"
                                    runat="server"
                                    ControlToValidate="txtEmail"
                                    ForeColor="Red"
                                    ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                                    Display = "Dynamic"
                                    ValidationGroup="newEmployee"
                                    ErrorMessage = "Invalid email address"/>
                             <asp:RequiredFieldValidator 
                                 ID="rfvEmail" 
                                 runat="server"                
                                 ErrorMessage="RequiredFieldValidator" 
                                 ControlToValidate="txtEmail"                
                                 Text="Please Enter An Email." 
                                 ValidationGroup="newEmployee">
                                                            </asp:RequiredFieldValidator>
                            </td>
                            <td class="align-top">
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Placeholder="Password" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                    ErrorMessage="RequiredFieldValidator" 
                                    ControlToValidate="txtPassword"
                                    Text="Please Enter A Password." 
                                    ValidationGroup="newEmployee">
                                </asp:RequiredFieldValidator>
                               

                            </td>
                            <td class="align-top">
                                <asp:LinkButton ID="btnInsertEmployee" OnClick="btnInsertEmployee_Click" runat="server" ValidationGroup="newEmployee" class="btn btn-outline-primary">Add</asp:LinkButton>
                            </td>

                        </tr>
                    </tbody>
                </table>

            <div class="card">
                    <div class="card-header text-center">
                <asp:Label ID="lblInactive" runat="server" Text="Inactive Employees" Class="h3 m-2"></asp:Label>
            </div>

                     
                     <asp:GridView
                        ID="gvInactiveEmployees"
                        runat="server"
                        DataKeyNames="employeeID"
                        DataSourceID="srcInactive"
                        AutoGenerateColumns="false"
                        AutoGenerateEditButton="true"
                
                        class="table table-bordered table-condensed table-hover"
                        AllowPaging="false"
              
                        PageSize="5"
                        AllowSorting="true">
                        <HeaderStyle BackColor="#266141" ForeColor="White" />
                        <Columns>
                            
                            
                            <asp:BoundField DataField="firstName" HeaderText="First Name"
                                    SortExpression="firstName"/>
                            <asp:BoundField DataField="lastName" HeaderText="Last Name"
                                    SortExpression="Last Name"/>
                            <asp:BoundField DataField="position" HeaderText="Position"
                                    SortExpression="position"/>
                            <asp:BoundField DataField="email" HeaderText="Email"
                                    SortExpression="email"/>
                            
                        </Columns>
            </asp:GridView>
                            
                </div>

                <asp:SqlDataSource
                    ID="srcEmployees"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="SELECT * from Employee where currentEmployee = 1"
                    UpdateCommand="UPDATE Employee SET firstName=@firstName, lastName=@lastName, position=@position, email=@email where employeeID=@employeeID"
                    InsertCommand="INSERT into Employee(firstName,lastName,Position, currentEmployee, email) VALUES(@firstName,@lastName,@Position,1,@email)"
                    DeleteCommand="UPDATE EMPLOYEE set currentEmployee=0 where employeeID=@employeeID"
                    runat="server">
                    <UpdateParameters>
                        <asp:Parameter Name="password" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:ControlParameter Name="firstName" ControlID="txtFirstName" Type="String" />
                        <asp:ControlParameter Name="lastName" ControlID="txtLastName" Type="String" />
                        <asp:ControlParameter Name="email" ControlID="txtEmail" Type="String" />
                        <asp:ControlParameter Name="position" ControlID="txtPosition" />
                        <asp:Parameter Name="password" />
                    </InsertParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource 
                 ID="srcInactive"
                 runat="server"
                 ConnectionString="<%$ ConnectionStrings:Connect %>"
                 SelectCommand="select * from Employee where currentEmployee=0"
                 UpdateCommand="UPDATE EMPLOYEE SET currentEmployee=1 where employeeID = @employeeID">

                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>
