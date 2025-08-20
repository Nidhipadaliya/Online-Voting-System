<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Voting_System.Styles.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/register.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>Create Your Account</h2>

        <asp:Label AssociatedControlID="txtFullName" runat="server" Text="Full Name"></asp:Label>
        <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>

        <asp:Label AssociatedControlID="txtEmail" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>

        <asp:Label AssociatedControlID="txtPassword" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Label AssociatedControlID="txtConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click"/>

        <a href="Login.aspx" class="login-link">Already have an account? Login here</a>
    </div>
</asp:Content>
