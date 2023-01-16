
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using Microsoft.AspNet.Identity;

namespace Labtracker
{
    public partial class sample_receiving : System.Web.UI.Page
    {

        SqlDataSource dataSource= null;
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
                gvSample.DataSourceID = "SqlDataSource1";


                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string sql = "SELECT COUNT(DISTINCT PatientId) FROM Samples";


                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblSamplesRecieved.Text = reader[0].ToString();
                        }

                    }


                }

            }
        }

        protected void gvSample_DataBound(object sender, EventArgs e)
        {
            if (gvSample.Rows.Count > 0)
            {
                string totsample = gvSample.Rows[gvSample.Rows.Count - 1].Cells[1].Text.ToString();
                Session["Tsample"] = totsample;

            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
          
            var valueTocomp = ddlCOlVal.SelectedItem.ToString();
            var comp = ddlCompare.SelectedItem.ToString();
            var val = txtCompVal.Text;
            string searchQuery="";
            if (comp.Equals("equals"))
            {
              searchQuery = String.Format("SELECT [SampleID], [PatientId],[CardNo],[Volume],[Quality],[FromCountry],[FromRegion], [Zone], [Woreda], [HealthFacility], [CollectionDate], [RecivedDate],[LabTech] FROM [Samples] WHERE {0}='{1}'", valueTocomp, val);
            }
            else
            {
               searchQuery = String.Format("SELECT [SampleID], [PatientId],[CardNo],[Volume],[Quality],[FromCountry], [FromRegion], [Zone], [Woreda], [HealthFacility], [CollectionDate], [RecivedDate],[LabTech] FROM [Samples] WHERE {0} LIKE '{1}%'", valueTocomp, val);
            }

            dataSource = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource;

             
            gvSample.DataSourceID = null;
            //gvSample.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvSample.DataSource = dataSource;
            gvSample.AllowSorting = true;
            gvSample.AllowPaging= true;
            gvSample.DataBind();
            
            Session["isFilter"] = true;

            /*if (valueTocomp.Equals("PatientId"))
                {
                //var valueTocompi = Convert.ToInt32( ddlCOlVal.SelectedValue);
                
               // var vali = Convert.ToInt32(txtCompVal.Text);
                if(comp.Equals("equals"))
                {
                    
                }
            }*/
        }

        protected void ExportToPDF(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=SamplesRecievedRecent.pdf");
            Response.Charset = "";
            Response.ContentType = "application/pdf";

            //To Export all pages.
            //gvSample.AllowPaging = false;
            //this.BindGrid();

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    gvSample.RenderControl(hw);
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
                searchQuery = String.Format("SELECT [SampleID], [PatientId],[CardNo],[Volume],[Quality],[FromCountry],[FromRegion], [Zone], [Woreda], [HealthFacility], [CollectionDate], [RecivedDate],[LabTech] FROM [Samples] WHERE {0}='{1}'", valueTocomp, val);
            }
            else
            {
                searchQuery = String.Format("SELECT [SampleID], [PatientId],[CardNo],[Volume],[Quality],[FromCountry], [FromRegion], [Zone], [Woreda], [HealthFacility], [CollectionDate], [RecivedDate],[LabTech] FROM [Samples] WHERE {0} LIKE '{1}%'", valueTocomp, val);
            }
            dataSource = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource;
            gvSample.DataSourceID = null;
            //gvSample.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvSample.DataSource = dataSource;
            gvSample.AllowSorting = true;
            gvSample.DataBind();
            Session["isFilter"] = true;
            //end
        }

        protected void GeneratePDF(object sender, EventArgs e)
        {


            //To Export all pages.                   
             gvSample.AllowPaging = false;
             this.Binder();
           

            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                 
                   

                    gvSample.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();

                    //Response.Clear();
                    //Response.Buffer = true;
                    Response.AddHeader("content-disposition", "attachment;filename=SamplesRecievedRecent.pdf");
                    //Response.Charset = "";
                    Response.ContentType = "application/pdf";

                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }

        protected void gvSample_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSample.AllowSorting = true;
            gvSample.AllowPaging = true;
            gvSample.PageIndex = e.NewPageIndex;
            isFilter = (bool)Session["isFilter"];
            if (isFilter)
            {
                gvSample.DataSourceID = null;
                gvSample.DataSource = (SqlDataSource) Session["ds"];
            }           
            gvSample.DataBind();
        }

        protected void gvSample_Sorting(object sender, GridViewSortEventArgs e)
        {
            isFilter = (bool)Session["isFilter"];
            if(isFilter)
            {
                gvSample.DataSourceID = null;
                var data = (SqlDataSource)Session["ds"];
                data.SortParameterName = e.SortExpression;
                gvSample.DataSource = dataSource;
            }           
            gvSample.DataBind();
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
    }
}