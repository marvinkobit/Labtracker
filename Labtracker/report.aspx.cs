﻿using System;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using Labtracker.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace Labtracker
{
    public partial class report : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {
            switch (DropDownList1.Text)
            {
                case "Sample Recieving":
                    ReportDocument cryRpt = new ReportDocument();
                    cryRpt.Load(Server.MapPath("CrystalReport1.rpt"));
                    CrystalReportViewer1.ReportSource = cryRpt;
                    break;
                case "Progress":
                    ReportDocument cryRpt2 = new ReportDocument();
                    cryRpt2.Load(Server.MapPath("CrystalReport2.rpt"));
                    CrystalReportViewer1.ReportSource = cryRpt2;
                    break;

            }
            //ListItem idlbl = (ListItem)e.Item.FindControl("");
           

        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }
    }
}