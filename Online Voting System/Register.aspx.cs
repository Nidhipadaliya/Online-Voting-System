using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System.Styles
{
	public partial class Register : System.Web.UI.Page
	{
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // 1️⃣ Check if passwords match
            if (password != confirmPassword)
            {
                Response.Write("<script>alert('Passwords do not match!');</script>");
                return;
            }

            // 2️⃣ Check if email already exists
            cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@e", con);
            cmd.Parameters.AddWithValue("@e", email);

            int exists = (int)cmd.ExecuteScalar();
            if (exists > 0)
            {
                Response.Write("<script>alert('Email already registered!');</script>");
                return;
            }

            // 3️⃣ Insert new user
            cmd = new SqlCommand("INSERT INTO Users (FullName, Email, Password, Role) VALUES (@f, @e, @p, 'User')", con);
            cmd.Parameters.AddWithValue("@f", fullName);
            cmd.Parameters.AddWithValue("@e", email);
            cmd.Parameters.AddWithValue("@p", password);

            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
            {
                Session["email"] = email;
                Session["role"] = "User";
                Response.Redirect("Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Error occurred. Please try again.');</script>");
            }
        }
    }
}
