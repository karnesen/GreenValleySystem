<%@ Page Title="" Language="C#" MasterPageFile="~/serviceDetails.Master" AutoEventWireup="true" CodeBehind="moveLookAt.aspx.cs" Inherits="GreenValleySystem.moveLookAt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderChild" runat="server">
    <div class="container">
        <asp:FormView
            ID="fvLookAtMove"
            runat="server">
            <ItemTemplate>
                <asp:TextBox ID="txtNotes" runat="server" Placeholder="Notes" TextMode="MultiLine"></asp:TextBox>
            </ItemTemplate>
            <EditItemTemplate>
                <div class="sticky-top">
                    <asp:TextBox ID="txtNotes" runat="server" Placeholder="Notes" TextMode="MultiLine"></asp:TextBox>
                </div>
            </EditItemTemplate>

        </asp:FormView>
    </div>


</asp:Content>
