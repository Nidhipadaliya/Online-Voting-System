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
    public partial class ManageCandidates : System.Web.UI.Page
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
                FillElections();
                BindCandidates();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void imgupload()
        {
            if (flpimg.HasFile)
            {
                fnm = "~/Images/" + flpimg.FileName;
                flpimg.SaveAs(Server.MapPath(fnm));
            }
        }

        void FillElections()
        {
            getcon();
            da = new SqlDataAdapter("SELECT ElectionId, Title FROM Elections WHERE IsPublished = 1", con);
            ds = new DataSet();
            da.Fill(ds);

            ddlElection.DataSource = ds;
            ddlElection.DataTextField = "Title";
            ddlElection.DataValueField = "ElectionId";
            ddlElection.DataBind();

            ddlElection.Items.Insert(0, new ListItem("-- Select Election --", ""));
        }

        void BindCandidates()
        {
            getcon();
            da = new SqlDataAdapter(@"SELECT c.CandidateId, c.FullName, c.Description, c.Image, e.Title AS ElectionTitle FROM Candidates c  INNER JOIN Elections e ON c.ElectionId = e.ElectionId", con);
            ds = new DataSet();
            da.Fill(ds);

            gvCandidates.DataSource = ds;
            gvCandidates.DataBind();

        }
        void clear()
        {
            txtCandidateName.Text = "";
            txtDescription.Text = "";
            ddlElection.SelectedIndex = 0;
            ViewState["CandidateId"] = null;
            btnAddCandidate.Text = "Add Candidate";
        }
        protected void btnAddCandidate_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();

            if (ViewState["CandidateId"] == null)
            {
                string query = "INSERT INTO Candidates (FullName, Description, Image, ElectionId) " +"VALUES ('" + txtCandidateName.Text + "', '" + txtDescription.Text + "', '" + fnm + "', '" + ddlElection.SelectedValue + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Candidate added successfully!');</script>");
            }
            else
            {
                string query = "UPDATE Candidates SET FullName='" + txtCandidateName.Text + "', Description='" + txtDescription.Text + "', Image='" + fnm + "', ElectionId='" + ddlElection.SelectedValue + "' WHERE CandidateId='" + ViewState["CandidateId"] + "'";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Candidate updated successfully!');</script>");
            }

            clear();
            BindCandidates();
        }

        protected void gvCandidates_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_edit")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ViewState["CandidateId"] = id;

                getcon();
                da = new SqlDataAdapter("SELECT * FROM Candidates WHERE CandidateId='" + id + "'", con);
                ds = new DataSet();
                da.Fill(ds);

                txtCandidateName.Text = ds.Tables[0].Rows[0]["FullName"].ToString();
                txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                ddlElection.SelectedValue = ds.Tables[0].Rows[0]["ElectionId"].ToString();

                btnAddCandidate.Text = "Update Candidate";
            }
            else if (e.CommandName == "cmd_delete")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                getcon();
                cmd = new SqlCommand("DELETE FROM Candidates WHERE CandidateId='" + id + "'", con);
                cmd.ExecuteNonQuery();
                BindCandidates();
                Response.Write("<script>alert('Candidate deleted successfully!');</script>");
            }
        }
    }
}