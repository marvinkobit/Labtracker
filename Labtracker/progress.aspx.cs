using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Labtracker
{
    public partial class progress : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }

        }
        protected void gvResult_DataBound(object sender, EventArgs e)
        {
            if (gvResult.Rows.Count > 0)
            {
                string totsample = gvResult.Rows[gvResult.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }
        protected void gvDstResult_DataBound(object sender, EventArgs e)
        {
            if (gvResult.Rows.Count > 0)
            {
                string totsample = gvDstResult.Rows[gvDstResult.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }

        protected void gvGrowthResult_DataBound(object sender, EventArgs e)
        {
            if (gvGrowthResult.Rows.Count > 0)
            {
                string totsample = gvGrowthResult.Rows[gvGrowthResult.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }
        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }
    }
}