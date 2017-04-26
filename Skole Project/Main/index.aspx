<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Skole_Project.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style>
        .gridLines tr:not(:last-child) td{
            border-bottom:none;
        }

        .gridLines tr:last-child td {
            border-bottom-color:#009999;

        }

        .test{
            padding-left:10px;
        }

        .labltest{
            font-weight:bold;
            text-align:left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="float: left">
                <asp:Label ID="welcome" runat="server" Text=""></asp:Label>
            </div>
            <div style="float: right">
                <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
            </div>
        </div>
        <br />
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 50px">
                    <p class="text-center">
                        Click the button
                        <br />
                        to
                        <br />
                        enter
                        <br />
                        Lesson Cafe
                    </p>
                    <asp:Button CssClass="col-md-4 col-md-offset-4" ID="Button1" runat="server" Text="CheckIn" />
                </div>
                <br />
                <div class="col-md-4 col-md-offset-4" style="margin-bottom: 50px;">
                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# "Subject: " + Eval("Subject") %>'></asp:Label>
                            <br />
                            <asp:Label runat="server" Text='<%# "Task: " + Eval("Homework") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Homework.Subject, Homework.Homework FROM Homework INNER JOIN Users ON Users.Class = Homework.Class WHERE (Users.ID = @HomeworkID)">
                        <SelectParameters>
                            <asp:Parameter Name="HomeworkID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col-lg-12" style="margin-bottom: 50px">
                    <asp:GridView ID="GridView1" CssClass="gridLines" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" Style="border-collapse: separate; border: #009999; border-spacing: 20px 0; border-bottom:none" Width="100%" CellSpacing="5" CellPadding="0" HorizontalAlign="Center" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Monday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" CssClass="labltest" runat="server" style='<%# ProcessMyDataItem1(Regex.Split(Eval("Monday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Monday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Monday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test"/>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="#009999"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tuesday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" CssClass="labltest" runat="server" style='<%# ProcessMyDataItem1(Regex.Split(Eval("Tuesday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Tuesday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Tuesday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test"/>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="#009999"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wednesday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" CssClass="labltest" runat="server" style='<%# ProcessMyDataItem1(Regex.Split(Eval("Wednesday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Wednesday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Wednesday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test"/>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="#009999"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Thursday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" CssClass="labltest" runat="server" style='<%# ProcessMyDataItem1(Regex.Split(Eval("Thursday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Thursday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Thursday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test"/>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="#009999"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Friday" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" CssClass="labltest" runat="server" style='<%# ProcessMyDataItem1(Regex.Split(Eval("Friday").ToString(),";")[0]) %>' ForeColor="#808080" Text='<%# Regex.Split(Eval("Friday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label11" runat="server" Font-Size="X-Large" ForeColor="#808080" Text='<%# Regex.Split(Eval("Friday").ToString(),";")[1] %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle CssClass="test"/>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="XX-Large" Width="170px" ForeColor="White" BackColor="#009999"></HeaderStyle>
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
</body>
</html>
