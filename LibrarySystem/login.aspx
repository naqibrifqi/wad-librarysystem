<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="LibrarySystem.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="style1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            height: 99px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 57px;
            font-size: xx-large;
        }
        .auto-style4 {
            height: 62px;
        }
        .auto-style5 {
            height: 53px;
        }
        .auto-style6 {
            height: 60px;
        }
        login-head-text {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style7 {
            height: 60px;
            font-size: medium;
        }
    </style>
</head>
<body id="login-body">
    <form id="form1" runat="server">
        <div id="login-content">
            <table class="auto-style2">
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="Image1" runat="server" Height="90px" ImageUrl="~/Images/System/banner3.png" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3"><span class="login-header-text">Login</span></td>
                </tr>
                <tr>
                <td class="auto-style4">
                    <asp:TextBox ID="txtusername" runat="server" placeholder="Username" CssClass="twitterStyleTextbox" Font-Size="X-Large"></asp:TextBox>
                </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtpass" runat="server" textmode="password" placeholder="Password" CssClass="twitterStyleTextbox" Font-Size="X-Large"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <asp:Button ID="btnLogin" runat="server" Text="LOGIN" OnClick="btnLogin_Click" CssClass="grey-button" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:HyperLink ID="hplReg" runat="server" NavigateUrl="~/registration.aspx">not a member? Register here!</asp:HyperLink>
                            <br />
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/default.aspx">Home</asp:HyperLink>
                        </td>
                    </tr>
                </table>
            </div>
            <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
