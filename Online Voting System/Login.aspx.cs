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
            string role = ddlRole.SelectedValue;

            cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email='" + txtUsername.Text + "' AND Password='" + txtPassword.Text + "' AND Role='" + ddlRole.SelectedValue + "'", con);

            int exists = (int)cmd.ExecuteScalar();

            if (exists > 0)
            {
                Session["email"] = username;
                Session["role"] = role;

                if (role == "Admin")
                {
                    Response.Redirect("~/Admin/AdminDashboard.aspx");
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