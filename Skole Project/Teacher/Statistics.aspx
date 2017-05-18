<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="Skole_Project.Teacher.Statistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skole Cafe</title>
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <link href="../Css/featherlight.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>

    <style>
        .gridLines tr th {
            text-align: center;
        }

        .test {
            padding-left: 10px;
            text-align: center;
        }

        .labltest {
            font-weight: 600;
            font-size: 14px;
            color: #424242;
        }

        .lablsubj {
            font-weight: 300;
            font-size: 20px;
            color: #424242;
        }

        .button {
            background-color: #B8B8B8;
            text-align: center;
            color: white;
            font-size: 20px;
            border-radius: 5px;
            border: none;
            box-shadow: 0 2px 2px darkgray;
        }

        .btnHomework {
            text-align: center;
            border-radius: 2px;
            border: none;
            box-shadow: 0 2px 2px darkgray;
        }

        .margin {
            text-align: center;
        }
    </style>
</head>
<body style="font-family: 'Roboto', sans-serif !important;">
    <form id="form1" runat="server">
        <nav class="navbar navbar-default" style="background-color: #CFD8DC;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" style="padding: 0;" href="Statistics.aspx">
                        <img style="width: inherit; height: inherit; image-rendering: pixelated" src="../img/Logo.png" /></a>
                </div>
                <ul class="nav navbar-nav" style="float: none">
                    <li style="float: right">
                        <asp:Button ID="Logout" Style="border: none; background-color: transparent; padding: 15px 15px;" runat="server" Text="Logout" OnClick="Logout_Click" />
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 50px">
                    <asp:Image ID="imgPicture" Style="border-radius: 50%; float: left;" runat="server" />
                    <div style="margin-top: 10px; margin-left: 110px;">
                        <asp:Label ID="welcome" runat="server" Text="" Font-Size="large"></asp:Label>
                        <br />
                        <asp:Label ID="class" runat="server" Text="Teacher" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 col-lg-12 col-md-offset-4" style="margin-bottom: 10px">
                    <div style="margin-bottom: 20px;">
                        <asp:Label ID="Label12" Style="margin-left: 7.33333333%;" runat="server" Text="Search for single student"></asp:Label>
                        <br />
                        <div style="margin-left: 7.33333333%;">
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
                        </div>
                    </div>
                </div>
                <div id="studentinfo" class="col-md-4 col-lg-12 col-md-offset-4" runat="server" style="box-shadow: 0px 1px 2px 1px gray; border-radius: 6px; padding-left: 10px; width: 33%;" visible="false">
                    <div style="padding-bottom: 15px;">
                        <asp:Image ID="studentPic" Style="border-radius: 50%; float: left; width: 80px;" runat="server" />
                        <div style="margin-top: 10px; margin-left: 110px;">
                            <asp:Label ID="lblname" runat="server" Font-Size="large" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="lblclass" runat="server" Font-Bold="True" Text=""></asp:Label>
                        </div>
                        <div style="margin-top: 10px; margin-left: 110px;">
                            <asp:Label ID="lblattendance" runat="server" Text=""></asp:Label>
                        </div>
                        <div style="margin-top: 10px; margin-left: 110px;">
                            <asp:Label ID="Label8" runat="server" Text="Mandatory : "></asp:Label>
                            <asp:Label ID="lblmandatory" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <%--<asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <div style="box-shadow: 0px 1px 2px 1px gray; border-radius: 6px; padding-left: 10px; width: 33%;">
                                <div>
                                    <asp:HiddenField ID="txtOuterID" runat="server" Value='<%# Eval("ID") %>' Visible="false" />
                                    <br />
                                    <asp:Image ID="studentPic" ImageUrl='<%# Eval("Picture") %>' Style="border-radius: 50%; float: left;" runat="server" />
                                    <div style="margin-top: 10px; margin-left: 110px;">
                                        <asp:Label ID="Label2" runat="server" Font-Size="large" Text='<%# Eval("name") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# "6." + Eval("Class") %>'></asp:Label>
                                    </div>
                                    <br />
                                    <asp:Label ID="Label8" runat="server" Text="Mandatory : "></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text='<%# ((bool)Eval("Mandatory")) ? "Yes" : "No" %>'></asp:Label>
                                </div>
                                <br />
                                <div style="padding-bottom: 10px;">
                                    <asp:Repeater ID="Repeater2" DataSourceID="SqlDataSource3" runat="server">
                                        <ItemTemplate>
                                            <p runat="server"><%# Eval("Login") %></p>
                                            <p runat="server"><%# Eval("logout") %></p>
                                            <div style="margin-bottom:10px">
                                                <asp:Label ID="Label10" runat="server" Text="Homework : "></asp:Label>
                                                <asp:Label ID="Label11" runat="server" Text='<%# ProcessMyDataItem(Eval("homework")) %>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" runat="server" SelectCommand="SELECT UserData.Login, UserData.Logout, UserData.Homework FROM UserData WHERE UserData.UserID = @OuterID">
                                        <SelectParameters>
                                            <asp:ControlParameter Name="OuterID" Type="Int32" ControlID="txtOuterID" PropertyName="Value" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Users.Name, Users.Class, Users.Mandatory, Users.Type, Users.ID, Users.Picture FROM Users WHERE Users.Type = 'false'"></asp:SqlDataSource>--%>
            </div>
        </div>
    </form>
</body>
</html>
