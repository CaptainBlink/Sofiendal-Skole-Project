<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Skole_Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="css/sb-admin.css" rel="stylesheet"/>

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet"/>

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">

                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title" style="text-align: center">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form id="form2" runat="server">
                            <div class="form-group">
                                <input class="form-control" id="txtUserName" placeholder="Email" type="text" runat="server" />
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="txtUserPass" placeholder="Password" type="password" runat="server" />
                            </div>
                            
                            <asp:Button class="btn btn-lg btn-success btn-block" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                            <asp:Label ID="Label1" runat="server" Text="Email or Password is incorrect." Visible="false" ForeColor="Red"></asp:Label>
                            <br />

                            <div style="text-align: left; width: 35%; float: left;">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/forgotpassword.aspx" ForeColor="black">Forgot Password</asp:HyperLink>
                            </div>
                            <div style="text-align: right; width: 65%; float: left">
                                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/registration.aspx" ForeColor="black">Registration</asp:HyperLink>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
