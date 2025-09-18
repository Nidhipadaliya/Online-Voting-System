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
    public partial class UpcomingElections : System.Web.UI.Page
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
                FillGrid();
            }
        }

        void getcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void FillGrid()
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Elections", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void SelectElection(int id)
        {
            getcon();
            da = new SqlDataAdapter("SELECT * FROM Elections WHERE ElectionId=" + id, con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                txtTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();
                txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                txtStartDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["StartDate"]).ToString("yyyy-MM-dd");
                txtEndDate.Text = Convert.ToDateTime(ds.Tables[0].Rows[0]["EndDate"]).ToString("yyyy-MM-dd");
                ddlStatus.SelectedValue = ds.Tables[0].Rows[0]["Status"].ToString();
            }
        }

        protected void GridView1_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            ViewState["id"] = id;

            if (e.CommandName == "cmd_pub")
            {
                getcon();
                cmd = new SqlCommand("UPDATE Elections SET IsPublished = CASE WHEN IsPublished=1 THEN 0 ELSE 1 END WHERE ElectionId=" + id, con);
                cmd.ExecuteNonQuery();
                FillGrid();
            }
            else if (e.CommandName == "cmd_edit")
            {
                pnlEdit.Visible = true;
                SelectElection(id);
            }
            else if (e.CommandName == "cmd_del")
            {
                getcon();
                cmd = new SqlCommand("DELETE FROM Elections WHERE ElectionId=" + id, con);
                cmd.ExecuteNonQuery();
                FillGrid();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ViewState["id"]);
            getcon();
            cmd = new SqlCommand("UPDATE Elections SET Title='" + txtTitle.Text + "', Description='" + txtDescription.Text + "', StartDate='" + txtStartDate.Text + "', EndDate='" + txtEndDate.Text + "', Status='" + ddlStatus.SelectedValue + "' WHERE ElectionId=" + id, con);
            cmd.ExecuteNonQuery();

            pnlEdit.Visible = false;
            FillGrid();
        }

        
    }
}