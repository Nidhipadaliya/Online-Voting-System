<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Queries.aspx.cs" Inherits="Online_Voting_System.Admin.Queries" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/queries.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center fw-bold text-primary">User Queries</h2>

        <asp:GridView ID="gvQueries" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover shadow-sm"
            DataKeyNames="QueryID">
            <Columns>
                <asp:BoundField DataField="QueryID" HeaderText="ID" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Message" HeaderText="Message" />
               
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
