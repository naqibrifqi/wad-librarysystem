<%@ Page Title="[Admin] Banner Customization" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="admHomeImage.aspx.cs" Inherits="LibrarySystem.admin.admHomeImage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Edit Home Image</h1>
    On this page, you can change the image displayed on the front page of this system. <br />These image will be displayed to all user including guest.<hr />
    <asp:HyperLink ID="hplBack" runat="server" NavigateUrl="~/admindash.aspx">◄◄ Back to Dashboard</asp:HyperLink>
    <br />
    <br />
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <asp:GridView ID="dgvImage" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Image ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="dgvImage_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Image ID" HeaderText="Image ID" ReadOnly="True" SortExpression="Image ID" />
            <asp:BoundField DataField="Image Name" HeaderText="Image Name" SortExpression="Image Name" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] AS 'Image ID', [name] AS 'Image Name', [directory] AS 'Image Directory' FROM [tblSysImg]"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblSelected" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblChange" runat="server" Text="Image to replace:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:FileUpload ID="fulImage" runat="server" />
&nbsp;<asp:Button ID="btnReplace" runat="server" Text="Replace" OnClick="btnReplace_Click" CssClass="grey-button" />
</asp:Content>
