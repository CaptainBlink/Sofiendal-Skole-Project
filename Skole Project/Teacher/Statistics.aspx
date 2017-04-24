<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="Skole_Project.Teacher.Statistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Skole Cafe</title>
</head>
<body>
    <p id="welcome" runat="server"></p>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Users.Name, Users.Class, Users.Mandatory, Users.Type, UserData.Login, UserData.Logout, UserData.Homework FROM Users INNER JOIN UserData ON Users.ID = UserData.UserID"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT Name, Class, Mandatory, ID, Type FROM Users"></asp:SqlDataSource>
        </div>
        <br />
        <div>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <div style="border:2px solid red; padding-left:10px; width:33%;">
                        <div>
                            <asp:HiddenField ID="txtOuterID" runat="server" Value='<%# Eval("ID") %>' Visible="false" />
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="Name :"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                            <asp:Label ID="Label7" runat="server" Text="| Class : "></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text="| Mandatory : "></asp:Label>
                            <asp:Label ID="Label4" runat="server" Text='<%# ((bool)Eval("Mandatory")) ? "Yes" : "No" %>'></asp:Label>
                            <asp:Label ID="Label9" runat="server" Text="| Type : "></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text='<%# ((bool)Eval("Type")) ? "Admin" : "Pupil" %>'></asp:Label>
                        </div>
                        <div>
                            <asp:Repeater ID="Repeater2" DataSourceID="SqlDataSource3" runat="server">
                                <ItemTemplate>
                                    <p runat="server"><%# Eval("Login") %></p>
                                    <p runat="server"><%# Eval("logout") %></p>
                                    <asp:Label ID="Label10" runat="server" Text="Homework : "></asp:Label>
                                    <asp:Label ID="Label11" runat="server" Text='<%# ProcessMyDataItem(Eval("homework")) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:SqlDataSource ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" runat="server" SelectCommand="SELECT UserData.Login, UserData.Logout, UserData.Homework FROM UserData WHERE UserData.UserID = @OuterID">
                                <SelectParameters>
                                    <asp:ControlParameter Name="OuterID" Type="Int32" ControlID="txtOuterID" PropertyName="Value" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <br />
                        <div>
                            <asp:Calendar ID="Calendar1" ToolTip='<%# Eval("ID") %>' runat="server"></asp:Calendar>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                    </div>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <br />
        <div>
            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
        </div>
    </form>
</body>
</html>
