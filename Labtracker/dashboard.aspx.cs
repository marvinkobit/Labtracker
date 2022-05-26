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
        public string[] FromServer= new string[2];
        public string[] Countries = new string[4];
        public int[] CountriesP = new int[4];
        public string[] Regions = new string[6];
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
                    string sampleColTarget = Convert.ToString(Convert.ToInt32(_db.Samples.Count().ToString()) / 5);
                    lblsamplecoltar.Text = sampleColTarget;  //target of sample collecton 500
                    lblisolatetar.Text = sampleColTarget;
                    progressBar1.Attributes.Add("Style", String.Format("width: {0}%", sampleColTarget));
                    progressBar2.Attributes.Add("Style", String.Format("width: {0}%", sampleColTarget));

                    FromServer[0] = "5";

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

                string sql8 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='oromia'";
                string sql9 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='south nation'";
                string sql10 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='gambella'";
                string sql11= "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='addis ababa'";
                string sql12 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='amhara'";
                string sql13 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='somali'";

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlCommand cmd2 = new SqlCommand(sql2, conn);
                SqlCommand cmd3 = new SqlCommand(sql3, conn);
                SqlCommand cmd4 = new SqlCommand(sql4, conn);
                SqlCommand cmd5 = new SqlCommand(sql5, conn);
                SqlCommand cmd6 = new SqlCommand(sql6, conn);
                SqlCommand cmd7 = new SqlCommand(sql7, conn);

                SqlCommand cmd8 = new SqlCommand(sql8, conn);
                SqlCommand cmd9 = new SqlCommand(sql9, conn);
                SqlCommand cmd10 = new SqlCommand(sql10, conn);
                SqlCommand cmd11= new SqlCommand(sql11, conn);
                SqlCommand cmd12 = new SqlCommand(sql12, conn);
                SqlCommand cmd13 = new SqlCommand(sql13, conn);

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
                Countries[0] = reader3[0].ToString();
                lblethiopiasam.Text = Countries[0];
                conn.Close();

                conn.Open();
                SqlDataReader reader4 = cmd4.ExecuteReader();
                reader4.Read();
                Countries[1] = reader4[0].ToString();
                lblEritreasam.Text = Countries[1];
                conn.Close();


                conn.Open();
                SqlDataReader reader5 = cmd5.ExecuteReader();
                reader5.Read();
                Countries[2] = reader5[0].ToString();
                lblCameroonsam.Text = Countries[2];
                conn.Close();

                conn.Open();
                SqlDataReader reader6 = cmd6.ExecuteReader();
                reader6.Read();
                Countries[3] = reader6[0].ToString();
                lblSudansam.Text = Countries[3];
                conn.Close();

                conn.Open();
                SqlDataReader reader7 = cmd7.ExecuteReader();
                reader7.Read();
                lblNoGrowth.Text = reader7[0].ToString();
                conn.Close();


                conn.Open();
                SqlDataReader reader8 = cmd8.ExecuteReader();
                reader8.Read();
                Regions[0] = reader8[0].ToString();
                conn.Close();


                conn.Open();
                SqlDataReader reader9 = cmd9.ExecuteReader();
                reader9.Read();
                Regions[1] = reader9[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader10 = cmd10.ExecuteReader();
                reader10.Read();
                Regions[2] = reader10[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader11 = cmd11.ExecuteReader();
                reader11.Read();
                Regions[3] = reader11[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader12 = cmd12.ExecuteReader();
                reader12.Read();
                Regions[4] = reader12[0].ToString();
                conn.Close();

                conn.Open();
                SqlDataReader reader13 = cmd13.ExecuteReader();
                reader13.Read();
                Regions[5] = reader13[0].ToString();
                conn.Close();


                //calculate percentages
                int totalsamnum=0;
                for (int i = 0; i < 4; i++)
                {
                    totalsamnum += Convert.ToInt32(Countries[i]);
                }
                for (int i = 0; i < 4; i++)
                {
                    CountriesP[i] = (Convert.ToInt32(Countries[i])*100)/totalsamnum;
                }


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