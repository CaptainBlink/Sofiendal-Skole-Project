﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Skole_Project.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <link href="../Css/featherlight.css" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <title></title>
    <style>
        .gridLines tr td {
            border-top: none;
            border-color: #009999;
        }

        .test {
            padding-left: 10px;
        }

        .labltest {
            font-weight: bold;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="float: left">
            </div>
            <div style="float: right">
                <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
            </div>
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 30px">
                    <asp:Image ID="imgPicture" Style="border-radius: 50%; float: left;" runat="server" />
                    <div style="margin-top: 30px; margin-left: 110px;">
                        <asp:Label ID="welcome" runat="server" Text="" Font-Size="large"></asp:Label>
                        <br />
                        <asp:Label ID="class" runat="server" Text="" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 30px">
                    <div style="border: solid 1px black; border-radius: 6px; border-color: #009999; display: grid;">
                        <p class="text-center" style="margin-top: 10px">
                            Click the button
                        <br />
                            to
                        <br />
                            enter
                        <br />
                            Lesson Cafe
                        </p>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnTime" runat="server" OnClick="GetTime" Text="Button" Style="display: none" />
                                <asp:Button CssClass="col-md-4 col-md-offset-4" Enabled="false" Style="margin-bottom: 10px" OnClick="btnCafe_Click" ID="btnCafe" runat="server" Text="CheckIn" />
                                <asp:Label CssClass="col-md-4 col-md-offset-4" ID="Label1" runat="server" Text=""></asp:Label>
                                <asp:Button ID="btnTestList" Style="display: none" runat="server" OnClick="btnSubmit_Click" Text="test" />
                                <div id="gus" runat="server" class="featherlight">
                                    <div id="HomeworkList" class="featherlight-content">
                                        <button class="featherlight-close-icon featherlight-close" aria-label="Close">✕</button>
                                        <div class="featherlight-inner">
                                            <asp:CheckBoxList ID="CheckBoxHomework" runat="server">
                                                <asp:ListItem Text="Math" Value="Math"></asp:ListItem>
                                                <asp:ListItem Text="Danish" Value="Danish"></asp:ListItem>
                                                <asp:ListItem Text="Biology" Value="Biology"></asp:ListItem>
                                                <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                                <asp:ListItem Text="History" Value="History"></asp:ListItem>
                                            </asp:CheckBoxList>
                                            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 30px;">
                    <div style="border: solid 1px #009999; margin-bottom: 10px;">
                        <div id="menu1" style="border-bottom: solid 1px #009999; height: 50px; background-color: gray; color: white;" onclick="menuShow1();">
                            <asp:Label ID="day1" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="MONDAY"></asp:Label>
                            <img id="arrow1" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date1" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text="08/05"></asp:Label>
                        </div>
                        <div id="menu_element1" style="display: none;">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div>
                                        <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                        <br />
                                        <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework INNER JOIN Users ON Users.Class = Homework.Class WHERE (Users.ID = @HomeworkID)">
                                <SelectParameters>
                                    <asp:Parameter Name="HomeworkID" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div style="border: solid 1px #009999; margin-bottom: 10px;">
                        <div id="menu2" style="border-bottom: solid 1px #009999; height: 50px; background-color: gray; color: white;" onclick="menuShow2();">
                            <asp:Label ID="day2" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="TUESDAY"></asp:Label>
                            <img id="arrow2" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date2" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text="09/05"></asp:Label>
                        </div>
                        <div id="menu_element2" style="display: none;">
                            <div>
                                <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                <br />
                                <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div style="border: solid 1px #009999; margin-bottom: 10px;">
                        <div id="menu3" style="border-bottom: solid 1px #009999; height: 50px; background-color: gray; color: white;" onclick="menuShow3();">
                            <asp:Label ID="day3" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="WEDNESDAY"></asp:Label>
                            <img id="arrow3" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date3" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text="10/05"></asp:Label>
                        </div>
                        <div id="menu_element3" style="display: none;">
                            <div>
                                <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                <br />
                                <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div style="border: solid 1px #009999; margin-bottom: 10px;">
                        <div id="menu4" style="border-bottom: solid 1px #009999; height: 50px; background-color: gray; color: white;" onclick="menuShow4();">
                            <asp:Label ID="day4" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="THURSDAY"></asp:Label>
                            <img id="arrow4" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date4" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text="11/05"></asp:Label>
                        </div>
                        <div id="menu_element4" style="display: none;">
                            <div>
                                <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                <br />
                                <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div style="border: solid 1px #009999;">
                        <div id="menu5" style="border-bottom: solid 1px #009999; height: 50px; background-color: gray; color: white;" onclick="menuShow5();">
                            <asp:Label ID="day5" Style="margin-left: 10px; margin-top: 5px; float: left; clear: left; position: relative; font-size: large;" runat="server" Text="FRIDAY"></asp:Label>
                            <img id="arrow5" src="../img/downarrow.png" style="height: 20px; color: white; float: right; clear: right; position: relative; margin-right: 15px; margin-top: 16px;" />
                            <asp:Label ID="date5" runat="server" Style="margin-left: 10px; float: left; clear: left; position: relative; font-size: small;" Text="12/05"></asp:Label>
                        </div>
                        <div id="menu_element5" style="display: none;">
                            <div>
                                <asp:Label runat="server" Style="margin-left: 10px; font-weight: 600; font-size: larger;" Text='<%# Eval("Subject").ToString().ToUpper() %>'></asp:Label>
                                <br />
                                <asp:Label runat="server" Style="margin-left: 10px" Text='<%# Eval("Homework") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12" style="margin-bottom: 50px">
                    <asp:GridView ID="GridView1" CssClass="gridLines" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" Style="border-collapse: separate; border: #009999; border-spacing: 20px 0; border-bottom: none" Width="100%" CellSpacing="5" CellPadding="0" HorizontalAlign="Center" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Monday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" CssClass="labltest" runat="server" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Monday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Monday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Monday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tuesday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" CssClass="labltest" runat="server" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Tuesday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Tuesday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Tuesday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wednesday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" CssClass="labltest" runat="server" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Wednesday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Wednesday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Wednesday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thursday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" CssClass="labltest" runat="server" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Thursday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Thursday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Thursday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Friday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" CssClass="labltest" runat="server" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Friday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Friday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label11" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# Regex.Split(Eval("Friday").ToString(),";")[1] %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Schedule.Monday, Schedule.Tuesday, Schedule.Wednesday, Schedule.Thursday, Schedule.Friday FROM Schedule INNER JOIN Users ON Users.Class = Schedule.Class WHERE (Users.ID = @ScheduleID)">
                        <SelectParameters>
                            <asp:Parameter Name="ScheduleID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
    <script>
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
    </script>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("<%=btnTime.ClientID %>").click();
            var todayHour = new Date().getHours();
            var todayMin = new Date().getMinutes();
            var todayCafe = new Date().getDay();
            if ((todayCafe == 7 & todayHour < 18) || (todayCafe == 2 & todayHour < 2)) {
                setInterval(function () {

                    document.getElementById("<%=btnTime.ClientID %>").click();
                }, 1000);
            }
        };
    </script>
</body>
</html>
