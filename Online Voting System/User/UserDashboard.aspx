<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Online_Voting_System.User.UserDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/user-dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-banner">
        <h1>Welcome, <span class="username">User</span> 🎉</h1>
        <p>Your participation matters! Cast your vote and make a difference in the college community.</p>
    </div>

    <div class="stats-section">
        <div class="stat-card">
            <h2>3</h2>
            <p>Upcoming Elections</p>
        </div>
        <div class="stat-card">
            <h2>1</h2>
            <p>Votes Cast</p>
        </div>
        <div class="stat-card">
            <h2>5</h2>
            <p>Total Elections</p>
        </div>
    </div>

    <div class="dashboard-cards">
        <a href="ElectionList.aspx" class="card">🗳️ View Elections</a>
        <a href="VoteCasting.aspx" class="card">📝 Cast Your Vote</a>
        <a href="VotingStatus.aspx" class="card">📊 Voting Status</a>
    </div>
</asp:Content>
