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
	public partial class CreateElection : System.Web.UI.Page
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
        void clear()
        {
            txtTitle.Text = "";
            txtDescription.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            ddlStatus.SelectedIndex = 0;
        }

        protected void btnCreateElection_Click(object sender, EventArgs e)
        {
            getcon();
            imgupload();
            cmd = new SqlCommand("insert into Elections (Title, Description, Image,StartDate, EndDate, Status, IsPublished)  values('"+txtTitle.Text+"','"+txtDescription.Text+ "','"+fnm+"','"+txtStartDate.Text+ "','"+txtEndDate.Text+ "','"+ ddlStatus.SelectedValue+ "',0)", con);
            cmd.ExecuteNonQuery();
            clear();
            Response.Write("<script>alert('Election created successfully');</script>");
        }
    }
}