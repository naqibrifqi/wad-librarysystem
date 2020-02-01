<%@ Page Title="User Registration" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="LibrarySystem.registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 279px;
    }
        .auto-style3 {
            display: block;
            margin: 0;
            font-family: sans-serif;
            font-size: 18px;
            box-shadow: none;
            border-radius: 5px;
        }
        .auto-style4 {
            width: 296px;
        }
        .auto-style5 {
            width: 279px;
            height: 31px;
        }
        .auto-style6 {
            width: 296px;
            height: 31px;
        }
        .auto-style7 {
            height: 31px;
        }
        .auto-style8 {
            width: 279px;
            height: 32px;
        }
        .auto-style9 {
            width: 296px;
            height: 32px;
        }
        .auto-style10 {
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>New Account Registration</h1>
    <p>Register a new account.</p>
    <hr />
    <div>
<table class="auto-style1"style="padding:0 0 20px 20px;">
    <tr>
        <td class="auto-style8">Username</td>
        <td class="auto-style9">
            <asp:TextBox ID="txtUsername" runat="server" CssClass="glow-txt" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style10">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Please insert your name!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Password</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtPass1" runat="server" CssClass="glow-txt" Width="180px" TextMode="Password"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass1" runat="server" ControlToValidate="txtPostcode" ErrorMessage="Please insert your password!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style5">Confirm Password</td>
        <td class="auto-style6">
            <asp:TextBox ID="txtPass2" runat="server" CssClass="glow-txt" Width="180px" TextMode="Password"></asp:TextBox>
        </td>
        <td class="auto-style7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass2" runat="server" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Please re-insert your password!" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="CompareValidatorPass2" runat="server" ControlToCompare="txtPass1" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Password not the same !" ForeColor="Red"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">First Name</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtFname" runat="server" CssClass="glow-txt" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname" runat="server" ControlToValidate="txtFname" Display="Dynamic" ErrorMessage="Please input your First Name!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style5">Last Name</td>
        <td class="auto-style6">
            <asp:TextBox ID="txtLname" runat="server" CssClass="glow-txt" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFname0" runat="server" ControlToValidate="txtFname" Display="Dynamic" ErrorMessage="Please input your last name!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Address</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtAddr" runat="server" CssClass="glow-txt" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ControlToValidate="txtAddr" Display="Dynamic" ErrorMessage="Please input your address!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Postcode</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtPostcode" runat="server" CssClass="glow-txt" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostcode" runat="server" ControlToValidate="txtPostcode" Display="Dynamic" ErrorMessage="Please input your postcode!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">City</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtCity" runat="server" CssClass="auto-style3" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ControlToValidate="txtCity" Display="Dynamic" ErrorMessage="Please input your city!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">State</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtState" runat="server" CssClass="auto-style3" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" runat="server" ControlToValidate="txtState" Display="Dynamic" ErrorMessage="Please input your state!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">Age</td>
        <td class="auto-style4">
            <asp:TextBox ID="txtAge" runat="server" CssClass="auto-style3" Width="180px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorAge" runat="server" ControlToValidate="txtAge" Display="Dynamic" ErrorMessage="Please input your age!" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
</table>
        </div>
<br />
<asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="grey-button" />
<br />
<asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
<br />
<br />
<br />
    
    
</asp:Content>
