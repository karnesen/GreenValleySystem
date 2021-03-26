﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="updateResources.aspx.cs" Inherits="GreenValleySystem.updateResources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="container col-5">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblUdpateEmployees" runat="server" Text="Employees" Class="h3 m-2"></asp:Label>
            </div>
            <div class="card-body">
                <asp:GridView
                    ID="gvEmployees"
                    ShowFooter="true"
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
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLastName" runat="server" Text='<%# Bind("lastName") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName"
                                        Text="Please Enter A Last Name.">
                                    </asp:RequiredFieldValidator>
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
                                </div>
                            </EditItemTemplate>
                        </asp:TemplateField>

                     

                    </Columns>
                </asp:GridView>

                <table class="table-bordered table-condensed">
                    <tbody>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnInsertEmployee" OnClick="btnInsertEmployee_Click" runat="server" ValidationGroup="newEmployee">Add Employee</asp:LinkButton>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:TextBox ID="txtFirstName" runat="server" PlaceHolder="First Name" class="form-control"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName" ValidationGroup="newEmployee"
                                        Text="Please Enter A Last Name.">
                                    </asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName" ValidationGroup="newEmployee"
                                        Text="Please Enter A First Name.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPosition" runat="server" PlaceHolder="Position" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPosition" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPosition" 
                                        Text="Please Enter A Position." ValidationGroup="newEmployee">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </td>

                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" class="form-control"></asp:TextBox>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Placeholder="Password" class="form-control"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                                    Text="Please Enter An Email." ValidationGroup="newEmployee">
                                </asp:RequiredFieldValidator>



                            </td>
                           
                        </tr>
                    </tbody>
                </table>

                <asp:SqlDataSource
                    ID="srcEmployees"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="SELECT * from Employee where currentEmployee = 1"
                    UpdateCommand="UPDATE Employee SET firstName=@firstName, lastName=@lastName, position=@position, email=@email, password=@password where employeeID=@employeeID"
                    InsertCommand="INSERT into Employee(firstName,lastName,Position, currentEmployee, email, password) VALUES(@firstName,@lastName,@Position,1,@email,@password)"
                    DeleteCommand="UPDATE EMPLOYEE set currentEmployee=0 where employeeID=@employeeID"
                    runat="server">
                    <InsertParameters>

                        <asp:ControlParameter Name="firstName" ControlID="txtFirstName" Type="String" />
                        <asp:ControlParameter Name="lastName" ControlID="txtLastName" Type="String" />
                        <asp:ControlParameter Name="email" ControlID="txtPosition" Type="String" />
                        <asp:ControlParameter Name="position" ControlID="txtEmail" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>


    <div class="container col-5">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="Label1" runat="server" Text="Equipment" Class="h3 m-2"></asp:Label>
            </div>
            <div class="card-body">
                <asp:GridView
                    ID="gvEquipment"
                    ShowFooter="true"
                    AutoGenerateColumns="false"
                    AutoGenerateDeleteButton="true"
                    AutoGenerateEditButton="true"
                    runat="server"
                    DataKeyNames="equipmentID"
                    DataSourceID="srcEquipment"
                    class="table table-bordered table-condensed">
                    <Columns>
                        <asp:TemplateField HeaderText="Equipment">
                            <EditItemTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEquipmentName" runat="server" Text='<%# Bind("equipmentType") %>' class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEquipmentType" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEquipmentName"
                                        Text="Please Enter An Equipment Type.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="EquipmentName" runat="server" Text='<%# Bind("equipmentType")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date Purchased">
                            <ItemTemplate>
                                <asp:Label ID="lblDatePurchased" runat="server" Text='<%# Bind("datePurchased")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>

                <table class="table-bordered table-condensed">
                    <tbody>
                        <tr>
                            <td>
                                <asp:LinkButton ID="lblNewEquipment" OnClick="lbtnNewEquipment_Click" runat="server" ValidationGroup="newEquipment">Add Equipment</asp:LinkButton>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEquipmentName" runat="server" Placeholder="Equipment Name" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEquipmentType" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEquipmentName"
                                        Text="Please Enter An Equipment Type." ValidationGroup="newEquipment">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDatePurchased" runat="server" Placeholder="Equipment Name" TextMode="DateTimeLocal" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEquipmentName"
                                        Text="Please Enter A Purchase Date." ValidationGroup="newEquipment">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </td>
                            </tr>
                        </tbody>
                    </table>
                <asp:SqlDataSource
                    ID="srcEquipment"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="SELECT * from Equipment where active = 1"
                    UpdateCommand="UPDATE Equipment SET equipmentType=@equipmentType where equipmentID=@equipmentID"
                    InsertCommand="INSERT into Equipment(equipmentType,datePurchased, active) VALUES(@equipmentType,@datePurchased,1)"
                    DeleteCommand="UPDATE EQUIPMENT set active=0 where equipmentID=@equipmentID"
                    runat="server">
                    <InsertParameters>

                        <asp:ControlParameter Name="equipmentType" ControlID="txtEquipmentName" Type="String" />
                        <asp:ControlParameter Name="datePurchased" ControlID="txtDatePurchased" DbType="DateTime"/>
                    </InsertParameters>
                </asp:SqlDataSource>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
