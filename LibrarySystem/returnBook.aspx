<%@ Page Title="Book Return" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="returnBook.aspx.cs" Inherits="LibrarySystem.returnBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        font-size: small;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Return Book</h1>
    <span class="auto-style1">Return checkout book within 7 days prior borrowing days to avoid additional fee. 
    </span> 
    <br class="auto-style1" /><span class="auto-style1">If you are not seeing any data, you have no borrowed books due.
    </span>
    <hr />
    <p>
        <asp:Label ID="lblExist" runat="server"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="grdCheckout" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Checkout ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="grdCheckout_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Checkout ID" HeaderText="Checkout ID" InsertVisible="False" ReadOnly="True" SortExpression="Checkout ID" />
                <asp:BoundField DataField="Book Title" HeaderText="Book Title" SortExpression="Book Title" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Date Checkout" HeaderText="Date Checkout" dataformatstring="{0:MMMM-dd-yyyy}" SortExpression="Date Checkout" />
                <asp:BoundField DataField="Deadline" HeaderText="Deadline" dataformatstring="{0:MMMM d, yyyy}" SortExpression="Deadline" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tblCheckout.id AS 'Checkout ID', tblBookReg.book_title AS 'Book Title', tblUser.username AS 'Username', tblCheckout.date_checkout AS 'Date Checkout', tblCheckout.date_deadline AS 'Deadline', tblCheckout.status AS 'Status'
FROM [tblCheckout] 
INNER JOIN tblBookReg
ON tblCheckout.book_isbn = tblBookReg.book_isbn
INNER JOIN tblUser
ON tblUser.userID = tblCheckout.user_id
WHERE (([user_id] = @user_id) AND tblCheckout.status = @status)">
            <SelectParameters>
                <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
                <asp:Parameter DefaultValue="CHECKED OUT" Name="status" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:HyperLink ID="hplBack" runat="server" NavigateUrl="~/returnBook.aspx" Visible="False">Refresh</asp:HyperLink>
    </p>
    <p>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <asp:Label ID="lblmsg2" runat="server"></asp:Label>
    </p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit for Book Return" CssClass="grey-button" />
    </p>
</asp:Content>
