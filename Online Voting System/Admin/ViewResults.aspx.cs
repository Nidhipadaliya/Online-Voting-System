using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Online_Voting_System.Admin
{
    public partial class ViewResults : System.Web.UI.Page
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
                fillResults();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillResults()
        {
            getcon();
            ds = new DataSet();

            // Fetch elections
            da = new SqlDataAdapter("SELECT ElectionId, Title, StartDate FROM Elections WHERE Status IN ('Ongoing','Completed')", con);
            da.Fill(ds, "Elections");

            // Fetch candidates and votes
            da = new SqlDataAdapter("SELECT c.CandidateId, c.FullName, c.ElectionId, COUNT(v.VoteId) AS VoteCount, RANK() OVER(PARTITION BY c.ElectionId ORDER BY COUNT(v.VoteId) DESC) AS Rank FROM Candidates c LEFT JOIN Votes v ON c.CandidateId = v.CandidateId GROUP BY c.CandidateId, c.FullName, c.ElectionId", con);
            da.Fill(ds, "Candidates");

            ds.EnforceConstraints = false;

            ds.Relations.Add("ElectionCandidates", ds.Tables["Elections"].Columns["ElectionId"], ds.Tables["Candidates"].Columns["ElectionId"], false);

            rptElections.DataSource = ds.Tables["Elections"];
            rptElections.DataBind();

        }
        protected void rptElections_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                Repeater rptCandidates = (Repeater)e.Item.FindControl("rptCandidates");
                DataRow[] childRows = drv.Row.GetChildRows("ElectionCandidates");

                if (childRows.Length > 0)
                {
                    rptCandidates.DataSource = childRows.CopyToDataTable();
                    rptCandidates.DataBind();
                }
            }
        }
    }
}