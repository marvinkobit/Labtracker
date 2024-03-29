﻿using Labtracker.Models;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class addsample : System.Web.UI.Page
    {
        //public int samplecount;
        protected void Page_Load(object sender, EventArgs e)
        {
            //var sampleId = (from s in _db.Samples select s.sID );
            //txtSId.Text = Convert.ToString(samplecount);
            //UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
            using (SampleContext _db = new SampleContext())
            {
                txtSId.Text = (Convert.ToInt32(_db.Samples.Count())+1).ToString();
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

            bool addSuccess = samples.AddSample(txtSId.Text,txtPId.Text, txtCNo.Text, txtVol.Text, txtQly.Text,ddlCountry.SelectedItem.ToString(), ddlRegion.SelectedItem.ToString(), ddlZone.SelectedItem.ToString(), ddlWoreda.SelectedItem.ToString(), ddlHealthF.SelectedItem.ToString(),txtDateColl.Text, txtDateRec.Text, txtLabTech.Text.ToUpper(), "addsample.aspx",category,1);

            if (addSuccess)
            {
                //samplecount +=1;
                // Reload the page.
                //Session["totalcount"] = Convert.ToInt32(txtSId.Text)+1;
                string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                Response.Redirect("sample-receiving.aspx");
            }
            else
            {
                asSavelbl.Text = "Unable to add new sample to database.";
            }
        }
        public IQueryable GetCategories()
            {
                var _db = new Labtracker.Models.SampleContext();
                IQueryable query = _db.Categories;
                return query;
            }
        public IQueryable GetStatuses()
        {
            var _db = new Labtracker.Models.SampleContext();
            IQueryable query = _db.Statuses;
            return query;
        }

        public IQueryable GetProcesses()
        {
            var _db = new Labtracker.Models.SampleContext();
            IQueryable query = _db.Processes;
            return query;
        }
        public IQueryable GetResistances()
        {
            var _db = new Labtracker.Models.SampleContext();
            IQueryable query = _db.Resistances;
            return query;
        }
        public IQueryable GetResults()
        {
            var _db = new Labtracker.Models.SampleContext();
            IQueryable query = _db.Results;
            return query;
        }
        public IQueryable GetProjects()
        {
            var _db = new Labtracker.Models.SampleContext();
            IQueryable query = _db.Projects;
            return query;
        }

        public IQueryable Samples()
            {
                var _db = new Labtracker.Models.SampleContext();
                IQueryable query = _db.Samples;
                return query;
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