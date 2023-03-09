using Labtracker.Models;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public partial class regster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated | !User.IsInRole("canAdmin"))
            {
                Response.Redirect("~/login.aspx");
            }
        }
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new IdentityUser() { UserName = UserName.Text, Email = UserName.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            
            if (result.Succeeded)
            {

                String srole = ddlRole.SelectedValue;
                switch (srole)
                {
                    case "Admin":
                        manager.AddToRole(user.Id, "canAdmin");
                        break;
                        
                    case "LabUser":
                        manager.AddToRole(user.Id, "LabUser");
                        break;
                    case "Reviewer":
                        manager.AddToRole(user.Id, "Reviewer");
                       
                        break;

                }
                
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                StatusMessage.Text = string.Format("User {0} was Succesfully Created",user.UserName);

                //works
                //var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                //var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                //authenticationManager.SignIn(new Microsoft.Owin.Security.AuthenticationProperties() { }, userIdentity);
                //Response.Redirect("~/Login.aspx");

                //signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                //IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                StatusMessage.Text = string.Format("Error in creating a User. \n {0}",result.Errors.FirstOrDefault());
            }
        }
    }
}