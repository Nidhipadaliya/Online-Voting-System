<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreateElection.aspx.cs" Inherits="Online_Voting_System.Admin.CreateElection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/createelection.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white text-center">
                        <h3 class="mb-0">Create New Election</h3>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtTitle" class="form-label">Election Title</label>
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter election title"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtDescription" class="form-label">Description</label>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="flpimg" class="form-label">Election Image</label>
                            <asp:FileUpload ID="flpimg" runat="server" CssClass="form-control" />
                        </div>

                        <div class="mb-3">
                            <label for="txtStartDate" class="form-label">Start Date</label>
                            <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtEndDate" class="form-label">End Date</label>
                            <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="ddlStatus" class="form-label">Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Upcoming" Value="Upcoming"></asp:ListItem>
                                <asp:ListItem Text="Ongoing" Value="Ongoing"></asp:ListItem>
                                <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="text-center">
                            <asp:Button ID="btnCreateElection" runat="server" Text="Create Election" CssClass="btn btn-success px-4" OnClick="btnCreateElection_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
