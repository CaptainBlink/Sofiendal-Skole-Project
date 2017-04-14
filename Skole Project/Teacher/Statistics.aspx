<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="Skole_Project.Teacher.Statistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skole Cafe</title>
</head>
<body>
    <p>Welcome, <%: User.Identity.Name.ToUpper().Substring(0,1) + User.Identity.Name.ToLower().Substring(1) %></p>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" HeaderStyle-CssClass="header-center">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Logout" HeaderText="Logout" SortExpression="Logout">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Mandatory" SortExpression="Mandatory">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                        <ItemTemplate><%# ((bool)Eval("Mandatory")) ? "Yes" : "No" %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Homework" HeaderText="Homework" SortExpression="Homework">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Type" SortExpression="Type">
                        <HeaderStyle HorizontalAlign="Center" BackColor="Black" BorderStyle="Solid" ForeColor="White" />
                        <ItemStyle BackColor="Transparent" ForeColor="Black" HorizontalAlign="Center" />
                        <ItemTemplate><%# ((bool)Eval("Type")) ? "Admin" : "Pupil" %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField AccessibleHeaderText="Edit" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Users.Name, Users.Class, Users.Type, UserData.Login, UserData.Logout, UserData.Mandatory, UserData.Homework FROM Users INNER JOIN UserData ON Users.ID = UserData.UserID"></asp:SqlDataSource>
        </div>
        <br />
        <asp:Calendar ID="Calendar1" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" runat="server"></asp:Calendar>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <div>
            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
        </div>
    </form>
</body>
</html>
