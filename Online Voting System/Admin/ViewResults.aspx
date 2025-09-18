<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewResults.aspx.cs" Inherits="Online_Voting_System.Admin.ViewResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/viewresults.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center fw-bold text-primary">Election Results</h2>

        <!-- Election Result Example -->
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white fw-bold">
                Student President Election (Aug 2025)
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
                        <tr>
                            <td>John Smith</td>
                            <td>120</td>
                            <td><span class="badge bg-success">Winner</span></td>
                        </tr>
                        <tr>
                            <td>Sarah Johnson</td>
                            <td>95</td>
                            <td><span class="badge bg-secondary">Runner-up</span></td>
                        </tr>
                        <tr>
                            <td>Michael Lee</td>
                            <td>60</td>
                            <td><span class="badge bg-danger">Lost</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Another Election Example -->
        <div class="card shadow-sm mb-4">
            <div class="card-header bg-primary text-white fw-bold">
                Cultural Committee Election (Sep 2025)
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
                        <tr>
                            <td>Alice Brown</td>
                            <td>150</td>
                            <td><span class="badge bg-success">Winner</span></td>
                        </tr>
                        <tr>
                            <td>David Wilson</td>
                            <td>110</td>
                            <td><span class="badge bg-secondary">Runner-up</span></td>
                        </tr>
                        <tr>
                            <td>Emma Davis</td>
                            <td>75</td>
                            <td><span class="badge bg-danger">Lost</span></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
