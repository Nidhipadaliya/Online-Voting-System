<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Voting_System.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2>Login</h2>

        <label for="txtUsername">Username</label>
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

        <label for="txtPassword">Password</label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

        <label for="ddlRole">Select Role</label>
        <asp:DropDownList ID="ddlRole" runat="server">
            <asp:ListItem Text="User" Value="User"></asp:ListItem>
            <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

        <a href="Register.aspx" class="register-link">Don't have an account? Register</a>
    </div>
</asp:Content>
