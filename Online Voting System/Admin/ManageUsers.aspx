<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="Online_Voting_System.Admin.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/manageusers.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center fw-bold text-primary">Manage Users</h2>

        <!-- Users Grid -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CssClass="table table-striped table-hover shadow-sm align-middle text-center"
            OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="User ID" />
                <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Role" HeaderText="Role" />

                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" 
                            CommandName="cmd_del" 
                            CommandArgument='<%# Eval("UserID") %>' 
                            CssClass="btn btn-sm btn-danger">
                            Delete
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>