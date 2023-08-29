using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using Labtracker.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class sequencing : System.Web.UI.Page
    {

        SqlDataSource dataSource_gvDnaResult = null;
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

                Session["isFilter"] = false;
                gvDnaResult.DataSourceID = "SqlDataSource1";
                using (SampleContext _db= new SampleContext())
                {
                    lbldnasall.Text = _db.Dnaextracts.Count().ToString();
                }

                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string sql = "SELECT COUNT(DISTINCT PatientId) FROM Dnaextracts";
                    string sql2 = "SELECT COUNT(DISTINCT PatientId) FROM LibraryPreps";
                   


                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lbldnaprocessed.Text = reader[0].ToString();
                        }

                    }

                    using (SqlCommand cmd2 = new SqlCommand(sql2, conn))
                    {
                        using (SqlDataReader reader = cmd2.ExecuteReader())
                        {
                            reader.Read();
                            lblLibraryprep.Text = reader[0].ToString();
                        }

                    }


                }

            }

        }
        protected void gvDnaResult_DataBound(object sender, EventArgs e)
        {
            if (gvDnaResult.Rows.Count > 0)
            {
                string totsample = gvDnaResult.Rows[gvDnaResult.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }
        protected void gvDnaResultResult_DataBound(object sender, EventArgs e)
        {
            if (gvDnaResult.Rows.Count > 0)
            {
                //string totsample2 = gvDstResult.Rows[gvDstResult.Rows.Count - 1].Cells[1].Text.ToString();
                //Session["Tsample2"] = totsample2;

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
                searchQuery = String.Format("SELECT [DnaextractionId],[PatientId],[NDConc],[Purity],[ExtractDate],[Remark],[Initial],[QubitConc],[TubeLabel],[GoodQQ],[SampleType],[AssayReagent] FROM [Labtracker].[dbo].[Dnaextracts] WHERE {0}='{1}'", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [DnaextractionId],[PatientId],[NDConc],[Purity],[ExtractDate],[Remark],[Initial],[QubitConc],[TubeLabel],[GoodQQ],[SampleType],[AssayReagent] FROM[Labtracker].[dbo].[Dnaextracts] WHERE {0} LIKE '{1}%'", valueTocomp, val);
            }

            dataSource_gvDnaResult = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource_gvDnaResult;

            gvDnaResult.DataSourceID = null;
            //gvDnaResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvDnaResult.DataSource = dataSource_gvDnaResult;
            gvDnaResult.AllowSorting = true;
            gvDnaResult.AllowPaging = true;
            gvDnaResult.DataBind();
            Session["isFilter"] = true;
        }

        protected void gvDnaResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDnaResult.AllowSorting = true;
            gvDnaResult.AllowPaging = true;
            gvDnaResult.PageIndex = e.NewPageIndex;
            isFilter = (bool)Session["isFilter"];
            if (isFilter)
            {
                gvDnaResult.DataSourceID = null;
                gvDnaResult.DataSource = (SqlDataSource)Session["ds"];
            }
            gvDnaResult.DataBind();
        }

        protected void gvDnaResult_Sorting(object sender, GridViewSortEventArgs e)
        {
            isFilter = (bool)Session["isFilter"];
            if (isFilter)
            {
                gvDnaResult.DataSourceID = null;
                var data = (SqlDataSource)Session["ds"];
                data.SortParameterName = e.SortExpression;
                gvDnaResult.DataSource = dataSource_gvDnaResult;
            }
            gvDnaResult.DataBind();
        }


        protected void ExportToPDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            //gvDnaResult.AllowPaging = false;
            //this.BindGrid();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    gvDnaResult.RenderControl(hw);
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


        protected void Binder()
        {
            var valueTocomp = ddlCOlVal.SelectedItem.ToString();
            var comp = ddlCompare.SelectedItem.ToString();
            var val = txtCompVal.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [DnaextractionId],[PatientId],[NDConc],[Purity],[ExtractDate],[Remark],[Initial],[QubitConc],[TubeLabel],[GoodQQ],[SampleType],[AssayReagent] FROM [Labtracker].[dbo].[Dnaextracts] WHERE {0}='{1}'", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [DnaextractionId],[PatientId],[NDConc],[Purity],[ExtractDate],[Remark],[Initial],[QubitConc],[TubeLabel],[GoodQQ],[SampleType],[AssayReagent] FROM[Labtracker].[dbo].[Dnaextracts] WHERE {0} LIKE '{1}%'", valueTocomp, val);
            }

            dataSource_gvDnaResult = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource_gvDnaResult;


            gvDnaResult.DataSourceID = null;
            //gvDnaResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvDnaResult.DataSource = dataSource_gvDnaResult;
            gvDnaResult.AllowSorting = true;
            //sgvDnaResult.AllowPaging = true;
            gvDnaResult.DataBind();

            Session["isFilter_gvDnaResult"] = true;
        }

        protected void GeneratePDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            gvDnaResult.AllowPaging = false;
            this.Binder();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    gvDnaResult.RenderControl(hw);
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
            Response.Charset = "UTF-8";
            Response.ContentType = "application/text";
            gvDnaResult.AllowPaging = false;
            gvDnaResult.DataBind();
            StringBuilder columnbind = new StringBuilder();
            for (int k = 1; k < gvDnaResult.Columns.Count; k++)
            {
                columnbind.Append(gvDnaResult.Columns[k].HeaderText + ',');
            }
            columnbind.Append("\r\n");
            for (int i = 0; i < gvDnaResult.Rows.Count; i++)
            {
                for (int k = 2; k < gvDnaResult.Columns.Count; k++)
                {
                    columnbind.Append(gvDnaResult.Rows[i].Cells[k].Text.Replace("&nbsp;", "") + ',');
                }
                columnbind.Append("\r\n");
            }
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }
    }
}