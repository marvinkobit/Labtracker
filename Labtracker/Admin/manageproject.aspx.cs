using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;

namespace Labtracker.Admin
{
    public partial class manageproject : System.Web.UI.Page
    {
        public int projectID;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["projectID"] != null)
                {
                    projectID = Convert.ToInt32(Request.QueryString["projectID"]);
                    



                    using (SampleContext _db = new SampleContext())
                   
                    {
                        Project mproject = _db.Projects.Find(projectID);

                        txtProjectSelected.Text = mproject.Project_Name;

                        txtProjectName.Text = mproject.Project_Name;
                        txtProjectStr.Text = mproject.ProjectStr;
                        txtProjectDesc.Text = mproject.Proj_Desc;
                        dtStartDate.Text = mproject.Proj_Start_Date?.ToString() ?? "";
                        dtEndDate.Text = mproject.Proj_End_Date?.ToString() ?? "";



                        SqlDataSourceP.SelectParameters["ProjectStr"].DefaultValue = mproject.ProjectStr;

                        //var userStore = new UserStore<ApplicationUser>(context);
                        //var userManager = new UserManager<ApplicationUser>(userStore);
                        //     var allusers = _db.ApplicationUsers;
                        //     var claims = _db.ApplicationUsers.SelectMany(u => u.Claims);


                        //     var users = allusers
                        //.Join(claims, u => u.Id, c => c.UserId, (u, c) => new { User = u, Claim = c })
                        //.Join(_db.Projects, uc => uc.Claim.ClaimValue, p => p.ProjectStr, (uc, p) => new { Claim = uc, Project = p })
                        //.Select(ucp => new
                        //{
                        //    UserName = ucp.Claim.User.UserName,
                        //    ProjectStr = ucp.Project.ProjectStr

                        //} )
                        //.ToList();
                        //     gvProjectUsers.DataSource = users;
                        //     gvProjectUsers.DataBind();


                    }

                }

            }
        }
    }
}