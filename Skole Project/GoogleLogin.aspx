<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleLogin.aspx.cs" Inherits="Skole_Project.GoogleLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="google-signin-client_id" content="723117611476-pkeam5g28hnrgl4o1subnvho0mnp4rpj.apps.googleusercontent.com" />
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <style>
        .hidden{
            display:none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="Token" Value="" runat="server" />
            <asp:HiddenField ID="Name" Value="" runat="server" />
            <div class="g-signin2" data-onsuccess="onSignIn" data-onfailure="onSignInFailure"></div>
            <asp:Button ID="Button1" CssClass="hidden" runat="server" OnClick="btnLogin_Click" Text="login" />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <script>
                function onSignIn(googleUser) {
                    var profile = googleUser.getBasicProfile();
                    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
                    console.log('Name: ' + profile.getName());
                    console.log('Image URL: ' + profile.getImageUrl());
                    console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
                    var id_token = googleUser.getAuthResponse().id_token;
                    document.getElementById("Token").value = profile.getEmail();
                    document.getElementById("Name").value = profile.getName();
                    var xhr = new XMLHttpRequest();
                    xhr.open('POST', 'http://localhost:6829/GoogleLogin.aspx?idtoken=' + id_token);
                    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                    xhr.onload = function () {
                        console.log('Signed in as: ' + xhr.responseText);
                    };
                    xhr.send('idtoken=' + id_token);
                    document.getElementById('<%= Button1.ClientID %>').click();
                }
            </script>
        </div>
    </form>
</body>
</html>
