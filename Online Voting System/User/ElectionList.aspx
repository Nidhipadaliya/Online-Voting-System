<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ElectionList.aspx.cs" Inherits="Online_Voting_System.User.ElectionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../Styles/electionlist.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-4">
        <h2 class="text-center mb-4 fw-bold text-primary">College Elections</h2>

        <div class="row g-4">
            <!-- Election 1 -->
            <div class="col-md-4">
                <div class="card election-card h-100">
                    <img src="../Images/student-president.jpeg" class="card-img-top" alt="Student President Election">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Student President Election</h5>
                        <p class="card-text">Choose the leader who will represent students for the upcoming academic year.</p>
                        <p class="fw-bold text-warning">Voting Date: 20 Aug 2025</p>
                        <a href="#" class="btn vote-btn mt-auto">Vote Now</a>
                    </div>
                </div>
            </div>

            <!-- Election 2 -->
            <div class="col-md-4">
                <div class="card election-card h-100">
                    <img src="../Images/cultural-committee.jpeg" class="card-img-top" alt="Cultural Committee Election">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Cultural Committee Election</h5>
                        <p class="card-text">Vote for members who will organize and lead cultural events in the college.</p>
                        <p class="fw-bold text-warning">Voting Date: 25 Aug 2025</p>
                        <a href="#" class="btn vote-btn mt-auto">Vote Now</a>
                    </div>
                </div>
            </div>

            <!-- Election 3 -->
            <div class="col-md-4">
                <div class="card election-card h-100">
                    <img src="../Images/sports-secretary.jpeg" class="card-img-top" alt="Sports Secretary Election">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">Sports Secretary Election</h5>
                        <p class="card-text">Select the student who will manage all sports activities and competitions.</p>
                        <p class="fw-bold text-warning">Voting Date: 28 Aug 2025</p>
                        <a href="#" class="btn vote-btn mt-auto">Vote Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>