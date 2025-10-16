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
    public partial class ElectionList : System.Web.UI.Page
    {
        string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        String fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }
            getcon();
            if (!IsPostBack)
            {
                ViewElections();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        void ViewElections()
        {
            getcon();
            string query = "SELECT ElectionId, Title, Description,Image, StartDate, EndDate FROM Elections WHERE IsPublished = 1";
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            rptElections.DataSource = dt;
            rptElections.DataBind();

        }

    }
}