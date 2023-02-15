using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class addsampledynamic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
            using (SampleContext _db = new SampleContext())
            {
                txtSId.Text = (Convert.ToInt32(_db.Samples.Count()) + 1).ToString();
                txtSId.Enabled = false;

            }
        }


        protected void btnGoback_Click(object sender, EventArgs e)
        {
            string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
            Response.Redirect("sample-receiving.aspx");
        }


        protected void btnSaveas_Click(object sender, EventArgs e)
        {
            AddSamples samples = new AddSamples();
            int category = Convert.ToInt32(ddlSampleType.SelectedValue);

            bool addSuccess = samples.AddSample(txtSId.Text, txtPId.Text, txtCNo.Text, txtVol.Text, txtQly.Text, ddlCountry.SelectedItem.ToString(), ddlRegion.SelectedItem.ToString(), ddlZone.SelectedItem.ToString(), ddlWoreda.SelectedItem.ToString(), ddlHealthF.SelectedItem.ToString(), Convert.ToDateTime(txtDateColl.Text), Convert.ToDateTime(txtDateRec.Text), txtLabTech.Text.ToUpper(), "addsample.aspx", category, 1);

            if (addSuccess)
            {
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect("sample-receiving.aspx");
            }
            else
            {
                asSavelbl.Text = "Unable to add new sample to database.";
            }
        }


        protected void ClearTextBoxes(Control p1)
        {
            foreach (Control ctrl in p1.Controls)
            {
                if (ctrl is TextBox)
                {
                    TextBox t = ctrl as TextBox;

                    if (t != null)
                    {
                        t.Text = String.Empty;
                    }
                }
                else
                {
                    if (ctrl.Controls.Count > 0)
                    {
                        ClearTextBoxes(ctrl);
                    }
                }
            }
        }

    }
}