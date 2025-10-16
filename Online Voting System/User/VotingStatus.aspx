<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VotingStatus.aspx.cs" Inherits="Online_Voting_System.User.VotingStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Add Bootstrap for this page only (safe even if already included in master) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="row mb-4">
            <div class="col text-center">
                <h2 class="fw-bold">Voting Status</h2>
                <p class="text-muted">Election: <strong>Student President Election</strong></p>
            </div>
        </div>

        <!-- Status Card -->
        <div class="card shadow-sm status-card text-center p-4">
            <!-- Icon -->
            <div id="statusIcon" runat="server" class="status-icon text-success">
                <i class="bi bi-check-circle-fill"></i>
            </div>

            <!-- Status Message -->
            <h4 class="mt-3" id="statusMessage" runat="server"></h4>
            

            <!-- Partial Results -->
            <div class="mt-4">
                <h5>Current Votes Summary</h5>
                <asp:Label ID="resultsMessage" runat="server" CssClass="text-danger fw-bold"></asp:Label>
                <asp:Repeater ID="resultsList" runat="server">
                    <ItemTemplate>
                        <li class="list-group-item d-flex justify-content-between">
                            <%# Eval("FullName") %>
                            <span class="badge bg-primary rounded-pill"><%# Eval("VoteCount") %></span>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Back Button -->
            <div class="mt-4">
                <a href="UserDashboard.aspx" class="btn btn-secondary">Back to Dashboard</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
