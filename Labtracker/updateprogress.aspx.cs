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
                string addSuccessexp = "";
                string selectedres = DDLResType.SelectedItem.ToString();
                string selectedvalue = DDLRESVAL.SelectedItem.ToString();
                string dateshit = txtDateProcess.Text;
                string labinitial = txtLabTechPr.Text;
                string remarks = txtRemarks.Text;
                DateTime? datesh = string.IsNullOrEmpty(dateshit) ? (DateTime?)null :  Convert.ToDateTime(dateshit);

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
                        addSuccessres = updates.AddUpdate(txtSampleIdUpdate.Text, sens, drug, drugline, labinitial.ToUpper(), datesh);
                        break;

                    case "Growth Detection":
                        string week = selectedvalue;
                        string primarymedia = ddlGrowthdetail.SelectedItem.ToString();
                        string input = ddlGrowth.SelectedItem.ToString();
                        string dateRep = txtRepDate.Text;
                        //DateTime dateRepo = Convert.ToDateTime(dateRep);
                        addSuccessres = updates.AddUpdate(dateshit, dateRep, txtSampleIdUpdate.Text, week, primarymedia, input, labinitial.ToUpper(), remarks);
                        break;

                    case "Growth Detection Weekly":
                        string primaryMedia = ddlGrowthMedia.SelectedItem.ToString();
                        string daterip = txtReportDate.Text;
                        //DateTime dateReport = Convert.ToDateTime(daterip);
                        string[] weekly = new String[8];
                        weekly[0] = ddlWeek1.SelectedItem.ToString();
                        weekly[1] = ddlWeek2.SelectedItem.ToString();
                        weekly[2] = ddlWeek3.SelectedItem.ToString();
                        weekly[3] = ddlWeek4.SelectedItem.ToString();
                        weekly[4] = ddlWeek5.SelectedItem.ToString();
                        weekly[5] = ddlWeek6.SelectedItem.ToString();
                        weekly[6] = ddlWeek7.SelectedItem.ToString();
                        weekly[7] = ddlWeek8.SelectedItem.ToString();
                        for (int i=0;i<8;i++)
                        {
                            addSuccessres = updates.AddUpdate(dateshit, daterip, txtSampleIdUpdate.Text, (i+1).ToString(), primaryMedia, weekly[i].Equals("details")? null:weekly[i], labinitial.ToUpper(), remarks);
                        }
                        break;

                    case "DNA Extraction":
                        string qubit = txtQUcon.Text;
                        string nd = txtNDcon.Text;
                        string purity = txtPurity.Text;
                        addSuccessres = updates.AddUpdater(datesh, txtSampleIdUpdate.Text, purity, nd, qubit, remarks, labinitial.ToUpper());
                        break;

                    case "Heat Killing":
                        string initialRecieved = txtInitialRecievedBy.Text;
                        string dateTransfer = txtDateTransfer.Text;
                        (addSuccessres,addSuccessexp) = updates.HeatKilling(txtSampleIdUpdate.Text, selectedvalue, dateshit, dateTransfer, labinitial.ToUpper(), initialRecieved.ToUpper(), remarks);
                        break;
                    case "Library Prep":
                        string libconc= txtLibConc.Text;
                        string avgsize = txtAvgsize.Text;
                        string avgsizeperct = txtAvgPerct.Text;
                        string indexi5 = txtIndexi5.Text;
                        string indexi7 = txtIndexi7.Text;
                        (addSuccessres, addSuccessexp) = updates.LibraryPreparation(txtSampleIdUpdate.Text, remarks, labinitial,  libconc, avgsize, avgsizeperct, indexi5, indexi7, dateshit);
                        break;
                        
                    default:
                        addSuccessres = updates.AddUpdate(txtSampleIdUpdate.Text, txtSampleIdUpdate.Text, selectedvalue, selectedres, datesh, labinitial.ToUpper());
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
                    asSavelbl.Text = String.Format("Unable to add new Update to database. {0}{1}{2}", selectedvalue,dateshit, addSuccessexp);
                }
          

        }

      
    }
}