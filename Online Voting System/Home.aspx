<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Online_Voting_System.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Link to the Home Page CSS -->
    <link href="Styles/home.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="home-hero">
        <div class="home-hero-content">
            <h1>Welcome to Online Voting System</h1>
            <p>Secure, simple, and transparent voting for all college elections.</p>

            <div class="login-buttons">
                <asp:HyperLink runat="server" NavigateUrl="~/Login.aspx?type=user" CssClass="login-btn">User Login</asp:HyperLink>
                <asp:HyperLink runat="server" NavigateUrl="~/Login.aspx?type=admin" CssClass="login-btn">Admin Login</asp:HyperLink>
            </div>
        </div>
    </section>

</asp:Content>
