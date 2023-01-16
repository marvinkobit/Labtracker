using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;


using System.IO;
using System.Text;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;

namespace Labtracker
{
    public partial class progress : System.Web.UI.Page
    {

        SqlDataSource dataSource_gvResult = null;
        bool isFilter = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
            if (!IsPostBack)
            {

                Session["isFilter_gvResult"] = false;
                gvResult.DataSourceID = "SqlDataSource1";


                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string sql = "SELECT COUNT(DISTINCT PatientId) FROM Results";
                    string sql2 = "SELECT COUNT(DISTINCT PatientId) FROM HeatKills";
                    string sql3 = "SELECT COUNT(PatientId) FROM Dsts";
                    string sql4 = "SELECT COUNT(DISTINCT PatientId) FROM Dsts";


                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();

                            lblCultureResults.Text = reader[0].ToString();
                        }

                    }
                    using (SqlCommand cmd2 = new SqlCommand(sql2, conn))
                    {
                        using (SqlDataReader reader = cmd2.ExecuteReader())
                        {
                            reader.Read();

                            lblHeatkilled.Text = reader[0].ToString();
                        }

                    }
                    using (SqlCommand cmd3 = new SqlCommand(sql3, conn))
                    {
                        using (SqlDataReader reader = cmd3.ExecuteReader())
                        {
                            reader.Read();

                            lblDSTtests.Text = reader[0].ToString();
                        }

                    }
                    using (SqlCommand cmd4 = new SqlCommand(sql4, conn))
                    {
                        using (SqlDataReader reader = cmd4.ExecuteReader())
                        {
                            reader.Read();

                            lblDST.Text = reader[0].ToString();
                        }

                    }




                }



                }


        }
        protected void gvGrowthResult_DataBound(object sender, EventArgs e)
        {
            if (gvResult.Rows.Count > 0)
            {
                string totsample = gvResult.Rows[gvResult.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }
        protected void gvDstResult_DataBound(object sender, EventArgs e)
        {
            if (gvResult.Rows.Count > 0)
            {
                //string totsample2 = gvDstResult.Rows[gvDstResult.Rows.Count - 1].Cells[1].Text.ToString();
                //Session["Tsample2"] = totsample2;

            }
        }

        protected void gvResult_DataBound(object sender, EventArgs e)
        {
            if (gvResult.Rows.Count > 0)
            {
                //string totsample3 = gvResult.Rows[gvResult.Rows.Count - 1].Cells[1].Text.ToString();
                //Session["Tsample3"] = totsample3;

            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {

            var valueTocomp = ddlCOlVal.SelectedItem.ToString();
            var comp = ddlCompare.SelectedItem.ToString();
            var val = txtCompVal.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results WHERE {0}='{1}' ", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results WHERE {0} LIKE '{1}%'", valueTocomp, val);
            }

            dataSource_gvResult = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource_gvResult;


            gvResult.DataSourceID = null;
            //gvResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvResult.DataSource = dataSource_gvResult;
            gvResult.AllowSorting = true;
            gvResult.AllowPaging = true;
            gvResult.DataBind();

            Session["isFilter_gvResult"] = true;

            /*if (valueTocomp.Equals("PatientId"))
                {
                //var valueTocompi = Convert.ToInt32( ddlCOlVal.SelectedValue);
                
               // var vali = Convert.ToInt32(txtCompVal.Text);
                if(comp.Equals("equals"))
                {
                    
                }
            }*/
        }

        protected void gvResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvResult.AllowSorting = true;
            gvResult.AllowPaging = true;
            gvResult.PageIndex = e.NewPageIndex;
            isFilter = (bool)Session["isFilter_gvResult"];
            if (isFilter)
            {
                gvResult.DataSourceID = null;
                gvResult.DataSource = (SqlDataSource)Session["ds"];
            }

            gvResult.DataBind();
        }

        protected void gvResult_Sorting(object sender, GridViewSortEventArgs e)
        {
            isFilter = (bool)Session["isFilter_gvResult"];
            if (isFilter)
            {
                gvResult.DataSourceID = null;
                var data = (SqlDataSource)Session["ds"];
                data.SortParameterName = e.SortExpression;
                gvResult.DataSource = dataSource_gvResult;
            }
            gvResult.DataBind();
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }

        protected void ExportToPDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            //gvResult.AllowPaging = false;
            //this.BindGrid();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    gvResult.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
         }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }


    }
}