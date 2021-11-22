using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class dashboard : System.Web.UI.Page
    {
        //string strConnString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
       // string str;
       // SqlCommand com;
        protected void Page_Load(object sender, EventArgs e)
        {
            /* SqlConnection con = new SqlConnection(strConnString);
             con.Open();
             str = "select SampleID from Samples";
             com = new SqlCommand(str, con);
             SqlDataReader reader = com.ExecuteReader();

             reader.Read();
             lblTotalSample.Text = reader["SampleID"].ToString();
             reader.Close();
             con.Close();*/

            //BindSample(GetSample());
            // Sample tsam = new Sample();

            //lblTotalSample.Text = tsam.SampleID.ToString();



            if (!Page.IsPostBack)
            {
                /* Sample s = new Sample();
                 lblTotalSample.Text=s.SampleID.ToString();*/

                using (SampleContext _db = new SampleContext())
                {
                    lblTotalSample.Text = _db.Samples.Count().ToString();
                }
            }
            else
            {
                //lblTotalSample.Text = Session["totalcount"].ToString();
                lblTotalSample.Text = Session["Tsample"].ToString();

            }

            if (HttpContext.Current.User.IsInRole("canAdmin"))
            { 
          
                //settinglink.Visible = true;
            }


        }

       /* protected Sample GetSample()
        {
            Sample model = new Sample();
            IValueProvider provider = new FormValueProvider(ModelBindingExecutionContext);
            if (TryUpdateModel<Sample>(model, provider))
            {
                return model;
            }
            else
            {
                throw new FormatException("Could not model bind");
            }
        }
        protected void BindSample(Sample tsample)
        {
            lblTotalSample.Text = tsample.SampleID.ToString();
            
        }*/
       
    }
}