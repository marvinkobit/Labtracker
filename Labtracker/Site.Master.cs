using System;
using Labtracker.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Labtracker
{
    public partial class SiteMaster : MasterPage
    {
        public string SelectedProject = "x";
        protected void Page_Load(object sender, EventArgs e)
        {
            string myusername = HttpContext.Current.User.Identity.GetUserName();
            UsernameText.Text = myusername;

            if (Request.Cookies[myusername] != null)
            {
                SelectedProject = Request.Cookies[myusername].Value;
            }
            lblProjectStr.Text = SelectedProject;

        }
        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }
    }
}