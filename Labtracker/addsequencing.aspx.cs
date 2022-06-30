using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class addsequencing : System.Web.UI.Page
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
        protected void btnGoback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/sequencing.aspx");
        }
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
            DateTime? datesh = string.IsNullOrEmpty(dateshit) ? (DateTime?)null : Convert.ToDateTime(dateshit);

            switch (selectedres)
            {
               

                case "DNA Extraction":
                    string qubit = txtQUcon.Text;
                    string nd = txtNDcon.Text;
                    string purity = txtPurity.Text;
                    addSuccessres = updates.AddUpdater(datesh, txtSampleIdUpdate.Text, purity, nd, qubit, remarks, labinitial.ToUpper());
                    break;
               
                case "Library Prep":
                    string libconc = txtLibConc.Text;
                    string avgsize = txtAvgsize.Text;
                    string avgsizeperct = txtAvgPerct.Text;
                    string indexi5 = txtIndexi5.Text;
                    string indexi7 = txtIndexi7.Text;
                    (addSuccessres, addSuccessexp) = updates.LibraryPreparation(txtSampleIdUpdate.Text, remarks, labinitial, libconc, avgsize, avgsizeperct, indexi5, indexi7, dateshit);
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
                asSavelbl.Text = String.Format("Unable to add new Update to database. {0}{1}{2}", selectedvalue, dateshit, addSuccessexp);
            }


        }
    }
}