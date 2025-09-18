<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Online_Voting_System.User.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="text-center text-primary fw-bold mb-4">Contact Us</h2>

        <div class="card shadow-sm p-4">
            <div class="mb-3">
                <label for="txtName" class="form-label">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your name"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label for="txtMessage" class="form-label">Message</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>

            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn btn-primary px-4" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>
