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
    public partial class VotingStatus : System.Web.UI.Page
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
                if (!string.IsNullOrEmpty(Request.QueryString["status"]))
                {
                    showstatus(); 
                }
                else
                {
                    fillresults(); 
                }
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void showstatus()
        {
            string status = Request.QueryString["status"];

            if (status == "success")
            {
                statusIcon.Attributes["class"] = "status-icon text-success";
                statusIcon.InnerHtml = "<i class='bi bi-check-circle-fill'></i>";
                statusMessage.InnerText = "You have successfully cast your vote!";
            }
            else if (status == "already")
            {
                statusIcon.Attributes["class"] = "status-icon text-warning";
                statusIcon.InnerHtml = "<i class='bi bi-exclamation-triangle-fill'></i>";
                statusMessage.InnerText = "You already voted in this election!";
            }
            else
            {
                statusIcon.Attributes["class"] = "status-icon text-secondary";
                statusIcon.InnerHtml = "<i class='bi bi-info-circle-fill'></i>";
                statusMessage.InnerText = "No voting activity detected.";
            }
        }

        void fillresults()
        {
            getcon();
            int userid = Convert.ToInt32(Session["UserID"]);

            da = new SqlDataAdapter("SELECT TOP 1 ElectionId FROM Votes WHERE UserId='" + userid + "' ORDER BY VoteId DESC", con);
            ds = new DataSet();
            da.Fill(ds, "VoteData");

            if (ds.Tables["VoteData"].Rows.Count == 0)
            {
                resultsList.Visible = false;
                resultsMessage.Text = "You have not voted in any election yet.";
                return;
            }

            int electionid = Convert.ToInt32(ds.Tables["VoteData"].Rows[0]["ElectionId"]);

            // Get election status
            da = new SqlDataAdapter("SELECT * FROM Elections WHERE ElectionId='" + electionid + "'", con);
            ds = new DataSet();
            da.Fill(ds, "Election");

            string status = ds.Tables["Election"].Rows[0]["Status"].ToString();
            string title = ds.Tables["Election"].Rows[0]["Title"].ToString();

            Page.Title = "Voting Status - " + title;

            if (status == "Completed")
            {
                da = new SqlDataAdapter("SELECT c.FullName, COUNT(v.VoteId) AS VoteCount FROM Candidates c LEFT JOIN Votes v ON c.CandidateId=v.CandidateId WHERE c.ElectionId='" + electionid + "' GROUP BY c.FullName ORDER BY VoteCount DESC", con);
                ds = new DataSet();
                da.Fill(ds, "Result");

                resultsList.DataSource = ds.Tables["Result"];
                resultsList.DataBind();

                resultsMessage.Text = "Final results for the completed election:";
                resultsList.Visible = true;
            }
            else
            {
                resultsList.Visible = false;
                resultsMessage.Text = "Results will be available once the election is completed.";
            }
        }
    }
}

