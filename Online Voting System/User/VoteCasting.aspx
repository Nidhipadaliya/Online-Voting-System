<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VoteCasting.aspx.cs" Inherits="Online_Voting_System.User.VoteCasting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        
        .navbar-nav .nav-link,
        .navbar-brand {
            color: white !important;
        }
        .navbar-nav .nav-link:hover,
        .navbar-brand:hover {
            color: #ffcc00 !important;
        }
        
        .card-img-top {
            height: 250px;
            object-fit: contain; 
            background-color: #f8f9fa;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="row mb-4">
            <div class="col text-center">
                <h2 class="fw-bold">Vote Casting</h2>
                <p class="text-muted">Election: <strong>Student President Election</strong></p>
            </div>
        </div>

        <!-- Candidate Cards -->
        <div class="row">
            <!-- Candidate 1 -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <img src="../Images/candidate1.jpeg" class="card-img-top" alt="Candidate 1">
                    <div class="card-body text-center">
                        <h5 class="card-title">John Smith</h5>
                        <p class="card-text">Committed to improving student facilities and organizing more events.</p>
                        <asp:Button ID="btnVoteJohn" runat="server" Text="Vote for John" CssClass="btn btn-primary w-100" />
                    </div>
                </div>
            </div>

            <!-- Candidate 2 -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <img src="../Images/candidate2.jpeg" class="card-img-top" alt="Candidate 2">
                    <div class="card-body text-center">
                        <h5 class="card-title">Sarah Johnson</h5>
                        <p class="card-text">Focused on academic support programs and better communication channels.</p>
                        <asp:Button ID="btnVoteSarah" runat="server" Text="Vote for Sarah" CssClass="btn btn-primary w-100" />
                    </div>
                </div>
            </div>

            <!-- Candidate 3 -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm h-100">
                    <img src="../Images/candidate3.jpeg" class="card-img-top" alt="Candidate 3">
                    <div class="card-body text-center">
                        <h5 class="card-title">Michael Lee</h5>
                        <p class="card-text">Passionate about sports, cultural events, and student engagement.</p>
                        <asp:Button ID="btnVoteMichael" runat="server" Text="Vote for Michael" CssClass="btn btn-primary w-100" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
