﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="updateResources.aspx.cs" Inherits="GreenValleySystem.updateResources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container ">
        <div class="card">
            <div class="card-header text-center">
                <asp:Label ID="Label1" runat="server" Text="Equipment" Class="h3 m-2"></asp:Label>
            </div>
            <div class="card-body">
                <asp:GridView
                    ID="gvEquipment"
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
                                    <asp:RegularExpressionValidator 
                                        id="revEquipment"  
                                        runat="server"
                                        ControlToValidate="txtEquipmentName" 
                                        ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                        ErrorMessage="Invalid Input" 
                                        ForeColor="Red">
                                    </asp:regularexpressionvalidator>
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

                <table class="table-borderless">
                    <tbody>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtEquipmentName" runat="server" Placeholder="Equipment Name" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEquipmentType" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEquipmentName"
                                    Text="Please Enter An Equipment Type." ValidationGroup="newEquipment">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator 
                                    id="revEquipment"  
                                    runat="server"
                                    ControlToValidate="txtEquipmentName" 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,40}$" 
                                    ErrorMessage="Invalid Input" 
                                    ValidationGroup="newEquipment"
                                    ForeColor="Red">
                                </asp:regularexpressionvalidator>
                                        </td>
                            <td>
                                <asp:TextBox ID="txtDatePurchased" runat="server" Placeholder="Equipment Name" TextMode="DateTimeLocal" class="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEquipmentName"
                                    Text="Please Enter A Purchase Date." ValidationGroup="newEquipment">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td class="align-top">
                                <asp:LinkButton ID="lblNewEquipment" OnClick="lbtnNewEquipment_Click" runat="server" ValidationGroup="newEquipment" class="btn btn-outline-primary">Add Equipment</asp:LinkButton>
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
                        <asp:ControlParameter Name="datePurchased" ControlID="txtDatePurchased" DbType="DateTime" />

                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
