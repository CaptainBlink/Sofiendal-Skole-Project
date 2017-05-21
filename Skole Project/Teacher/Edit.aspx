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
                    <asp:RadioButtonList ID="RadioButtonList1" Style="width: 100%" RepeatDirection="Horizontal" runat="server">
                        <asp:ListItem style="margin-right: 100px" Selected="True" Text="6.A" Value="1"></asp:ListItem>
                        <asp:ListItem style="margin-right: 100px" Text="6.B" Value="2"></asp:ListItem>
                        <asp:ListItem Text="6.C" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 5px">
                    <asp:Button CssClass="col-xs-4 col-xs-offset-4 button" ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
                </div>
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 5px">
                    <asp:ImageButton ID="arrowleft" OnClick="arrowleft_Click" ImageUrl="~/img/left.png" runat="server" Style="float: left; width: 25px; height: 40px" />
                    <asp:Label ID="lblpreweek" runat="server" Text="Forrige uge" Style="float: left; margin-top: 10px; margin-left: 5px;"></asp:Label>
                    <asp:ImageButton ID="arrowright" OnClick="arrowright_Click" ImageUrl="~/img/right.png" runat="server" Style="float: right; width: 25px; height: 40px" />
                    <asp:Label ID="lblnextweek" runat="server" Text="Næste uge" Style="float: right; margin-top: 10px; margin-right: 5px;"></asp:Label>
                </div>
                <div id="divlastweek" runat="server" class="col-md-4 col-md-offset-4" style="margin-bottom: 30px; display: none">
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu1" runat="server" Text="Button" Style="display: none" OnClick="btnMenu1_Click" />
                        <div id="menu1" runat="server" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow1();">
                            <asp:Label ID="day1" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MANDAG"></asp:Label>
                            <img id="arrow1" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date1" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element1" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj1" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework1" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework1" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework1_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu2" runat="server" Text="Button" Style="display: none" OnClick="btnMenu2_Click" />
                        <div id="menu2" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow2();">
                            <asp:Label ID="day2" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TIRSDAG"></asp:Label>
                            <img id="arrow2" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date2" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element2" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj2" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework2" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework2" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework2_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu3" runat="server" Text="Button" Style="display: none" OnClick="btnMenu3_Click" />
                        <div id="menu3" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow3();">
                            <asp:Label ID="day3" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="ONSDAG"></asp:Label>
                            <img id="arrow3" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date3" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element3" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource4">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj3" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework3" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework3" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework3_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu4" runat="server" Text="Button" Style="display: none" OnClick="btnMenu4_Click" />
                        <div id="menu4" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow4();">
                            <asp:Label ID="day4" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TORSDAG"></asp:Label>
                            <img id="arrow4" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date4" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element4" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj4" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework4" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework4" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework4_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnMenu5" runat="server" Text="Button" Style="display: none" OnClick="btnMenu5_Click" />
                        <div id="menu5" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow5();">
                            <asp:Label ID="day5" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FREDAG"></asp:Label>
                            <img id="arrow5" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date5" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element5" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource6">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj5" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework5" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework5" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework5_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="currentweek" runat="server" class="col-md-4 col-md-offset-4" style="margin-bottom: 30px; display: block">
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu6" runat="server" Text="Button" Style="display: none" OnClick="btnMenu6_Click" />
                        <div id="menu6" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow6();">
                            <asp:Label ID="day6" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MANDAG"></asp:Label>
                            <img id="arrow6" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date6" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element6" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource7">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj6" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework6" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework6" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework6_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu7" runat="server" Text="Button" Style="display: none" OnClick="btnMenu7_Click" />
                        <div id="menu7" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow7();">
                            <asp:Label ID="day7" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TIRSDAG"></asp:Label>
                            <img id="arrow7" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date7" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element7" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource8">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj7" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework7" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework7" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework7_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu8" runat="server" Text="Button" Style="display: none" OnClick="btnMenu8_Click" />
                        <div id="menu8" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow8();">
                            <asp:Label ID="day8" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="ONSDAG"></asp:Label>
                            <img id="arrow8" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date8" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element8" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource9">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj8" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework8" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework8" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework8_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu9" runat="server" Text="Button" Style="display: none" OnClick="btnMenu9_Click" />
                        <div id="menu9" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow9();">
                            <asp:Label ID="day9" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TORSDAG"></asp:Label>
                            <img id="arrow9" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date9" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element9" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSource10">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj9" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework9" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework9" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework9_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnMenu10" runat="server" Text="Button" Style="display: none" OnClick="btnMenu10_Click" />
                        <div id="menu10" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow10();">
                            <asp:Label ID="day10" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FREDAG"></asp:Label>
                            <img id="arrow10" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date10" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element10" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater10" runat="server" DataSourceID="SqlDataSource11">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj10" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework10" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework10" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework10_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="divnextweek" runat="server" class="col-md-4 col-md-offset-4" style="margin-bottom: 30px; display: none">
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu11" runat="server" Text="Button" Style="display: none" OnClick="btnMenu11_Click" />
                        <div id="menu11" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow11();">
                            <asp:Label ID="day11" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MANDAG"></asp:Label>
                            <img id="arrow11" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date11" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element11" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater11" runat="server" DataSourceID="SqlDataSource12">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj11" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework11" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework11" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework11_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu12" runat="server" Text="Button" Style="display: none" OnClick="btnMenu12_Click" />
                        <div id="menu12" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow12();">
                            <asp:Label ID="day12" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TIRSDAG"></asp:Label>
                            <img id="arrow12" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date12" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element12" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater12" runat="server" DataSourceID="SqlDataSource13">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj12" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework12" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework12" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework12_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu13" runat="server" Text="Button" Style="display: none" OnClick="btnMenu13_Click" />
                        <div id="menu13" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow13();">
                            <asp:Label ID="day13" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="ONSDAG"></asp:Label>
                            <img id="arrow13" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date13" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element13" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater13" runat="server" DataSourceID="SqlDataSource14">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj13" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework13" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework13" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework13_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <asp:Button ID="btnMenu14" runat="server" Text="Button" Style="display: none" OnClick="btnMenu14_Click" />
                        <div id="menu14" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow14();">
                            <asp:Label ID="day14" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TORSDAG"></asp:Label>
                            <img id="arrow14" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date14" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element14" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater14" runat="server" DataSourceID="SqlDataSource15">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj14" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework14" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework14" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework14_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="btnMenu15" runat="server" Text="Button" Style="display: none" OnClick="btnMenu15_Click" />
                        <div id="menu15" style="box-shadow: 1px -1px 0px 0.01px grey, -0.01px 0 0 1px grey; height: 50px; background-color: gray; color: white;" onclick="menuShow15();">
                            <asp:Label ID="day15" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FREDAG"></asp:Label>
                            <img id="arrow15" runat="server" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date15" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text=""></asp:Label>
                        </div>
                        <div id="menu_element15" runat="server" style="display: none; box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;">
                            <asp:Repeater ID="Repeater15" runat="server" DataSourceID="SqlDataSource16">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("ID") %>' Visible="false" />
                                        <asp:Label ID="lblSubj" runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblHomework" runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:TextBox ID="txtSubj" runat="server" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" Text='<%# Eval("Subject") %>' Visible="false" />
                                        <br />
                                        <asp:TextBox ID="txtHomework" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%" Text='<%# Eval("Homework") %>' Visible="false" />
                                    </div>
                                    <div class="col-md-4 col-md-offset-4" style="float: none">
                                        <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CausesValidation="False" OnClick="OnEdit" />
                                        <asp:LinkButton ID="lnkUpdate" Text="Update" runat="server" CausesValidation="False" Visible="false" OnClick="OnUpdate" />
                                        <asp:LinkButton ID="lnkCancel" Text="Cancel" runat="server" CausesValidation="False" Visible="false" OnClick="OnCancel" />
                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CausesValidation="False" OnClick="OnDelete" OnClientClick="return confirm('Do you want to delete this row?');" />
                                    </div>
                                    <hr />
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource16" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework, Homework.ID FROM Homework WHERE (Homework.Date = @HomeworkDate) AND (Homework.Class = @UserClass)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkDate" Type="DateTime" />
                                    <asp:Parameter Name="UserClass" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div>
                                <asp:TextBox ID="txtAddSubj15" Style="margin-bottom: 10px; margin-left: 10px; font-weight: 600; font-size: larger;" Width="80%" runat="server"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="txtAddHomework15" runat="server" Style="margin-bottom: 10px; margin-left: 10px;" Width="80%"></asp:TextBox>
                                <br />
                                <asp:Button ID="btnAddHomework15" Style="margin-bottom: 10px; float: none; margin-left: 43.33333333%;" OnClick="btnAddHomework15_Click" runat="server" Text="Add" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function menuShow1() {
            document.getElementById("btnMenu1").click();
        }
        function menuShow2() {
            document.getElementById("btnMenu2").click();
        }
        function menuShow3() {
            document.getElementById("btnMenu3").click();
        }
        function menuShow4() {
            document.getElementById("btnMenu4").click();
        }
        function menuShow5() {
            document.getElementById("btnMenu5").click();
        }
        function menuShow6() {
            document.getElementById("btnMenu6").click();
        }
        function menuShow7() {
            document.getElementById("btnMenu7").click();
        }
        function menuShow8() {
            document.getElementById("btnMenu8").click();
        }
        function menuShow9() {
            document.getElementById("btnMenu9").click();
        }
        function menuShow10() {
            document.getElementById("btnMenu10").click();
        }
        function menuShow11() {
            document.getElementById("btnMenu11").click();
        }
        function menuShow12() {
            document.getElementById("btnMenu12").click();
        }
        function menuShow13() {
            document.getElementById("btnMenu13").click();
        }
        function menuShow14() {
            document.getElementById("btnMenu14").click();
        }
        function menuShow15() {
            document.getElementById("btnMenu15").click();
        }
    </script>
</body>
</html>
