using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Voting_System
{
	public partial class Site1 : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                if (Session["Role"] != null) 
                {
                    pnlGuestNav.Visible = false;
                    pnlCommonNav.Visible = true;

                    // Hide Home link for logged-in users
                    liHome.Visible = false;

                    if (Session["Role"].ToString() == "User")
                    {
                        pnlUserNav.Visible = true;
                        pnlAdminNav.Visible = false;
                    }
                    else if (Session["Role"].ToString() == "Admin")
                    {
                        pnlUserNav.Visible = false;
                        pnlAdminNav.Visible = true;
                    }
                }
                else // Guest
                {
                    pnlGuestNav.Visible = true;
                    pnlCommonNav.Visible = false;
                    pnlUserNav.Visible = false;
                    pnlAdminNav.Visible = false;

                    // Show Home only for guests
                    liHome.Visible = true;
                }
            }
        }
	}
}