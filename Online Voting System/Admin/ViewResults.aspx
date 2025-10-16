<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewResults.aspx.cs" Inherits="Online_Voting_System.Admin.ViewResults" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/viewresults.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center fw-bold text-primary">Election Results</h2>

        <!-- Outer Repeater for Elections -->
        <asp:Repeater ID="rptElections" runat="server" OnItemDataBound="rptElections_ItemDataBound">
            <ItemTemplate>
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white fw-bold">
                        <%# Eval("Title") %>
                        (<%# String.Format("{0:MMM yyyy}", Eval("StartDate")) %>)
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered align-middle text-center">
                            <thead class="table-light">
                                <tr>
                                    <th>Candidate</th>
                                    <th>Total Votes</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Inner Repeater for Candidates -->
                                <asp:Repeater ID="rptCandidates" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("FullName") %></td>
                                            <td><%# Eval("VoteCount") %></td>
                                            <td>
                                                <%# Convert.ToInt32(Eval("Rank")) == 1
                                                    ? "<span class='badge bg-success'>Winner</span>"
                                                    : (Convert.ToInt32(Eval("Rank")) == 2
                                                        ? "<span class='badge bg-secondary'>Runner-up</span>"
                                                        : "<span class='badge bg-danger'>Lost</span>") %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
