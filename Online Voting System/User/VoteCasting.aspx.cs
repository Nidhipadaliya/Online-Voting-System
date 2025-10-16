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
                fillcandidate();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillcandidate()
        {
            getcon();
            da = new SqlDataAdapter("SELECT c.CandidateId, c.FullName, c.Description, c.Image, e.Title, e.ElectionId FROM Candidates c INNER JOIN Elections e ON c.ElectionId = e.ElectionId WHERE e.Status='Ongoing'", con);
            ds = new DataSet();
            da.Fill(ds, "Candidate");

            if (ds.Tables["Candidate"].Rows.Count > 0)
            {
                rptCandidates.DataSource = ds.Tables["Candidate"];
                rptCandidates.DataBind();
                pnlNoElection.Visible = false;

                ViewState["ElectionId"] = ds.Tables["Candidate"].Rows[0]["ElectionId"].ToString();
            }
            else
            {
                rptCandidates.DataSource = null;
                rptCandidates.DataBind();
                pnlNoElection.Visible = true;
            }
        }
        protected void rptCandidates_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Vote")
            {
                int candidateId = Convert.ToInt32(e.CommandArgument);
                int electionId = Convert.ToInt32(ViewState["ElectionId"]);
                int userId = Convert.ToInt32(Session["UserId"]);

                getcon();

                da = new SqlDataAdapter("SELECT * FROM Votes WHERE UserId='" + userId + "' AND ElectionId='" + electionId + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Response.Redirect("VotingStatus.aspx?status=already");
                }
                else
                {
                    cmd = new SqlCommand("INSERT INTO Votes (UserId, ElectionId, CandidateId) VALUES ('" + userId + "','" + electionId + "','" + candidateId + "')", con);
                    cmd.ExecuteNonQuery();

                    Response.Redirect("VotingStatus.aspx?status=success");
                }
            }

        }
    }
}