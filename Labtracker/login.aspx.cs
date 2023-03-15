using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/dashboard.aspx");
                    //StatusText.Text = string.Format("Hello {0}!!, User.Identity.GetUserName()");
                    //LoginStatus.Visible = true;
                    //LogoutButton.Visible = true;

                }
                else
                {
                  
                }
            }
        }
        protected void SignIn(object sender,EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(UserName.Text, Password.Text);

            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                authenticationManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties() { IsPersistent = true }, userIdentity);

                //activity log
                var browser = (HttpContext.Current.Request.UserAgent.ToString().Contains("Chrome")) ? "Chrome" : HttpContext.Current.Request.Browser.Browser.ToString();
                browser = ((browser == "Chrome") || ( browser == "AppleMAC-Safari" )) ? browser : browser + "-" + HttpContext.Current.Request.Browser.Version.ToString();
                var useragent = HttpContext.Current.Request.UserAgent.ToString();
                var visitorIP = HttpContext.Current.Request.UserHostAddress.ToString();
                var mobile = "false";
                if (HttpContext.Current.Request.Browser.IsMobileDevice)
                {
                    mobile = HttpContext.Current.Request.Browser.MobileDeviceManufacturer + "-" + HttpContext.Current.Request.Browser.MobileDeviceModel;
                }
                AddAccessLogs addAccessLog = new AddAccessLogs();
                bool addSuccess = false;
                string action = "login";
                addSuccess = addAccessLog.AddAccessLog(user.Id,browser,visitorIP, mobile, useragent ,action);
                Response.Redirect("~/dashboard.aspx");
            }
            else
            {
                StatusText.Text = "Invalid username or password";

            }

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SignIn(sender,e);
            //Response.Redirect("~/dashboard.aspx");
        }
    }
}