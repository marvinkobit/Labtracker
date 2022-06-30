using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class sequencing : System.Web.UI.Page
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
                //string totsample2 = gvDstResult.Rows[gvDstResult.Rows.Count - 1].Cells[1].Text.ToString();
                //Session["Tsample2"] = totsample2;

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