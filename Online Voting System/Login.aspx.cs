using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
	public partial class Login : System.Web.UI.Page
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
            {
                Response.Write("<script>alert('All fields are required!');</script>");
                return;
            }

            
            cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email=@u AND Password=@p AND Role=@r", con);
            cmd.Parameters.AddWithValue("@u", username);
            cmd.Parameters.AddWithValue("@p", password);
            cmd.Parameters.AddWithValue("@r", role);

            int exists = (int)cmd.ExecuteScalar();

            if (exists > 0)
            {
                
                Session["email"] = username;
                Session["role"] = role;

                if (role == "Admin")
                {
                    Response.Redirect("~/User/AdminDashboard.aspx");
                }
                else
                {
                    Response.Redirect("~/User/UserDashboard.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Username, Password, or Role!');</script>");
            }
        }
    }
}