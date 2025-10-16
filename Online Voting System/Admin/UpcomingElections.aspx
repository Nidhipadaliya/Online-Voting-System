<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpcomingElections.aspx.cs" Inherits="Online_Voting_System.Admin.UpcomingElections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/upcomingelections.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container my-5">
        <h2 class="mb-4 text-center fw-bold text-primary">Manage Upcoming Elections</h2>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            CssClass="table table-striped table-hover shadow-sm"
            DataKeyNames="ElectionId" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="ElectionId" HeaderText="ID" />
                <asp:BoundField DataField="Title" HeaderText="Title" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:TemplateField HeaderText="Published">
                    <ItemTemplate>
                        <%# (bool)Eval("IsPublished") ? "Yes" : "No" %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkPublish" runat="server" CommandName="cmd_pub" CommandArgument='<%# Eval("ElectionId") %>'>
                            <%# (bool)Eval("IsPublished") ? "Unpublish" : "Publish" %>
                        </asp:LinkButton> |
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandName="cmd_edit" CommandArgument='<%# Eval("ElectionId") %>'>Edit</asp:LinkButton> |
                        <asp:LinkButton ID="lnkDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("ElectionId") %>'>Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <hr />

        <!-- Edit form -->
        <asp:Panel ID="pnlEdit" runat="server" Visible="false" CssClass="card p-3 shadow-sm">
            <h4>Edit Election</h4>
            <div class="mb-3">
                <label>Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Start Date</label>
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>End Date</label>
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="mb-3">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem>Upcoming</asp:ListItem>
                    <asp:ListItem>Ongoing</asp:ListItem>
                    <asp:ListItem>Completed</asp:ListItem>
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
            
        </asp:Panel>
    </div>
</asp:Content>