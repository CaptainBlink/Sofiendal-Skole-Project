<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Skole_Project.Teacher.Edit" %>

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
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 5px">
                    <asp:RadioButton ID="RadioButton1" runat="server" Text="6.A" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Text="6.B" />
                    <asp:RadioButton ID="RadioButton3" runat="server" Text="6.C" />
                </div>
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 5px">
                    <img id="arrowleft" onclick="lastWeek();" src="../img/left.png" style="float: left; width: 25px; height: 40px" />
                    <asp:Label ID="lblpreweek" runat="server" Text="Forrige uge" Style="float: left; margin-top: 10px; margin-left: 5px;"></asp:Label>
                    <img id="arrowright" onclick="nextWeek();" src="../img/right.png" style="float: right; width: 25px; height: 40px" />
                    <asp:Label ID="lblnextweek" runat="server" Text="Næste uge" Style="float: right; margin-top: 10px; margin-right: 5px;"></asp:Label>

                </div>
                <div id="lastweek" class="col-md-4 col-md-offset-4" style="margin-bottom: 30px; display: none">
                    <div style="margin-bottom: 10px;">
                        <div id="menu1" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow1();">
                            <asp:Label ID="day1" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MANDAG"></asp:Label>
                            <img id="arrow1" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date1" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element1" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu2" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow2();">
                            <asp:Label ID="day2" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TIRSDAG"></asp:Label>
                            <img id="arrow2" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date2" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element2" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu3" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow3();">
                            <asp:Label ID="day3" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="ONSDAG"></asp:Label>
                            <img id="arrow3" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date3" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element3" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu4" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow4();">
                            <asp:Label ID="day4" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TORSDAG"></asp:Label>
                            <img id="arrow4" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date4" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element4" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div>
                        <div id="menu5" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow5();">
                            <asp:Label ID="day5" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FREDAG"></asp:Label>
                            <img id="arrow5" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date5" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element5" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource6">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div id="currentweek" class="col-md-4 col-md-offset-4" style="margin-bottom: 30px; display: block">
                    <div style="margin-bottom: 10px;">
                        <div id="menu6" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow6();">
                            <asp:Label ID="day6" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MANDAG"></asp:Label>
                            <img id="arrow6" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date6" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element6" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource7">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu7" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow7();">
                            <asp:Label ID="day7" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TIRSDAG"></asp:Label>
                            <img id="arrow7" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date7" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element7" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource8">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu8" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow8();">
                            <asp:Label ID="day8" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="ONSDAG"></asp:Label>
                            <img id="arrow8" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date8" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element8" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource9">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu9" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow9();">
                            <asp:Label ID="day9" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TORSDAG"></asp:Label>
                            <img id="arrow9" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date9" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element9" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSource10">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div>
                        <div id="menu10" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow10();">
                            <asp:Label ID="day10" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FREDAG"></asp:Label>
                            <img id="arrow10" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date10" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element10" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource11">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
                <div id="nextweek" class="col-md-4 col-md-offset-4" style="margin-bottom: 30px; display: none">
                    <div style="margin-bottom: 10px;">
                        <div id="menu11" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow11();">
                            <asp:Label ID="day11" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MANDAG"></asp:Label>
                            <img id="arrow11" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date11" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element11" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource12">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu12" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow12();">
                            <asp:Label ID="day12" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TIRSDAG"></asp:Label>
                            <img id="arrow12" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date12" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element12" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater12" runat="server" DataSourceID="SqlDataSource13">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu13" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow13();">
                            <asp:Label ID="day13" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="ONSDAG"></asp:Label>
                            <img id="arrow13" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date13" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element13" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater13" runat="server" DataSourceID="SqlDataSource14">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <div id="menu14" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow14();">
                            <asp:Label ID="day14" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TORSDAG"></asp:Label>
                            <img id="arrow14" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date14" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element14" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater14" runat="server" DataSourceID="SqlDataSource15">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div>
                        <div id="menu15" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow15();">
                            <asp:Label ID="day15" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FREDAG"></asp:Label>
                            <img id="arrow15" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date15" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element15" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater15" runat="server" DataSourceID="SqlDataSource16">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function lastWeek() {
            display1 = document.getElementById("lastweek").style.display;
            display2 = document.getElementById("currentweek").style.display;
            display3 = document.getElementById("nextweek").style.display;

            if (display1 == "none" && display2 == "block") {
                document.getElementById("lastweek").style.display = "block";
                document.getElementById("currentweek").style.display = "none";
                document.getElementById("nextweek").style.display = "none";
            }
            else if (display2 == "none" && display1 == "none") {
                document.getElementById("currentweek").style.display = "block";
                document.getElementById("lastweek").style.display = "none";
                document.getElementById("nextweek").style.display = "none";
            }

        }
        function nextWeek() {
            display1 = document.getElementById("lastweek").style.display;
            display2 = document.getElementById("currentweek").style.display;
            display3 = document.getElementById("nextweek").style.display;

            if (display3 == "none" && display2 == "block") {
                document.getElementById("nextweek").style.display = "block";
                document.getElementById("currentweek").style.display = "none";
                document.getElementById("lastweek").style.display = "none";
            }
            else if (display1 == "block" && display2 == "none") {
                document.getElementById("currentweek").style.display = "block";
                document.getElementById("nextweek").style.display = "none";
                document.getElementById("lastweek").style.display = "none";
            }

        }
        function menuShow1() {
            display = document.getElementById("menu_element1").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element1").style.display = "block";
                document.getElementById("menu_element1").style.animationName = "menu_animate";
                document.getElementById("menu_element1").style.animationDuration = "1s";
                document.getElementById("arrow1").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element1").style.display = "none";
                document.getElementById("menu_element1").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element1").style.animationDuration = "1s";
                document.getElementById("arrow1").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow2() {
            display = document.getElementById("menu_element2").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element2").style.display = "block";
                document.getElementById("menu_element2").style.animationName = "menu_animate";
                document.getElementById("menu_element2").style.animationDuration = "1s";
                document.getElementById("arrow2").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element2").style.display = "none";
                document.getElementById("menu_element2").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element2").style.animationDuration = "1s";
                document.getElementById("arrow2").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow3() {
            display = document.getElementById("menu_element3").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element3").style.display = "block";
                document.getElementById("menu_element3").style.animationName = "menu_animate";
                document.getElementById("menu_element3").style.animationDuration = "1s";
                document.getElementById("arrow3").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element3").style.display = "none";
                document.getElementById("menu_element3").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element3").style.animationDuration = "1s";
                document.getElementById("arrow3").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow4() {
            display = document.getElementById("menu_element4").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element4").style.display = "block";
                document.getElementById("menu_element4").style.animationName = "menu_animate";
                document.getElementById("menu_element4").style.animationDuration = "1s";
                document.getElementById("arrow4").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element4").style.display = "none";
                document.getElementById("menu_element4").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element4").style.animationDuration = "1s";
                document.getElementById("arrow4").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow5() {
            display = document.getElementById("menu_element5").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element5").style.display = "block";
                document.getElementById("menu_element5").style.animationName = "menu_animate";
                document.getElementById("menu_element5").style.animationDuration = "1s";
                document.getElementById("arrow5").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element5").style.display = "none";
                document.getElementById("menu_element5").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element5").style.animationDuration = "1s";
                document.getElementById("arrow5").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow6() {
            display = document.getElementById("menu_element6").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element6").style.display = "block";
                document.getElementById("menu_element6").style.animationName = "menu_animate";
                document.getElementById("menu_element6").style.animationDuration = "1s";
                document.getElementById("arrow6").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element6").style.display = "none";
                document.getElementById("menu_element6").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element6").style.animationDuration = "1s";
                document.getElementById("arrow6").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow7() {
            display = document.getElementById("menu_element7").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element7").style.display = "block";
                document.getElementById("menu_element7").style.animationName = "menu_animate";
                document.getElementById("menu_element7").style.animationDuration = "1s";
                document.getElementById("arrow7").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element7").style.display = "none";
                document.getElementById("menu_element7").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element7").style.animationDuration = "1s";
                document.getElementById("arrow7").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow8() {
            display = document.getElementById("menu_element8").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element8").style.display = "block";
                document.getElementById("menu_element8").style.animationName = "menu_animate";
                document.getElementById("menu_element8").style.animationDuration = "1s";
                document.getElementById("arrow8").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element8").style.display = "none";
                document.getElementById("menu_element8").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element8").style.animationDuration = "1s";
                document.getElementById("arrow8").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow9() {
            display = document.getElementById("menu_element9").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element9").style.display = "block";
                document.getElementById("menu_element9").style.animationName = "menu_animate";
                document.getElementById("menu_element9").style.animationDuration = "1s";
                document.getElementById("arrow9").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element9").style.display = "none";
                document.getElementById("menu_element9").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element9").style.animationDuration = "1s";
                document.getElementById("arrow9").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow10() {
            display = document.getElementById("menu_element10").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element10").style.display = "block";
                document.getElementById("menu_element10").style.animationName = "menu_animate";
                document.getElementById("menu_element10").style.animationDuration = "1s";
                document.getElementById("arrow10").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element10").style.display = "none";
                document.getElementById("menu_element10").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element10").style.animationDuration = "1s";
                document.getElementById("arrow10").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow11() {
            display = document.getElementById("menu_element11").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element11").style.display = "block";
                document.getElementById("menu_element11").style.animationName = "menu_animate";
                document.getElementById("menu_element11").style.animationDuration = "1s";
                document.getElementById("arrow11").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element11").style.display = "none";
                document.getElementById("menu_element11").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element11").style.animationDuration = "1s";
                document.getElementById("arrow11").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow12() {
            display = document.getElementById("menu_element12").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element12").style.display = "block";
                document.getElementById("menu_element12").style.animationName = "menu_animate";
                document.getElementById("menu_element12").style.animationDuration = "1s";
                document.getElementById("arrow12").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element12").style.display = "none";
                document.getElementById("menu_element12").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element12").style.animationDuration = "1s";
                document.getElementById("arrow12").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow13() {
            display = document.getElementById("menu_element13").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element13").style.display = "block";
                document.getElementById("menu_element13").style.animationName = "menu_animate";
                document.getElementById("menu_element13").style.animationDuration = "1s";
                document.getElementById("arrow13").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element13").style.display = "none";
                document.getElementById("menu_element13").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element13").style.animationDuration = "1s";
                document.getElementById("arrow13").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow14() {
            display = document.getElementById("menu_element14").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element14").style.display = "block";
                document.getElementById("menu_element14").style.animationName = "menu_animate";
                document.getElementById("menu_element14").style.animationDuration = "1s";
                document.getElementById("arrow14").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element14").style.display = "none";
                document.getElementById("menu_element14").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element14").style.animationDuration = "1s";
                document.getElementById("arrow14").setAttribute('src', '../img/downarrow.png');
            }
        }
        function menuShow15() {
            display = document.getElementById("menu_element15").style.display;
            if (display == "" || display == "none") {
                document.getElementById("menu_element15").style.display = "block";
                document.getElementById("menu_element15").style.animationName = "menu_animate";
                document.getElementById("menu_element15").style.animationDuration = "1s";
                document.getElementById("arrow15").setAttribute('src', '../img/uparrow.png');
            } else if (display == "block") {
                document.getElementById("menu_element15").style.display = "none";
                document.getElementById("menu_element15").style.animationName = "menu_animate_reverse";
                document.getElementById("menu_element15").style.animationDuration = "1s";
                document.getElementById("arrow15").setAttribute('src', '../img/downarrow.png');
            }
        }
    </script>
</body>
</html>
