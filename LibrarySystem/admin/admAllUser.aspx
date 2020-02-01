<%@ Page Title="[Admin] All User" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="admAllUser.aspx.cs" Inherits="LibrarySystem.admin.admAllUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registered User</h1>
    <p class="auto-style1">Select a user in the table and click the search button OR</p>
    <p class="auto-style1">Input a user id in the search box and click search.</p>
    <hr />
<p>
    <asp:HyperLink ID="hplBack" runat="server" NavigateUrl="~/admindash.aspx">◄◄ Back to Dashboard</asp:HyperLink>
</p>
    <p>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
</p>
    <p>
        Enter user ID:</p>
    <p>
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="User ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="User ID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="User ID" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" ReadOnly="True" />
            <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4abdac" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#3d9e8f" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userID] AS 'User ID', [username] AS 'Username', CONCAT([firstname],' ', [lastname]) AS 'Name', CONCAT([address], ', ' ,[postcode], ', ', [city], ', ', [state]) AS 'Address', [age] AS 'Age', [status] AS 'Status' FROM [tblUser]"></asp:SqlDataSource>
</p>
    <p>
        <asp:DetailsView ID="dtlUser" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="User ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Visible="False" Width="125px">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
            <EditRowStyle BackColor="#2461BF" />
            <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="User ID" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="User ID" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" ReadOnly="True" />
                <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            </Fields>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [userID] AS 'User ID', [username] AS 'Username', CONCAT([firstname],' ', [lastname]) AS 'Name', CONCAT([address], ', ' ,[postcode], ', ', [city], ', ', [state]) AS 'Address', [age] AS 'Age', [status] AS 'Status' FROM [tblUser] WHERE ([userID] = @userID2)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" Name="userID2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <p>
        <asp:Label ID="lblSelected" runat="server"></asp:Label>
</p>
    <p>
        <asp:Label ID="lblForOp" runat="server" Text="Operation: " Visible="False"></asp:Label>
        <asp:DropDownList ID="ddlOperation" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlOperation_SelectedIndexChanged" Visible="False">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="1">Change Permission</asp:ListItem>
            <asp:ListItem Value="2">Delete User</asp:ListItem>
        </asp:DropDownList>
</p>
    <p>
        <asp:Label ID="lblForRole" runat="server" Text="Change role to: " Visible="False"></asp:Label>
        <asp:DropDownList ID="ddlRole" runat="server" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged" Visible="False">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Value="1">Admin</asp:ListItem>
            <asp:ListItem Value="2">Member</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btnChange" runat="server" CssClass="grey-button" OnClick="Button1_Click" Text="Change Role" Visible="False" />
        <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete" Visible="False" CssClass="grey-button" />
</p>
</asp:Content>
