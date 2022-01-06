
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Labtracker
{
    public partial class sample_receiving : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
            //gvSample.DataBind();
        }

        protected void gvSample_DataBound(object sender, EventArgs e)
        {
            if (gvSample.Rows.Count > 0)
            {
                string totsample = gvSample.Rows[gvSample.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }

       

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            var valueTocomp = ddlCOlVal.SelectedValue;
            var comp = ddlCompare.SelectedValue;
            var val = txtCompVal.Text;

            if (valueTocomp.Equals("SampleID"))
                {
                var valueTocompi = Convert.ToInt32( ddlCOlVal.SelectedValue);
                
                var vali = Convert.ToInt32(txtCompVal.Text);
                if(comp.Equals("equals"))
                {
                    if (gvSample.Rows.Count > 0)
                    {
                       /* gvSample.DataSource = SqlDataSource1;
                        gvSample.DataBind();*/


                    }
                }
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