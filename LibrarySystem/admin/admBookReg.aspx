<%@ Page Title="[Admin] All Books" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="admBookReg.aspx.cs" Inherits="LibrarySystem.admin.admBookReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 255px;
        }
        .auto-style4 {
            font-size: small;
        }
    .auto-style5 {
        width: 416px;
    }
    .auto-style6 {
        display: block;
        margin: 0;
        font-family: sans-serif;
        font-size: 18px;
        box-shadow: none;
        border-radius: 5px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registered Books</h1>
    <span class="auto-style4">On this page you are able to view all the books registered in the system. <br />For delete operation, the specific books must not checked out by any user</span>.<hr />
<p>
    <asp:HyperLink ID="hplBack" runat="server" NavigateUrl="~/admindash.aspx">◄◄ Back to Dashboard</asp:HyperLink>
</p>
<p>
    <asp:GridView ID="dgvBook" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN Number" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowSorting="True" OnSelectedIndexChanged="dgvBook_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ISBN Number" HeaderText="ISBN Number" ReadOnly="True" SortExpression="ISBN Number" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Page Count" HeaderText="Page Count" SortExpression="Page Count" />
            <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
            <asp:BoundField DataField="Image Directory" HeaderText="Image Directory" SortExpression="Image Directory" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [book_isbn] AS 'ISBN Number', [book_title] AS 'Title', [page_count] AS 'Page Count', [availability] AS 'Availability', [book_img] AS 'Image Directory' FROM [tblBookReg]"></asp:SqlDataSource>
</p>
    <p>
        <asp:Label ID="lblSelected" runat="server"></asp:Label>
</p>
    <p>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
</p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" rowspan="3">
                <asp:Image ID="imgBook" runat="server" Height="300px" />
            </td>
            <td class="auto-style5">
                <asp:Label ID="lblISBN" runat="server"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure?');" Text="Delete Book" Visible="False" CssClass="grey-button" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:TextBox ID="txtTitle" runat="server" Height="27px" Width="360px" Visible="False" CssClass="auto-style6"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnUpdate" runat="server" CssClass="grey-button" OnClick="btnUpdate_Click" Text="Update" Visible="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:TextBox ID="txtAvail" runat="server" Height="27px" Width="49px" Visible="False" CssClass="auto-style6"></asp:TextBox>
            </td>
            <td>
                <asp:HyperLink ID="hplRefresh" runat="server" NavigateUrl="~/admin/admBookReg.aspx" Visible="False">Refresh</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>
