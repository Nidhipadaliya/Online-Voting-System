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
            <asp:Repeater ID="rptElections" runat="server">
                <ItemTemplate>
                    <div class="col-md-4">
                        <div class="card election-card h-100">
                            <img src='<%# ResolveUrl(Eval("Image").ToString()) %>' class="card-img-top" alt="Election Image" />
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title"><%# Eval("Title") %></h5>
                                <p class="card-text"><%# Eval("Description") %></p>
                                <p class="fw-bold text-warning">
                                    Voting Date: <%# String.Format("{0:dd MMM yyyy}", Eval("StartDate")) %>
                                </p>
                                <a href="#" class="btn vote-btn mt-auto">Vote Now</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
