using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Labtracker.Models;
using Labtracker.Logic;
using System.Activities;
using System.Windows;

namespace Labtracker
{
    public partial class updateprogress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!User.Identity.IsAuthenticated)
            //{
            //    Response.Redirect("~/login.aspx");
            //}
        }

        //protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        //{

        //}

        //protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}

        protected void btnSaveup_Click(object sender, EventArgs e)
        {
            
                AddUpdates updates = new AddUpdates();
                bool addSuccessres = false;
                string selectedres = DDLResType.SelectedItem.ToString();
                string selectedvalue = DDLRESVAL.SelectedItem.ToString();
                string dateshit = txtDateProcess.Text;
                string labinitial = txtLabTechPr.Text;
                DateTime datesh = Convert.ToDateTime(dateshit);

            switch (selectedres)
            {
                case "Spoligo":
                    string spoligo_res = txtSpold.Text;
                    addSuccessres = updates.AddUpdate(txtSampleIdUpdate.Text, txtSampleIdUpdate.Text, spoligo_res, selectedres, datesh, labinitial);
                    break;
                case "DST":
                    string drug = ddlDSTdetail1.SelectedItem.ToString();
                    string drugline = selectedvalue;
                    string sens = ddlDSTdetail2.SelectedItem.ToString();
                    addSuccessres = updates.AddUpdate(txtSampleIdUpdate.Text, sens, drug, drugline, labinitial,datesh);
                    break;
                case "Growth Detection":
                    string week = selectedvalue;
                    string primarymedia = ddlGrowthdetail.SelectedItem.ToString();
                    string input = txtGrowth.Text;
                    addSuccessres = updates.AddUpdate(datesh,txtSampleIdUpdate.Text,week,primarymedia,input,labinitial);
                    break;

                default:
                    addSuccessres = updates.AddUpdate(txtSampleIdUpdate.Text, txtSampleIdUpdate.Text, selectedvalue, selectedres, Convert.ToDateTime(txtDateProcess.Text), labinitial);
                    break;
            }


                         
                
                
         

                if (addSuccessres)
                {
                    //samplecount +=1;
                    // Reload the page.
                    //Session["totalcount"] = Convert.ToInt32(txtSId.Text)+1;
                    //string pageUrl = Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.Count() - Request.Url.Query.Count());
                    Response.Redirect("progress.aspx");

                }
                else
                {
                    asSavelbl.Text = String.Format("Unable to add new Update to database. {0}{1}{2}", selectedvalue,dateshit,datesh);
                }
          

        }

        //protected void DDLResType_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //string resultType = DDLResType.SelectedItem.Text.ToString();
        //   // string dnaEx = DDLDNAExRes.SelectedItem.Text.ToString();

        // /*   if (resultType=="Smear")
        //                {
        //                DDLSmrRes.Visible = true;
        //                DDLLJRes.Visible = false;
        //                DDLMIJTRes.Visible = false;
        //                DDLRD9Res.Visible = false;
        //                DDLDNAExRes.Visible = false;
        //                DDLSpolRes.Visible = false;
        //                DDLResistRes.Visible = false;
        //    }
            
        //    else if(resultType == "LJ")
        //    {
        //        DDLLJRes.Visible = true;
        //        DDLSmrRes.Visible = false;
                
        //        DDLMIJTRes.Visible = false;
        //        DDLRD9Res.Visible = false;
        //        DDLDNAExRes.Visible = false;
        //        DDLSpolRes.Visible = false;
        //        DDLResistRes.Visible = false;
        //    }
        //    else if (resultType == "MIJT")
        //    {
        //        DDLMIJTRes.Visible = true;
        //        DDLSmrRes.Visible = false;
        //        DDLLJRes.Visible = false;
                
        //        DDLRD9Res.Visible = false;
        //        DDLDNAExRes.Visible = false;
        //        DDLSpolRes.Visible = false;
        //        DDLResistRes.Visible = false;
        //    }
        //    else if (resultType == "RD9")
        //    {
        //        DDLRD9Res.Visible = true;
        //        DDLSmrRes.Visible = false;
        //        DDLLJRes.Visible = false;
        //        DDLMIJTRes.Visible = false;
                
        //        DDLDNAExRes.Visible = false;
        //        DDLSpolRes.Visible = false;
        //        DDLResistRes.Visible = false;

        //    }
        //    else if (resultType == "DNA Extraction")
        //    {
        //        DDLDNAExRes.Visible = true;
        //        DDLSmrRes.Visible = false;
        //        DDLLJRes.Visible = false;
        //        DDLMIJTRes.Visible = false;
        //        DDLRD9Res.Visible = false;
                
        //        DDLSpolRes.Visible = false;
        //        DDLResistRes.Visible = false;

        //    }
        //    else if (resultType == "Spoligo")
        //    {
        //        DDLSpolRes.Visible = true;
                
        //        DDLSmrRes.Visible = false;
        //        DDLLJRes.Visible = false;
        //        DDLMIJTRes.Visible = false;
        //        DDLRD9Res.Visible = false;

        //        DDLDNAExRes.Visible = false;
        //        DDLResistRes.Visible = false;
        //    }
        //    else if (resultType == "Drug Resistance")
        //    {
        //        DDLResistRes.Visible = true;
        //        DDLSmrRes.Visible = false;
        //        DDLLJRes.Visible = false;
        //        DDLMIJTRes.Visible = false;
        //        DDLRD9Res.Visible = false;
        //        DDLDNAExRes.Visible = false;
        //        DDLSpolRes.Visible = false;
                
        //    }
        //    else {
        //        DDLSmrRes.Visible = false;
        //        DDLLJRes.Visible = false;
        //        DDLMIJTRes.Visible = false;
        //        DDLRD9Res.Visible = false;
        //        DDLDNAExRes.Visible = false;
        //        DDLSpolRes.Visible = false;
        //        DDLResistRes.Visible = false;
        //    }*/

        //}
    }
}