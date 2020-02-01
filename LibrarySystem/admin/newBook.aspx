<%@ Page Title="[Admin] New Book" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="newBook.aspx.cs" Inherits="LibrarySystem.newBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 152px;
        }
        .auto-style5 {
            font-size: small;
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
            width: 383px;
        }
        .auto-style8 {
            width: 152px;
            height: 31px;
        }
        .auto-style9 {
            height: 31px;
        }
        .auto-style10 {
            width: 383px;
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Register New Books</h1>
        <p class="auto-style5">Add new book to Catalogue</p>
        <hr />
        <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/admindash.aspx">◄◄ Back to Dashboard</asp:HyperLink>
        <br />
        <br />
        <table class="auto-style1" style="padding:0 0 20px 20px; ">
            <tr>
                <td class="auto-style4"><strong>ISBN</strong></td>
                <td>
                    <asp:TextBox ID="txtISBN" runat="server" CssClass="auto-style6" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorISBN" runat="server" ControlToValidate="txtISBN" Display="Dynamic" ErrorMessage="Please input the ISBN number." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8"><strong>Book Title</strong></td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="auto-style6" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="txtTitle" Display="Dynamic" ErrorMessage="Please input the book title." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Page Count</strong></td>
                <td>
                    <asp:TextBox ID="txtPageCount" runat="server" CssClass="auto-style6" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Availability</strong></td>
                <td>
                    <asp:TextBox ID="txtAvailability" runat="server" CssClass="glow-txt" Width="400px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAvail" runat="server" ControlToValidate="txtAvailability" Display="Dynamic" ErrorMessage="Please input the book availability." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidatorAvail" runat="server" ControlToValidate="txtAvailability" ErrorMessage="Please input a valid number!" ForeColor="Red" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Image</strong></td>
                <td>
                    <asp:FileUpload ID="imgUpload" runat="server" />
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
        </table>

        <asp:Button ID="btnRegister" runat="server" Text="Register Book" OnClick="btnRegister_Click" CssClass="grey-button" />
        <asp:Button ID="btnRefresh" runat="server" CssClass="grey-button" OnClick="btnRefresh_Click" Text="Refresh" />
        <br />
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
