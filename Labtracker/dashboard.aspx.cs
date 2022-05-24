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
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
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
                    lblsamplecoltar.Text = Convert.ToString(Convert.ToInt32(_db.Samples.Count().ToString()) / 5);  //target of sample collecton 500
                    lblisolatetar.Text = Convert.ToString(Convert.ToInt32(_db.Samples.Count().ToString()) / 5);

                }

                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                SqlConnection conn = new SqlConnection(connStr);
                string sql = "SELECT COUNT(LJ_res) FROM Results WHERE LJ_res='Contaminated'";
                string sql7 = "SELECT COUNT(LJ_res) FROM Results WHERE LJ_res='NoGrowth'";
                string sql2 = "SELECT COUNT(CultureSmear_res) FROM Results WHERE CultureSmear_res='Pos'";
                string sql3 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Ethiopia'";
                string sql4 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Eritrea'";
                string sql5 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Cameroon'";
                string sql6 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Sudan'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlCommand cmd2 = new SqlCommand(sql2, conn);
                SqlCommand cmd3 = new SqlCommand(sql3, conn);
                SqlCommand cmd4 = new SqlCommand(sql4, conn);
                SqlCommand cmd5 = new SqlCommand(sql5, conn);
                SqlCommand cmd6 = new SqlCommand(sql6, conn);
                SqlCommand cmd7 = new SqlCommand(sql7, conn);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();               
                reader.Read();
                lblContaminated.Text = reader[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader2 = cmd2.ExecuteReader();
                reader2.Read();
                lblCulturePositive.Text = reader2[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader3 = cmd3.ExecuteReader();
                reader3.Read();
                lblethiopiasam.Text = reader3[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader4 = cmd4.ExecuteReader();
                reader4.Read();
                lblEritreasam.Text = reader4[0].ToString();
                conn.Close();


                conn.Open();
                SqlDataReader reader5 = cmd5.ExecuteReader();
                reader5.Read();
                lblCameroonsam.Text = reader5[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader6 = cmd6.ExecuteReader();
                reader6.Read();
                lblSudansam.Text = reader6[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader7 = cmd7.ExecuteReader();
                reader7.Read();
                lblNoGrowth.Text = reader7[0].ToString();
                conn.Close();



            }
            else
            {
                //lblTotalSample.Text = Session["totalcount"].ToString();
                try { lblTotalSample.Text = Session["Tsample"].ToString(); } catch { }
                

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