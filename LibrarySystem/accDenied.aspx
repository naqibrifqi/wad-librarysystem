<%@ Page Title="Error 403" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="accDenied.aspx.cs" Inherits="LibrarySystem.accDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>403 Forbidden</h1>
    <p>You are unauthorized to view this page!</p>
    <p>Login
        <asp:HyperLink ID="hplLogin" runat="server" NavigateUrl="~/login.aspx">here</asp:HyperLink>
    </p>
</asp:Content>
