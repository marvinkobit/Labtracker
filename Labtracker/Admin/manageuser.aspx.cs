using Labtracker.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker.Admin
{
    public partial class manageuser : System.Web.UI.Page
    {
        public string muserID;
        protected void Page_Load(object sender, EventArgs e)
        {

            
                if (Request.QueryString["userID"] != null)
                {

                    muserID = Request.QueryString["userID"];

                    using (ApplicationDbContext context = new ApplicationDbContext())

                    {
                        var userStore = new UserStore<IdentityUser>();
                        var manager = new UserManager<IdentityUser>(userStore);

                        ApplicationUser muser = context.Users.Find(muserID);

                        string muserRole = manager.GetRoles(muserID).First();


                        txtUserName.Text = muser.UserName;
                        txtPhone.Text = muser.PhoneNumber ?? "";
                        txtUserRole.Text = muserRole;

                        SqlDataSourceUP.SelectParameters["UserID"].DefaultValue = muserID;


                    }
                
            }
        }

        protected void GrantUser_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["userID"] != null)
            {
                using (ApplicationDbContext context = new ApplicationDbContext())

                {
                    muserID = Request.QueryString["userID"].ToString();
                    var userStore = new UserStore<IdentityUser>();
                    var manager = new UserManager<IdentityUser>(userStore);
                    string projectclaimed = ddlProjectGrant.SelectedItem.ToString();
                    ApplicationUser muser = context.Users.Find(muserID);

                    //project access claim check
                    var claims = manager.GetClaims(muser.Id);
                    if (!claims.Any(c => c.Type == "Project" && c.Value == projectclaimed)) //if claim doesnot already exist Add it
                    {
                        var claim = new Claim("Project", projectclaimed);
                        manager.AddClaim(muser.Id, claim);
                    }

                }
            }

            Response.Redirect($"/Admin/manageuser.aspx?userID={muserID}");
        }

        protected void RevokeUser_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["userID"] != null)
            {
                using (ApplicationDbContext context = new ApplicationDbContext())

                {
                    muserID = Request.QueryString["userID"].ToString();
                    var userStore = new UserStore<IdentityUser>();
                    var manager = new UserManager<IdentityUser>(userStore);
                    string projecttoRevoke = ddlProjectRevoke.SelectedItem.ToString();
                    ApplicationUser muser = context.Users.Find(muserID);

                    //
                    var claims = manager.GetClaims(muser.Id);
                    if (claims.Any(c => c.Type == "Project" && c.Value == projecttoRevoke)) // check project access claim 
                    {
                        var claim = new Claim("Project", projecttoRevoke);
                        manager.RemoveClaim(muser.Id, claim);
                    }

                }
            }

            Response.Redirect($"/Admin/manageuser.aspx?userID={muserID}");
        }

    }
}