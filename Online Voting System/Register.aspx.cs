using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net;
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
            cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE Email='" + txtEmail.Text + "'", con);

            int exists = (int)cmd.ExecuteScalar();
            if (exists > 0)
            {
                Response.Write("<script>alert('Email already registered!');</script>");
                return;
            }

            cmd = new SqlCommand("INSERT INTO Users (FullName, Email, Age, Department,Enrollment ,City, Password, Role) VALUES ('" + txtFullName.Text + "', '" + txtEmail.Text + "','" + txtage.Text + "','" + drpdep.Text + "', '" + txtenrollment.Text + "',  '" + txtct.Text + "',  '" + txtPassword.Text + "', 'User')", con);

            cmd.ExecuteNonQuery();

            Response.Redirect("Login.aspx");
        }
    }
}
