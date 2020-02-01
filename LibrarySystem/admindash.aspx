<%@ Page Title="[Admin] Dashboard" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="admindash.aspx.cs" Inherits="LibrarySystem.admindash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Admin Dashboard</h1>
<p>
    <asp:HyperLink ID="hplRegUser" runat="server" NavigateUrl="~/admin/admAllUser.aspx">► Registered User</asp:HyperLink>
</p>
<p>
    <asp:HyperLink ID="hplBook" runat="server" NavigateUrl="~/admin/admBookReg.aspx">► All Books</asp:HyperLink>
</p>
    <p>
        <asp:HyperLink ID="hplNewBook" runat="server" NavigateUrl="~/admin/newBook.aspx">► Register New Book</asp:HyperLink>
</p>
    <p>
        <asp:HyperLink ID="hplAllCheckout" runat="server" NavigateUrl="~/admin/admallCheckout.aspx">► All Records</asp:HyperLink>
</p>
    <p>
        <asp:HyperLink ID="hplDisplay" runat="server" NavigateUrl="~/admin/admHomeImage.aspx">► Edit Home Image</asp:HyperLink>
</p>

</asp:Content>
