<%@ Page Title="Checkout Books" Language="C#" MasterPageFile="~/One.Master" AutoEventWireup="true" CodeBehind="checkOut.aspx.cs" Inherits="LibrarySystem.checkOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 123px;
        }
        .auto-style5 {
            font-size: small;
        }
        .auto-style6 {
            width: 123px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        width: 254px;
    }
        .auto-style8 {
            width: 155px;
        }
        .auto-style9 {
            width: 155px;
            height: 26px;
        }
    .auto-style10 {
        width: 254px;
    }
    .auto-style11 {
        display: block;
        margin: 0;
        font-family: sans-serif;
        font-size: 18px;
        box-shadow: none;
        border-radius: 5px;
    }
    </style>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Check Out Book</h1>
    <p class="auto-style5">Please select your desired books or search in the search box.</p>
    <hr />
    <p>welcome <%Response.Write(Session["username"]); %></p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">Username:</td>
            <td class="auto-style10"><% Response.Write(Session["username"]); %></td>
            <td class="auto-style8">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Book Name:</td>
            <td class="auto-style10"> <asp:DropDownList ID="ddlBook" runat="server" DataSourceID="SqlDataSource1" DataTextField="book_title" DataValueField="book_isbn" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="ddlBook_SelectedIndexChanged">
                <asp:ListItem>-- pick one --</asp:ListItem>
            </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [tblBookReg] WHERE ([availability] &gt; @availability)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="availability" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style8"> &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6">Search</td>
            <td class="auto-style7"> 
                <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style11" Width="175px"></asp:TextBox>
            </td>
            <td class="auto-style9"> 
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="grey-button" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    <p>
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ISBN Number" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ISBN Number" HeaderText="ISBN Number" ReadOnly="True" SortExpression="ISBN Number" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [book_isbn] AS 'ISBN Number', [book_title] AS 'Title' FROM [tblBookReg] WHERE [book_title] LIKE '%' +@book_title +'%' AND availability &gt; 0">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="book_title" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <p>
        <asp:Label ID="lblSelected" runat="server"></asp:Label>
</p>
    <p>
        <asp:Button ID="btnCheckout" runat="server" OnClick="btnCheckout_Click" Text="Checkout" CssClass="grey-button" />
</p>
    <p>
        <asp:Label ID="lblTest" runat="server"></asp:Label>
</p>
    <p>
    &nbsp;</p>
    <p>
        &nbsp;</p>
</asp:Content>
