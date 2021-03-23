﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="updateResources.aspx.cs" Inherits="GreenValleySystem.updateResources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container col-5">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="lblUdpateEmployees" runat="server" Text="Employees" Class="h3 m-2"></asp:Label>
            </div>
            <div class="card-body">
                <asp:GridView
                    ID="gvEmployees"
                    AutoGenerateColumns="false"
                    AutoGenerateEditButton="true"
                    AutoGenerateDeleteButton="true"
                    AutoGenerateInsertButton="true"
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
                            <FooterTemplate>
                                <div class="form-group">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtFirstName" runat="server" PlaceHolder="First Name" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtLastName" runat="server" Placeholder="Last Name" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName"
                                            Text="Please Enter A Last Name.">
                                        </asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server"
                                            ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName"
                                            Text="Please Enter A First Name.">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </FooterTemplate>
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
                                        Text="Please Enter A Position.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtPosition" runat="server" PlaceHolder="Position" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPosition" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPosition"
                                        Text="Please Enter A Position.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </FooterTemplate>
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
                                        Text="Please Enter An Email.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <div class="form-group">
                                    <asp:TextBox ID="txtEmail" runat="server" Placeholder="Email" class="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                                        ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail"
                                        Text="Please Enter An Email.">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </FooterTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <table class="table-bordered table-condensed">
                    <tbody>
                        <tr>
                            <td>
                                <asp:LinkButton ID="btnNewEmployee" OnClick="btnNewEmployee_Click" runat="server">New</asp:LinkButton>
                            </td>

                            <td></td>
                            <td>
                                <div class="form-group">
                                </div>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>

                <asp:SqlDataSource
                    ID="srcEmployees"
                    ConnectionString="<%$ ConnectionStrings:Connect %>"
                    SelectCommand="SELECT * from Employee"
                    UpdateCommand="UPDATE Employee SET firstName=@firstName, lastName=@lastName, position=@position, email=@email where employeeID=@employeeID"
                    InsertCommand="INSERT into Employee(firstName,lastName,Position,email) VALUES(@firstName,@lastName,@Position,@email)"
                    DeleteCommand="Delete from Employee WHERE employeeID = @employeeID"
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
</asp:Content>