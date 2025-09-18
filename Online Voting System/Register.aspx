<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Voting_System.Styles.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/register.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>Create Your Account</h2>

        <div class="form-grid">
            <div class="form-group">
                <asp:Label AssociatedControlID="txtFullName" runat="server" Text="Full Name"></asp:Label>
                <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server"
                    ControlToValidate="txtFullName" ErrorMessage="Full Name is required"
                    CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtEmail" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail" ErrorMessage="Email is required"
                    CssClass="text-danger" Display="Dynamic" />

                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Invalid email format"
                    CssClass="text-danger" Display="Dynamic"
                    ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtage" runat="server" Text="Age"></asp:Label>
                <asp:TextBox ID="txtage" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAge" runat="server"
                    ControlToValidate="txtage" ErrorMessage="Age is required"
                    CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="drpdep" runat="server" Text="Department"></asp:Label>
                <asp:DropDownList ID="drpdep" runat="server">
                    <asp:ListItem Value="">--Select Department--</asp:ListItem>
                    <asp:ListItem>BCA</asp:ListItem>
                    <asp:ListItem>MCA</asp:ListItem>
                    <asp:ListItem>B.Tech</asp:ListItem>
                    <asp:ListItem>M.Tech</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvDepartment" runat="server"
                    ControlToValidate="drpdep" InitialValue=""
                    ErrorMessage="Please select a department" CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtenrollment" runat="server" Text="Enrollment No"></asp:Label>
                <asp:TextBox ID="txtenrollment" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEnrollment" runat="server"
                    ControlToValidate="txtenrollment" ErrorMessage="Enrollment No is required"
                    CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtct" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="txtct" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCity" runat="server"
                    ControlToValidate="txtct" ErrorMessage="City is required"
                    CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword" ErrorMessage="Password is required"
                    CssClass="text-danger" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label AssociatedControlID="txtConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server"
                    ControlToValidate="txtConfirmPassword" ErrorMessage="Confirm Password is required"
                    CssClass="text-danger" Display="Dynamic" />
                <asp:CompareValidator ID="cvPassword" runat="server"
                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"
                    ErrorMessage="Passwords do not match" CssClass="text-danger" Display="Dynamic" />
            </div>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />
        <a href="Login.aspx" class="login-link">Already have an account? Login here</a>
    </div>
</asp:Content>
