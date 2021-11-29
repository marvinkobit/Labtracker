using System;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using Labtracker.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class report : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

       
        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("CrystalReport1.rpt"));
            CrystalReportViewer1.ReportSource = cryRpt;

        }
    }
}