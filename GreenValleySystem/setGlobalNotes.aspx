<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="setGlobalNotes.aspx.cs" Inherits="GreenValleySystem.setGlobalNotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container col-8" style="position:relative">
        <div class="card-header text-center">
                    <asp:Label ID="lblNewGlobalNote" runat="server" Text="New Global Note" Class="h3 m-2"></asp:Label>
                </div>

        <br />

        <div class="row col-md-4">
            <asp:Label ID="lblTitle" runat="server" Text="Note Title" class="h6"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" placeholder="Title" class="form-control"></asp:TextBox>

        </div>

        <div class="row col-md-4">
            <asp:Label ID="lblText" runat="server" Text="Note Text" class="h6"></asp:Label>
            <asp:TextBox ID="txtText" runat="server" class="form-control" placeholder="Note Text" TextMode="MultiLine"></asp:TextBox>

        </div>

        

        <div class="row col-md-4">
            <asp:Label ID="lblCrew" runat="server" Text="Crew Addressed To" class="h6"></asp:Label>
            <asp:CheckBoxList ID="cbxCrew" runat="server" DataSourceID="srcEmployees" DataValueField="fullName" CssClass="custom-checkbox"></asp:CheckBoxList>

        </div>

        <div class="row col-md-4">
            <asp:Label ID="lblCompleted" runat="server" Text="Completed" class="h6"></asp:Label>
            <asp:DropDownList ID="ddlCompleted" runat="server" CssClass="form-control">
                <asp:ListItem Value="0">No</asp:ListItem>
                <asp:ListItem Value="1">Yes</asp:ListItem>
                
            </asp:DropDownList>

        </div>

        <br />

        <asp:Button ID="btnSave" runat="server" Text="Save Global Note" class="btn btn-primary" OnClick="btnSave_Click" />

    </div>

    <asp:SqlDataSource ID="srcEmployees" runat="server"
         ConnectionString="<%$ ConnectionStrings:Connect %>"
         SelectCommand="select firstName + ' ' + lastName as 'fullName' from EMPLOYEE where currentEmployee=1 order by lastName desc"></asp:SqlDataSource>

</asp:Content>
