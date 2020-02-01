<%@ Page Title="[Admin] All Records" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="admallCheckout.aspx.cs" Inherits="LibrarySystem.admin.admallCheckout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 104px;
        }
        .auto-style4 {
            width: 286px;
        }
        .auto-style5 {
            width: 140px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>All Ongoing Records</h1>
    <p class="auto-style1">All checked out and returned books record.</p>
    <hr />
    <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/admindash.aspx">◄◄ Back to Dashboard</asp:HyperLink>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Checkout ID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Checkout ID" HeaderText="Checkout ID" InsertVisible="False" ReadOnly="True" SortExpression="Checkout ID" />
            <asp:BoundField DataField="ISBN No." HeaderText="ISBN No." SortExpression="ISBN No." />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Checkout Date" HeaderText="Checkout Date" SortExpression="Checkout Date" />
            <asp:BoundField DataField="Deadline Date" HeaderText="Deadline Date" SortExpression="Deadline Date" />
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] AS 'Checkout ID', [book_isbn] AS 'ISBN No.', [user_id] AS 'Username', [date_checkout] AS 'Checkout Date', [date_deadline] AS 'Deadline Date', [status] AS 'status', [fee] AS 'Fee' FROM [tblCheckout]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblEdit" runat="server"></asp:Label>
    <br />
    <br />
    <h1>Edit Records</h1>
    <br />
    <div id="form-edit">
    <table class="auto-style2">
        <tr>
            <td class="auto-style3">Checkout ID</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtCheckout" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td class="auto-style5">Book ISBN</td>
            <td>
                <asp:TextBox ID="txtISBN" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">UserID</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">Status</td>
            <td>
                <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Checkout Date</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDCheckout" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">Deadline Date</td>
            <td>
                <asp:TextBox ID="txtDDeadline" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Fee</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtFee" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style5">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </div>
    <br />
    <asp:Button ID="btnUpdate" runat="server" CssClass="grey-button" Text="Update Records" OnClick="btnUpdate_Click" Visible="False"/>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnDelete" runat="server" CssClass="grey-button" OnClick="btnDelete_Click" Text="Delete Record" OnClientClick="return confirm('Are you sure?');" Visible="False" />
    <br />
    <br />
</asp:Content>
