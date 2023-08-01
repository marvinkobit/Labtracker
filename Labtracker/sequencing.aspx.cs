using Labtracker.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class sequencing : System.Web.UI.Page
    {

        SqlDataSource dataSource = null;
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

            dataSource = new SqlDataSource(ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString, searchQuery);
            Session["ds"] = dataSource;

            gvDnaResult.DataSourceID = null;
            //gvDnaResult.PageIndex = GridViewPageEventArgs.NewPageIndex;
            gvDnaResult.DataSource = dataSource;
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
                gvDnaResult.DataSource = dataSource;
            }
            gvDnaResult.DataBind();
        }
        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }
    }
}