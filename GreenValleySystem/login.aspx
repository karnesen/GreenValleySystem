<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GreenValleySystem.WebForm1" %>--%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Green Valley Auction</title>
    
    <link rel="stylesheet" href="style/UIkit1.css"/>
    <link rel="stylesheet" href="style/UIkit2.css"/>
    <link rel="stylesheet" href="style/style.css"/> 
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <main class="auth">
        <div class="container-fluid">
            <div class="row vh-100">
                <div class="col-md-6 text-center py-5 d-flex flex-column justify-content-center auth-bg-section text-white" style="background-image: url(images/bigstock-Packed-household-goods-for-mov-131525006.jpg)">
                </div>
                <div class="col-md-6 text-center d-flex flex-column py-5 justify-content-center">
                    <div class="auth-form-section">
                        <div class="logo"><img src="images/logo.jpg"  class="img-fluid" width="200"/></div>
                        <h2>Welcome Admin</h2>
                        <p>Please sign in</p>
                        <form class="auth-form" runat="server">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="Log in" class="sr-only"></asp:Label>
                                 <asp:TextBox ID="txtUsername" class="form-control" PlaceHolder="Username" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                 <asp:Label ID="Label2" runat="server" Text="Password" class="sr-only"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" PlaceHolder="Password" TextMode="Password"></asp:TextBox>
                            </div>
                             <asp:Button ID="btnLogin" runat="server" Class="btn btn-primary btn-block mb-3" Text="Log in" OnClick="btnLogin_Click"/>
                             <asp:Label ID="lblLoginMessage" runat="server" Text=""></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
</body>
</html>
