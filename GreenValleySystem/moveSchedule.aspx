<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="moveSchedule.aspx.cs" Inherits="GreenValleySystem.moveSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="container">
        <asp:FormView
            ID="fvLookAtMove"
            runat="server">
            <ItemTemplate>
                <asp:TextBox ID="txtNotes" runat="server" Placeholder="Notes" TextMode="MultiLine"></asp:TextBox>
            </ItemTemplate>
            <EditItemTemplate>

                <asp:ListBox ID="lbxTrucks" runat="server" DataSource="" DataTextField=""></asp:ListBox>
                <asp:ListBox ID="lbxMovers" runat="server"></asp:ListBox>
                <div class="sticky-top">
                    <asp:TextBox ID="txtNotes" runat="server" Placeholder="Notes" TextMode="MultiLine"></asp:TextBox>
                </div>
            </EditItemTemplate>

        </asp:FormView>
    </div>
</asp:Content>
