<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSchedule.aspx.cs" Inherits="Skole_Project.Teacher.EditSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skole Cafe</title>
    <link href="../Css/bootstrap.css" rel="stylesheet" />
    <link href="../Css/featherlight.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet" />
    <script src="../js/jquery.min.js"></script>
    <style>
        .gridLines tr td {
            border: none;
            border-bottom: 1px solid #EEEEEE;
            padding-top: 5px;
            padding-bottom: 5px;
            box-shadow: 0 0 1px 0px gray, 0px 0px 0 0 gray;
        }

        .gridLines tr th {
            border: none;
            border-bottom: 1px solid #EEEEEE;
            padding-top: 5px;
            padding-bottom: 5px;
            box-shadow: 1px -1px 0px 0px gray, 0 0 0 gray;
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

        .editTemp {
            border: none;
            border-bottom: 1px solid #EEEEEE;
            padding-top: 5px;
            padding-bottom: 5px;
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
                <div class="col-sm-12" style="margin-bottom: 50px">

                    <p class="text-center" style="margin-top: 10px; padding-bottom: 20px; font-size: xx-large; font-weight: 500;">
                        Mit skema
                       
                    </p>
                    <asp:GridView ID="GridView1" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" CssClass="gridLines" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Style="border-collapse: separate; border: #009999; border-spacing: 20px 0; border-bottom: none" Width="100%" CellSpacing="5" CellPadding="0" HorizontalAlign="Center" runat="server">
                        <Columns>
                            <asp:TemplateField HeaderText="Mandag" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Monday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label5" runat="server" CssClass="lablsubj" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Monday").ToString(),";")[1]) %>' Text='<%# ProcessMyDataItem(Regex.Split(Eval("Monday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:HiddenField ID="HiddenField1" Value='<%# Eval("ID") %>' runat="server" />
                                    <asp:Label ID="lbltime1" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Monday").ToString(),";")[0] %>'></asp:Label>
                                    <asp:TextBox ID="txtMonday" runat="server" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Monday").ToString(),";")[1]) %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="X-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tirsdag" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Tuesday").ToString(),";")[0] %>' Font-Bold="True"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label13" runat="server" CssClass="lablsubj" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Tuesday").ToString(),";")[1]) %>' Text='<%# ProcessMyDataItem(Regex.Split(Eval("Tuesday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lbltime2" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Tuesday").ToString(),";")[0] %>'></asp:Label>
                                    <asp:TextBox ID="txtTuesday" runat="server" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Tuesday").ToString(),";")[1]) %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="X-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Onsdag" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Wednesday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label7" runat="server" CssClass="lablsubj" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Wednesday").ToString(),";")[1]) %>' Text='<%# ProcessMyDataItem(Regex.Split(Eval("Wednesday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lbltime3" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Wednesday").ToString(),";")[0] %>'></asp:Label>
                                    <asp:TextBox ID="txtWednesday" runat="server" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Wednesday").ToString(),";")[1]) %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="X-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Torsdag" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Thursday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label9" runat="server" CssClass="lablsubj" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Thursday").ToString(),";")[1]) %>' Text='<%# ProcessMyDataItem(Regex.Split(Eval("Thursday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lbltime4" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Thursday").ToString(),";")[0] %>'></asp:Label>
                                    <asp:TextBox ID="txtThursday" runat="server" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Thursday").ToString(),";")[1]) %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="X-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fredag" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Friday").ToString(),";")[0] %>'></asp:Label>
                                    <br />
                                    <asp:Label ID="Label11" runat="server" CssClass="lablsubj" Style='<%# ProcessMyDataItem1(Regex.Split(Eval("Friday").ToString(),";")[1]) %>' Text='<%# ProcessMyDataItem(Regex.Split(Eval("Friday").ToString(),";")[1]) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lbltime5" CssClass="labltest" runat="server" Text='<%# Regex.Split(Eval("Friday").ToString(),";")[0] %>'></asp:Label>
                                    <asp:TextBox ID="txtFriday" runat="server" Text='<%# ProcessMyDataItem(Regex.Split(Eval("Friday").ToString(),";")[1]) %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="X-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" HeaderText="Edit" HeaderStyle-CssClass="text-center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle">
                                <ItemStyle CssClass="test" />
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Height="50px" Font-Size="X-Large" Width="170px" ForeColor="White" BackColor="gray"></HeaderStyle>
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Schedule.Monday, Schedule.Tuesday, Schedule.Wednesday, Schedule.Thursday, Schedule.Friday, Schedule.ID FROM Schedule WHERE (Schedule.Class = @Class)">
                        <SelectParameters>
                            <asp:Parameter Name="Class" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Monday" Type="String" />
                            <asp:Parameter Name="Tuesday" Type="String" />
                            <asp:Parameter Name="Wednesday" Type="String" />
                            <asp:Parameter Name="Thursday" Type="String" />
                            <asp:Parameter Name="Friday" Type="String" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
