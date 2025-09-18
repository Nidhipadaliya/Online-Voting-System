<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Online_Voting_System.Admin.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/admin-dashboard.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="text-center text-primary fw-bold mb-4">Admin Dashboard</h2>
        
        <div class="row g-4">
            <!-- Create Election -->
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="bi bi-calendar-check display-4 text-primary"></i>
                    <h4 class="fw-bold mt-3">Create Election</h4>
                    <p>Set up new elections with details and dates.</p>
                    <a href="CreateElection.aspx" class="btn btn-primary w-100">Go</a>
                </div>
            </div>

            <!-- Manage Candidates -->
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="bi bi-people display-4 text-primary"></i>
                    <h4 class="fw-bold mt-3">Manage Candidates</h4>
                    <p>Approve or Reject candidates for elections.</p>
                    <a href="ManageCandidates.aspx" class="btn btn-primary w-100">Go</a>
                </div>
            </div>

            <!-- Manage Users -->
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="bi bi-person-lines-fill display-4 text-primary"></i>
                    <h4 class="fw-bold mt-3">Manage Users</h4>
                    <p>View, approve or block registered users.</p>
                    <a href="ManageUsers.aspx" class="btn btn-primary w-100">Go</a>
                </div>
            </div>

            <!-- Upcoming Elections -->
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="bi bi-clock-history display-4 text-primary"></i>
                    <h4 class="fw-bold mt-3">Upcoming Elections</h4>
                    <p>Review and publish upcoming elections for users.</p>
                    <a href="UpcomingElections.aspx" class="btn btn-primary w-100">Go</a>
                </div>
            </div>

            <!-- View Results -->
            <div class="col-md-4">
                <div class="dashboard-card">
                    <i class="bi bi-bar-chart-line-fill display-4 text-primary"></i>
                    <h4 class="fw-bold mt-3">View Results</h4>
                    <p>Check the outcome of completed elections.</p>
                    <a href="ViewResults.aspx" class="btn btn-primary w-100">Go</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
