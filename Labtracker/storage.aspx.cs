using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
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
    public partial class storage : System.Web.UI.Page
    {
        SqlDataSource dataSource_gvStorage = null;
        bool isFilter = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }


            if (!Page.IsPostBack)
            {

                Session["isFilter_gvStorage"] = false;
                gvStorage.DataSourceID = "SqlDataSource1";


                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string sql = "SELECT COUNT(DISTINCT PatientId) FROM Stores";
                    string sql2 = "SELECT COUNT(PatientId) FROM Stores";

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblIsolatesDistinct.Text = reader[0].ToString();
                        }

                    }

                    using (SqlCommand cmd2 = new SqlCommand(sql2, conn))
                    {
                        using (SqlDataReader reader = cmd2.ExecuteReader())
                        {
                            reader.Read();
                            lblIsolatesAll.Text = reader[0].ToString();
                        }

                    }

                }
            }

        }
        protected void gvStorage_DataBound(object sender, EventArgs e)
        {
            if (gvStorage.Rows.Count > 0)
            {
                //string totsample = gvStorage.Rows[gvStorage.Rows.Count - 1].Cells[1].Text.ToString();
                //Session["Tsample"] = totsample;

            }
        }
        protected void gvDstResult_DataBound(object sender, EventArgs e)
        {
            if (gvStorage.Rows.Count > 0)
            {
                //string totsample2 = gvDstResult.Rows[gvDstResult.Rows.Count - 1].Cells[1].Text.ToString();
                //Session["Tsample2"] = totsample2;

            }
        }

       
        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {

            var valueTocomp = ddlCOlVal.SelectedItem.ToString();
            var comp = ddlCompare.SelectedItem.ToString();
            var val = txtCompVal.Text;
            string searchQuery = "";
            if (comp.Equals("equals"))
            {
                searchQuery = String.Format("SELECT [StoreId],[PatientId],category,Mediatype,Matrix,Freezer,Drawer,Rack,Shelf,Box,Matrix,storeDate FROM Stores WHERE {0}='{1}' ", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [StoreId],[PatientId],category,Mediatype,Matrix,Freezer,Drawer,Rack,Shelf,Box,Matrix,storeDate FROM Stores WHERE {0} LIKE '{1}%'", valueTocomp, val);
            }

            dataSource_gvStorage = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource_gvStorage;


            gvStorage.DataSourceID = null;
            //gvStorage.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvStorage.DataSource = dataSource_gvStorage;
            gvStorage.AllowSorting = true;
            gvStorage.AllowPaging = true;
            gvStorage.DataBind();

            Session["isFilter_gvStorage"] = true;

            /*if (valueTocomp.Equals("PatientId"))
                {
                //var valueTocompi = Convert.ToInt32( ddlCOlVal.SelectedValue);
                
               // var vali = Convert.ToInt32(txtCompVal.Text);
                if(comp.Equals("equals"))
                {
                    
                }
            }*/
        }


        protected void gvStorage_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStorage.AllowSorting = true;
            gvStorage.AllowPaging = true;
            gvStorage.PageIndex = e.NewPageIndex;
            isFilter = (bool)Session["isFilter_gvStorage"];
            if (isFilter)
            {
                gvStorage.DataSourceID = null;
                gvStorage.DataSource = (SqlDataSource)Session["ds"];
            }

            gvStorage.DataBind();
        }

        protected void gvStorage_Sorting(object sender, GridViewSortEventArgs e)
        {
            isFilter = (bool)Session["isFilter_gvStorage"];
            if (isFilter)
            {
                gvStorage.DataSourceID = null;
                var data = (SqlDataSource)Session["ds"];
                data.SortParameterName = e.SortExpression;
                gvStorage.DataSource = dataSource_gvStorage;
            }
            gvStorage.DataBind();
        }


        protected void ExportToPDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            //gvStorage.AllowPaging = false;
            //this.BindGrid();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    gvStorage.RenderControl(hw);
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
                searchQuery = String.Format("SELECT [StoreId],[PatientId],category,Mediatype,Matrix,Freezer,Drawer,Rack,Shelf,Box,Matrix,storeDate FROM Stores WHERE {0}='{1}' ORDER BY [PatientId] ASC", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [StoreId],[PatientId],category,Mediatype,Matrix,Freezer,Drawer,Rack,Shelf,Box,Matrix,storeDate FROM Stores WHERE {0} LIKE '{1}%' ORDER BY [PatientId] ASC", valueTocomp, val);
            }

            dataSource_gvStorage = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource_gvStorage;


            gvStorage.DataSourceID = null;
            //gvStorage.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvStorage.DataSource = dataSource_gvStorage;
            gvStorage.AllowSorting = true;
            //sgvStorage.AllowPaging = true;
            gvStorage.DataBind();

            Session["isFilter_gvStorage"] = true;
        }

        protected void GeneratePDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SampleResultRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            gvStorage.AllowPaging = false;
            this.Binder();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    gvStorage.RenderControl(hw);
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
            gvStorage.AllowPaging = false;
            gvStorage.DataBind();
            StringBuilder columnbind = new StringBuilder();
            for (int k = 0; k < gvStorage.Columns.Count; k++)
            {
                columnbind.Append(gvStorage.Columns[k].HeaderText + ',');
            }
            columnbind.Append("\r\n");
            for (int i = 0; i < gvStorage.Rows.Count; i++)
            {
                for (int k = 0; k < gvStorage.Columns.Count; k++)
                {
                    columnbind.Append(gvStorage.Rows[i].Cells[k].Text + ',');
                }
                columnbind.Append("\r\n");
            }
            Response.Output.Write(columnbind.ToString());
            Response.Flush();
            Response.End();
        }



    }
}