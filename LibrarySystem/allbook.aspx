<%@ Page Title="All Books" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="allbook.aspx.cs" Inherits="LibrarySystem.allbook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        height: 23px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>All Available Books</h1>
    <hr />
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ISBN Number" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ISBN Number" HeaderText="ISBN Number" ReadOnly="True" SortExpression="ISBN Number" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Page Count" HeaderText="Page Count" SortExpression="Page Count" />
            <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#4abdac" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#4abdac" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#3d9e8f" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT book_isbn AS 'ISBN Number', book_title AS 'Title', page_count AS 'Page Count', availability AS Availability
FROM [tblBookReg]"></asp:SqlDataSource>
</p>
<table class="auto-style1">
    <tr>
        <td rowspan="4">
            <asp:Image ID="imgBook" runat="server" Height="300px" />
        </td>
        <td>ISBN Number:
            <asp:Label ID="lblISBN" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Book Title:
            <asp:Label ID="lblTitle" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Page Count:
            <asp:Label ID="lblCount" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>Availability:
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
        </td>
    </tr>
</table>
<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/allbook.aspx">&lt;&lt; Back</asp:HyperLink>
<br />
</asp:Content>
