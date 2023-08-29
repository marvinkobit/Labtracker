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
        SqlDataSource dataSource_gvHeatkill = null;
        SqlDataSource dataSource_gvDstResult = null;
        bool isFilter = false;
        bool isFilter_Heatkill = false;
        bool isFilter_DstResult = false;

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
                Session["isFilter_gvHeatkill"] = false;
                Session["isFilter_gvDstResult"] = false;
                gvResult.DataSourceID = "SqlDataSource1";
                gvHeatkill.DataSourceID = "SqlDataSource5";
                gvDstResult.DataSourceID = "SqlDataSource2";


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

        protected void gvHeatkill_DataBound(object sender, EventArgs e)
        {
            if (gvHeatkill.Rows.Count > 0)
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
                searchQuery = String.Format("SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
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


        protected void btnFilter_Click_Heatkill(object sender, EventArgs e)
        {
            var valueTocomp = ddlCOlVal_Heatkill.SelectedItem.ToString();
            var comp = ddlCompare_Heatkill.SelectedItem.ToString();
            var val = txtCompVal_Heatkill.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [PatientId],[HeatKillId],[MediaType],[InitialTransfer],[InitialRecieved],[DateHeatKill],[DateTransfer],[Remark] FROM [HeatKills] WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [PatientId],[HeatKillId],[MediaType],[InitialTransfer],[InitialRecieved],[DateHeatKill],[DateTransfer],[Remark] FROM [HeatKills] WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
            }

            dataSource_gvHeatkill = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds_Heatkill"] = dataSource_gvHeatkill;


            gvHeatkill.DataSourceID = null;
            //gvHeatkill.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvHeatkill.DataSource = dataSource_gvHeatkill;
            gvHeatkill.AllowSorting = true;
            gvHeatkill.AllowPaging = true;
            gvHeatkill.DataBind();

            Session["isFilter_gvHeatkill"] = true;
        }
        protected void gvHeatkill_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvHeatkill.AllowSorting = true;
            gvHeatkill.AllowPaging = true;
            gvHeatkill.PageIndex = e.NewPageIndex;
            isFilter_Heatkill = (bool)Session["isFilter_gvHeatkill"];
            if (isFilter_Heatkill)
            {
                gvHeatkill.DataSourceID = null;
                gvHeatkill.DataSource = (SqlDataSource)Session["ds_Heatkill"];
            }

            gvHeatkill.DataBind();
        }

        protected void gvHeatkill_Sorting(object sender, GridViewSortEventArgs e)
        {
            isFilter_Heatkill = (bool)Session["isFilter_gvHeatkill"];
            if (isFilter_Heatkill)
            {
                gvHeatkill.DataSourceID = null;
                var data = (SqlDataSource)Session["ds_Heatkill"];
                data.SortParameterName = e.SortExpression;
                gvHeatkill.DataSource = dataSource_gvHeatkill;
            }
            gvHeatkill.DataBind();
        }

        protected void btnFilter_Click_Dst(object sender, EventArgs e)
        {
            var valueTocomp = ddlCOlVal_Dst.SelectedItem.ToString();
            var comp = ddlCompare_Dst.SelectedItem.ToString();
            var val = txtCompVal_Dst.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [DstID],[DrugLine],[Drug],[Sensitivity],[Dater],[Initial],[PatientId],[DateResult] FROM [Dsts] WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [DstID],[DrugLine],[Drug],[Sensitivity],[Dater],[Initial],[PatientId],[DateResult] FROM [Dsts] WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
            }

            dataSource_gvDstResult = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds_DstResult"] = dataSource_gvDstResult;


            gvDstResult.DataSourceID = null;
            //gvDstResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvDstResult.DataSource = dataSource_gvDstResult;
            gvDstResult.AllowSorting = true;
            gvDstResult.AllowPaging = true;
            gvDstResult.DataBind();

            Session["isFilter_gvDstResult"] = true;
        }

        protected void gvDst_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDstResult.AllowSorting = true;
            gvDstResult.AllowPaging = true;
            gvDstResult.PageIndex = e.NewPageIndex;
            isFilter_DstResult = (bool)Session["isFilter_gvDstResult"];
            if (isFilter_DstResult)
            {
                gvDstResult.DataSourceID = null;
                gvDstResult.DataSource = (SqlDataSource)Session["ds_DstResult"];
            }

            gvDstResult.DataBind();
        }

        protected void gvDst_Sorting(object sender, GridViewSortEventArgs e)
        {
            isFilter_DstResult = (bool)Session["isFilter_gvDstResult"];
            if (isFilter_DstResult)
            {
                gvDstResult.DataSourceID = null;
                var data = (SqlDataSource)Session["ds_DstResult"];
                data.SortParameterName = e.SortExpression;
                gvDstResult.DataSource = dataSource_gvDstResult;
            }
            gvDstResult.DataBind();
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }

        protected void Binder()
        {
            var valueTocomp = ddlCOlVal.SelectedItem.ToString();
            var comp = ddlCompare.SelectedItem.ToString();
            var val = txtCompVal.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [ResultID],[PatientId],[Smear_res],[HeatKilled_res],[RD9_res],[LJ_res],[LJ_P_res],[MIJT_res],[CultureSmear_res],[Spoligo_res],[BHI],[FinalCultureResult],[LabInitial],[Remark] FROM Results WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
            }

            dataSource_gvResult = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource_gvResult;


            gvResult.DataSourceID = null;
            //gvResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvResult.DataSource = dataSource_gvResult;
            gvResult.AllowSorting = true;
            //sgvResult.AllowPaging = true;
            gvResult.DataBind();

            Session["isFilter_gvResult"] = true;
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

        protected void GeneratePDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            gvResult.AllowPaging = false;
            this.Binder();

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

        protected void GenerateCSV(object sender, EventArgs e)
        {
            this.Binder();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultExport.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            gvResult.AllowPaging = false;
            gvResult.DataBind();
            StringBuilder columnbind = new StringBuilder();
            for (int k = 1; k < gvResult.Columns.Count; k++)
            {
                columnbind.Append(gvResult.Columns[k].HeaderText + ',');
            }
            columnbind.Append("\r\n");
            for (int i = 0; i < gvResult.Rows.Count; i++)
            {
                for (int k = 2; k < gvResult.Columns.Count; k++)
                {
                    columnbind.Append(gvResult.Rows[i].Cells[k].Text.Replace("&nbsp;","") + ',');
                }
                columnbind.Append("\r\n");
            }
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }

        protected void Binder_Heatkill()
        {
            var valueTocomp = ddlCOlVal_Heatkill.SelectedItem.ToString();
            var comp = ddlCompare_Heatkill.SelectedItem.ToString();
            var val = txtCompVal_Heatkill.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [PatientId],[HeatKillId],[MediaType],[InitialTransfer],[InitialRecieved],[DateHeatKill],[DateTransfer],[Remark] FROM [HeatKills] WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [PatientId],[HeatKillId],[MediaType],[InitialTransfer],[InitialRecieved],[DateHeatKill],[DateTransfer],[Remark] FROM [HeatKills] WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
            }

            dataSource_gvHeatkill = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds_Heatkill"] = dataSource_gvHeatkill;


            gvHeatkill.DataSourceID = null;
            //gvHeatkill.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvHeatkill.DataSource = dataSource_gvHeatkill;
            gvHeatkill.AllowSorting = true;
            //gvHeatkill.AllowPaging = true;
            gvHeatkill.DataBind();

            Session["isFilter_gvHeatkill"] = true;
        }

        protected void GenerateCSV_Heatkill(object sender, EventArgs e)
        {
            this.Binder_Heatkill();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleHeatKillExport.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            gvHeatkill.AllowPaging = false;
            gvHeatkill.DataBind();
            StringBuilder columnbind = new StringBuilder();
            for (int k = 1; k < gvHeatkill.Columns.Count; k++)
            {
                columnbind.Append(gvHeatkill.Columns[k].HeaderText + ',');
            }
            columnbind.Append("\r\n");
            for (int i = 0; i < gvHeatkill.Rows.Count; i++)
            {
                for (int k = 1; k < gvHeatkill.Columns.Count; k++)
                {
                    columnbind.Append(gvHeatkill.Rows[i].Cells[k].Text + ',');
                }
                columnbind.Append("\r\n");
            }
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }

        protected void Binder_Dst()
        {
            var valueTocomp = ddlCOlVal_Dst.SelectedItem.ToString();
            var comp = ddlCompare_Dst.SelectedItem.ToString();
            var val = txtCompVal_Dst.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [DstID],[DrugLine],[Drug],[Sensitivity],[Dater],[Initial],[PatientId],[DateResult] FROM [Dsts] WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [DstID],[DrugLine],[Drug],[Sensitivity],[Dater],[Initial],[PatientId],[DateResult] FROM [Dsts] WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
            }

            dataSource_gvDstResult = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds_DstResult"] = dataSource_gvDstResult;


            gvDstResult.DataSourceID = null;
            //gvDstResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvDstResult.DataSource = dataSource_gvDstResult;
            gvDstResult.AllowSorting = true;
            //gvDstResult.AllowPaging = true;
            gvDstResult.DataBind();

            Session["isFilter_gvDstResult"] = true;
        }

        protected void GenerateCSV_Dst(object sender, EventArgs e)
        {
            this.Binder_Dst();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleDSTExport.csv");
            Response.Charset = "";
            Response.ContentType = "application/text";
            gvDstResult.AllowPaging = false;
            gvDstResult.DataBind();
            StringBuilder columnbind = new StringBuilder();
            for (int k = 1; k < gvDstResult.Columns.Count; k++)
            {
                columnbind.Append(gvDstResult.Columns[k].HeaderText + ',');
            }
            columnbind.Append("\r\n");
            for (int i = 0; i < gvDstResult.Rows.Count; i++)
            {
                for (int k = 2; k < gvDstResult.Columns.Count; k++)
                {
                    columnbind.Append(gvDstResult.Rows[i].Cells[k].Text + ',');
                }
                columnbind.Append("\r\n");
            }
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }


    }
}