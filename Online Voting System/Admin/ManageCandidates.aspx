<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageCandidates.aspx.cs" Inherits="Online_Voting_System.Admin.ManageCandidates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/managecandidates.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center fw-bold text-primary">Manage Candidates</h2>

        <!-- Candidate Form -->
        <div class="card p-4 mb-4 shadow-sm">
            <div class="mb-3">
                <label class="form-label">Candidate Name</label>
                <asp:TextBox ID="txtCandidateName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label class="form-label">Election</label>
                <asp:DropDownList ID="ddlElection" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label class="form-label">Upload Image</label>
                <asp:FileUpload ID="flpimg" runat="server" CssClass="form-control" />
            </div>
            <asp:Button ID="btnAddCandidate" runat="server" Text="Add Candidate" CssClass="btn btn-success" OnClick="btnAddCandidate_Click" />
        </div>

        <!-- Candidate List -->
        <asp:GridView ID="gvCandidates" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover shadow-sm"
            DataKeyNames="CandidateId" OnRowCommand="gvCandidates_RowCommand">
            <Columns>
                <asp:BoundField DataField="CandidateId" HeaderText="ID" ReadOnly="true" />
                <asp:BoundField DataField="FullName" HeaderText="Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="ElectionTitle" HeaderText="Election" />
                <asp:ImageField DataImageUrlField="Image" HeaderText="Image" ControlStyle-Width="80" ControlStyle-Height="80" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="cmd_edit" CommandArgument='<%# Eval("CandidateId") %>' Text="Edit" CssClass="btn btn-warning btn-sm me-2" />
                        <asp:Button runat="server" CommandName="cmd_delete" CommandArgument='<%# Eval("CandidateId") %>' Text="Delete" CssClass="btn btn-danger btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
