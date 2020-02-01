<%@ Page Title="User Page" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="LibrarySystem.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 100px;
        }
        .auto-style4 {
            width: 369px;
        }
        .auto-style5 {
            width: 129px;
        }
        .auto-style6 {
            display: block;
            margin: 0;
            font-family: sans-serif;
            font-size: 18px;
            box-shadow: none;
            border-radius: 5px;
        }
        .auto-style7 {
            width: 100px;
            height: 31px;
        }
        .auto-style8 {
            width: 369px;
            height: 31px;
        }
        .auto-style9 {
            width: 129px;
            height: 31px;
        }
        .auto-style10 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>User Management Page</h1>
    <span class="auto-style1">You can update your address here</span>
    <br />
    <hr />
    <br />
    <table class="auto-style2">
        <tr>
            <td class="auto-style7">Address</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtAddr" runat="server" CssClass="glow-txt" Width="335px"></asp:TextBox>
            </td>
            <td class="auto-style9">PostCode</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtPostcode" runat="server" CssClass="auto-style6" Width="295px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">City</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtCity" runat="server" CssClass="auto-style6" Width="331px"></asp:TextBox>
            </td>
            <td class="auto-style5">State</td>
            <td>
                <asp:TextBox ID="txtState" runat="server" CssClass="auto-style6" Width="295px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    <br />
    <asp:Button ID="btnUpdate" runat="server" CssClass="grey-button" Text="Update Address" OnClick="btnUpdate_Click" />
    <br />
</asp:Content>
