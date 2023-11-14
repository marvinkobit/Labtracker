using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker.Admin
{
    public partial class addproject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void CreateProject_Click(object sender, EventArgs e)
        {
            AddProjects projects = new AddProjects();
            

            bool addSuccess = projects.AddProject(txtProjectName.Text, txtProjectStr.Text, txtProjectDesc.Text, dtStartDate.Text, dtEndDate.Text);

            if (addSuccess)
            {
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect("/Admin/adminpage.aspx");
            }
            else
            {
                asSavelbl.Text = "Unable to add new project to database.";
            }
        }
    }
}