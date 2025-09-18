using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

namespace Online_Voting_System.User
{
    public partial class VoteCasting : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                BindCandidates();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void BindCandidates()
        {
            getcon();
            string query = @"SELECT c.CandidateId, c.FullName, c.Description, c.Image, e.Title 
                                 FROM Candidates c 
                                 INNER JOIN Elections e ON c.ElectionId = e.ElectionId 
                                 WHERE e.Status = 'Ongoing'"
            ;

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                rptCandidates.DataSource = dt;
                rptCandidates.DataBind();
                pnlNoElection.Visible = false;
            }
            else
            {
                rptCandidates.DataSource = null;
                rptCandidates.DataBind();
                pnlNoElection.Visible = true;
            }
        }

    }
}