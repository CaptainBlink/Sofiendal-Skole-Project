﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="overview.aspx.cs" Inherits="Skole_Project.Teacher.overview" %>

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
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 30px">
                    <asp:Image ID="imgPicture" Style="border-radius: 50%; float: left;" runat="server" />
                    <div style="margin-top: 10px; margin-left: 110px;">
                        <asp:Label ID="welcome" runat="server" Text="" Font-Size="large"></asp:Label>
                        <br />
                        <asp:Label ID="class" runat="server" Text="Teacher" Font-Bold="True"></asp:Label>
                    </div>
                    <div style="margin-left: 110px;">
                        <asp:Label ID="lblattendance" runat="server" Text=""></asp:Label>
                    </div>
                </div>
                <div class="col-lg-12" style="margin-bottom: 50px">
                    <div class="col-md-4 col-md-offset-4">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnTime" runat="server" OnClick="btnTime_Click" Text="Button" Style="display: none" />
                                <asp:GridView ID="GridView1" CssClass="gridLines" Style="width: 100%;" AutoGenerateColumns="False" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Active" SortExpression="Active">
                                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                                            <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" Style="width: 20px; height: 20px; margin-top: 5px; margin-bottom: 5px" ImageUrl='<%# GetImageUrl(Eval("active"))%>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mandatory" SortExpression="Mandatory">
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                                            <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                                            <ItemTemplate><%# ((bool)Eval("Mandatory")) ? "Yes" : "No" %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                                            <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ClassName" HeaderText="Class" SortExpression="Class" HeaderStyle-CssClass="header-center">
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                                            <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Users.Name, Class.Name AS ClassName, Users.Mandatory, Users.Type, Users.Active FROM Users INNER JOIN Class ON Users.Class = Class.ID WHERE (Users.Mandatory = 'True') AND (Users.Type = 'False') OR (Users.Mandatory = 'False') AND (Users.Type = 'False') AND (Users.Active = 'True')"></asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        window.onload = function () {
            setInterval(function () {
                document.getElementById("<%=btnTime.ClientID %>").click();
            }, 1000);
        };
    </script>
</body>
</html>
