<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Skole_Project.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="welcome" runat="server" Text=""></asp:Label>
        </div>
        <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
                    <asp:CheckBoxField DataField="Type" HeaderText="Type" SortExpression="Type" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pwe0916_1028717ConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
        </div>
        <br />
        <div>
            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
        </div>
    </form>
</body>
</html>
