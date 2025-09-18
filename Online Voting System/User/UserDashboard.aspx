<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="Online_Voting_System.User.UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/user-dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Banner -->
    <div class="dashboard-banner text-center shadow-sm mb-4">
        <h1 class="fw-bold">Welcome, <span class="username">User</span></h1>
        <p class="lead">Your participation matters! Cast your vote and make a difference in the college community.</p>
    </div>

    <!-- Stats Section -->
    <div class="row text-center mb-4">
        <div class="col-md-4 mb-3">
            <div class="stat-card shadow-sm">
                <h2>3</h2>
                <p>Upcoming Elections</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="stat-card shadow-sm">
                <h2>1</h2>
                <p>Votes Cast</p>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="stat-card shadow-sm">
                <h2>5</h2>
                <p>Total Elections</p>
            </div>
        </div>
    </div>

    <!-- Action Cards -->
    <div class="row text-center dashboard-actions">
        <div class="col-md-4 mb-3">
            <a href="ElectionList.aspx" class="action-card d-block p-4 shadow-sm">
                🗳️ <br /> <span>View Elections</span>
            </a>
        </div>
        <div class="col-md-4 mb-3">
            <a href="VoteCasting.aspx" class="action-card d-block p-4 shadow-sm">
                📝 <br /> <span>Cast Your Vote</span>
            </a>
        </div>
        <div class="col-md-4 mb-3">
            <a href="VotingStatus.aspx" class="action-card d-block p-4 shadow-sm">
                📊 <br /> <span>Voting Status</span>
            </a>
        </div>
    </div>
</asp:Content>
