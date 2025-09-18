<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VoteCasting.aspx.cs" Inherits="Online_Voting_System.User.VoteCasting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/votecasting.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <!-- Title -->
        <div class="row mb-4">
            <div class="col text-center">
                <h2 class="fw-bold text-primary">Vote Casting</h2>
                <p class="text-muted">Choose your candidate below</p>
            </div>
        </div>

        <!-- Candidate Cards -->
        <div class="row">
            <asp:Repeater ID="rptCandidates" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card candidate-card shadow-sm h-100">
                            <img src='<%# ResolveUrl(Eval("Image").ToString()) %>' class="card-img-top" alt="Candidate Image" style="height:250px; object-fit:cover;" />
                            <div class="card-body text-center d-flex flex-column">
                                <h5 class="card-title"><%# Eval("FullName") %></h5>
                                <p class="card-text"><%# Eval("Description") %></p>
                                <asp:Button ID="btnVote" runat="server" Text="Vote" CssClass="btn vote-btn mt-auto"
                                    CommandArgument='<%# Eval("CandidateId") %>' />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- No Election Message -->
        <asp:Panel ID="pnlNoElection" runat="server" Visible="false">
            <div class="alert alert-info text-center mt-4">
                <h5>No elections are currently running.</h5>
                <p>Please check back later when a new election is started.</p>
            </div>
        </asp:Panel>
    </div>
</asp:Content>