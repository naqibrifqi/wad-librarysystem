<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="LibrarySystem.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            This is directory for developer use<br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/checkOut.aspx">Checkout</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/returnBook.aspx">Return</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/register.aspx">Register user</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/logout.aspx">Logout</asp:HyperLink>
        </div>
    </form>
</body>
</html>
