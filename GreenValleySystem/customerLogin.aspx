<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerLogin.aspx.cs" Inherits="GreenValleySystem.customerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />

    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container col-4">
                <div class="card p-3">
                    <asp:Label ID="Label1" runat="server" Text="Log in" Class="text-center h3 m-2"></asp:Label>
                    <div class="form-group">
                        <asp:TextBox ID="txtUsername" class="form-control" PlaceHolder="Email" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" PlaceHolder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="text-center">
                        <asp:Button ID="btnLogin" runat="server" Class="btn btn-primary" OnClick="btnLogin_Click" Text="Log in" />
                    </div>
                    <div class="text-center">
                        <asp:LinkButton ID="lbtnNewUSer" runat="server" PostBackUrl="createNewUser.aspx">Need to Create and Account?</asp:LinkButton>
                    </div>
                    <asp:Label ID="lblLoginMessage" runat="server" Text=""></asp:Label>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
