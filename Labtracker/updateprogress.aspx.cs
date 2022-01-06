using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Labtracker.Models;

namespace Labtracker
{
    public partial class updateprogress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            AddUpdates samples = new AddUpdates();

          /*  bool addSuccessres = samples.AddSample(txtSId.Text, txtPId.Text, txtCNo.Text, txtVol.Text, txtQly.Text, txtRegion.Text, txtZone.Text, txtWoreda.Text, txtHealthF.Text, Convert.ToDateTime(txtDateColl.Text), Convert.ToDateTime(txtDateRec.Text), txtLabTech.Text, txtFilepath.Text, 1, 1);

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
            */
        }

        protected void DDLResType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string resultType = DDLResType.SelectedItem.Text.ToString();
           // string dnaEx = DDLDNAExRes.SelectedItem.Text.ToString();

         /*   if (resultType=="Smear")
                        {
                        DDLSmrRes.Visible = true;
                        DDLLJRes.Visible = false;
                        DDLMIJTRes.Visible = false;
                        DDLRD9Res.Visible = false;
                        DDLDNAExRes.Visible = false;
                        DDLSpolRes.Visible = false;
                        DDLResistRes.Visible = false;
            }
            
            else if(resultType == "LJ")
            {
                DDLLJRes.Visible = true;
                DDLSmrRes.Visible = false;
                
                DDLMIJTRes.Visible = false;
                DDLRD9Res.Visible = false;
                DDLDNAExRes.Visible = false;
                DDLSpolRes.Visible = false;
                DDLResistRes.Visible = false;
            }
            else if (resultType == "MIJT")
            {
                DDLMIJTRes.Visible = true;
                DDLSmrRes.Visible = false;
                DDLLJRes.Visible = false;
                
                DDLRD9Res.Visible = false;
                DDLDNAExRes.Visible = false;
                DDLSpolRes.Visible = false;
                DDLResistRes.Visible = false;
            }
            else if (resultType == "RD9")
            {
                DDLRD9Res.Visible = true;
                DDLSmrRes.Visible = false;
                DDLLJRes.Visible = false;
                DDLMIJTRes.Visible = false;
                
                DDLDNAExRes.Visible = false;
                DDLSpolRes.Visible = false;
                DDLResistRes.Visible = false;

            }
            else if (resultType == "DNA Extraction")
            {
                DDLDNAExRes.Visible = true;
                DDLSmrRes.Visible = false;
                DDLLJRes.Visible = false;
                DDLMIJTRes.Visible = false;
                DDLRD9Res.Visible = false;
                
                DDLSpolRes.Visible = false;
                DDLResistRes.Visible = false;

            }
            else if (resultType == "Spoligo")
            {
                DDLSpolRes.Visible = true;
                
                DDLSmrRes.Visible = false;
                DDLLJRes.Visible = false;
                DDLMIJTRes.Visible = false;
                DDLRD9Res.Visible = false;

                DDLDNAExRes.Visible = false;
                DDLResistRes.Visible = false;
            }
            else if (resultType == "Drug Resistance")
            {
                DDLResistRes.Visible = true;
                DDLSmrRes.Visible = false;
                DDLLJRes.Visible = false;
                DDLMIJTRes.Visible = false;
                DDLRD9Res.Visible = false;
                DDLDNAExRes.Visible = false;
                DDLSpolRes.Visible = false;
                
            }
            else {
                DDLSmrRes.Visible = false;
                DDLLJRes.Visible = false;
                DDLMIJTRes.Visible = false;
                DDLRD9Res.Visible = false;
                DDLDNAExRes.Visible = false;
                DDLSpolRes.Visible = false;
                DDLResistRes.Visible = false;
            }*/

        }
    }
}