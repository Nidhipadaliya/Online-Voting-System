<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Online_Voting_System.Admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 text-center">
        <h2>Welcome, <asp:Label ID="lblName" runat="server"></asp:Label>!</h2>
        <p class="text-muted">This is the Admin Dashboard. More features will be added soon.</p>
    </div>
</asp:Content>