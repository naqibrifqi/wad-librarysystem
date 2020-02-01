<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="LibrarySystem.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style1.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 28px;
        }
        .auto-style3 {
            width: 184px;
        }
        .auto-style4 {
            height: 28px;
            width: 184px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login-body">
            <div id="register-content">
                <span class="register-header-text">Registration</span>

                <br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3">username</td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Password</td>
                        <td>
                            <asp:TextBox ID="txtPass1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Confirm Password</td>
                        <td>
                            <asp:TextBox ID="txtPass2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">First Name</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtFname" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Last Name</td>
                        <td>
                            <asp:TextBox ID="txtLname" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Age</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtAge" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Address</td>
                        <td>
                            <asp:TextBox ID="txtAddr" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Postcode</td>
                        <td>
                            <asp:TextBox ID="txtPostcode" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">City</td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">State</td>
                        <td>
                            <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    </table>


                <asp:Label ID="lblStatus" runat="server" Text="..."></asp:Label>
                <br />
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" />


            </div>
        </div>
    </form>
</body>
</html>
