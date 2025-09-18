using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Online_Voting_System.User
{
    public partial class ContactUs : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void clear()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("INSERT INTO Queries (FullName, Email,Message) VALUES ('"+ txtName.Text + "', '"+ txtEmail.Text + "', '"+ txtMessage.Text + "')", con);
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Your query has been submitted successfully!');</script>");

            clear();
        }
    }
}