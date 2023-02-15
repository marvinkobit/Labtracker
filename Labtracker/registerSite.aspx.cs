using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class registerSite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated | !User.IsInRole("canAdmin"))
            {
                Response.Redirect("~/login.aspx");
            }
        }

        protected void btnGoback_Click(object sender, EventArgs e)
        {
            //string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
            Response.Redirect("~/sample-receiving.aspx");
        }

        protected void btnSaveas_Click(object sender, EventArgs e)
        {


            AddSites sites = new AddSites();
       
            bool addSuccess = sites.AddSite(txtHealthFacility.Text, txtSitePId.Text, ddlCountry.SelectedItem.ToString(), txtRegion.Text, txtZone.Text, txtWoreda.Text,txtLocationLat.Text,txtLocationLong.Text, txtDateStart.Text,  txtRemark.Text);

            if (addSuccess)
            {
                //samplecount +=1;
                // Reload the page.
                //Session["totalcount"] = Convert.ToInt32(txtSId.Text)+1;
                //string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect("sample-receiving.aspx");
            }
            else
            {
                asSavelbl.Text = "Unable to add new site to database.";
            }


        }
    }
}