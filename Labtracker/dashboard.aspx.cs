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
        public string[] Sites = new string[20];

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
                    string sampleColTarget = Convert.ToString( Math.Round( Convert.ToDecimal(_db.Samples.Count().ToString()) / 9, 1));  //target of sample collecton 900 eth 2000 total
                    lblsamplecoltar.Text = sampleColTarget; 
                    lblisolatetar.Text = sampleColTarget;
                    progressBar1.Attributes.Add("Style", String.Format("width: {0}%", sampleColTarget));
                    progressBar2.Attributes.Add("Style", String.Format("width: {0}%", sampleColTarget));

                    FromServer[0] = "5";

                }

                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string sql = "SELECT COUNT(LJ_res) FROM Results WHERE LJ_res='Contaminated'";
                    string sql7 = "SELECT COUNT(LJ_res) FROM Results WHERE LJ_res='NoGrowth'";
                    string sql2 = "SELECT COUNT(CultureSmear_res) FROM Results WHERE CultureSmear_res='Pos'";

                    string sql3 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Ethiopia'";
                    string sql4 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Eritrea'";
                    string sql5 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Cameroon'";
                    string sql6 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Sudan'";

                    string sql8 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='oromia'";
                    string sql9 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='south nation'";
                    string sql10 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='gambela'";
                    string sql11 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='addis ababa'";
                    string sql12 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='amhara'";
                    string sql13 = "SELECT COUNT(FromRegion) FROM Samples WHERE lower(FromRegion)='somali'";

                    string sql14 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='adama hospital'";
                    string sql15 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='shashamene hospital'";
                    string sql16 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='wolayita sodo teritery hospital'";
                    string sql17 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='gambela general hospital'"; 
                    string sql18 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='yirgalem general hospital'";
                    string sql19 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='arbaminch general hospital'";
                    string sql20 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='gode hospital'";
                    string sql21 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='sodo hospital'";
                    string sql22 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='hawasa cs hospital'";
                    string sql23 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='halaba primary hospital'";
                    string sql24 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='hosaina hospital'";
                    string sql25 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='dilla hospital'";
                    string sql26 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='ambo hospital'";
                    string sql27 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='tulubolo hospital'";
                    string sql28 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='addis alem hospital'";
                    string sql29 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='yekatit 12 hospital'";
                    string sql30 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='addis ketema health center'";
                    string sql31 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='woreda 3 health center'";
                    string sql32 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='mikiland health center'";
                    string sql33 = "SELECT COUNT(HealthFacility) FROM Samples WHERE lower(HealthFacility)='keraniyo health center'";


                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblContaminated.Text = reader[0].ToString();
                        }
                           
                    }


                    using (SqlCommand cmd = new SqlCommand(sql2, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblCulturePositive.Text = reader[0].ToString();
                        }

                    }



                    using (SqlCommand cmd = new SqlCommand(sql3, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Countries[0] = reader[0].ToString();
                            lblethiopiasam.Text = Countries[0];
                        }

                    }



                    using (SqlCommand cmd = new SqlCommand(sql4, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Countries[1] = reader[0].ToString();
                            lblEritreasam.Text = Countries[1];
                        }

                    }


                    using (SqlCommand cmd = new SqlCommand(sql5, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Countries[2] = reader[0].ToString();
                            lblCameroonsam.Text = Countries[2];
                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql6, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Countries[3] = reader[0].ToString();
                            lblSudansam.Text = Countries[3];
                        }

                    }

                 
                  

                    using (SqlCommand cmd = new SqlCommand(sql7, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblNoGrowth.Text = reader[0].ToString();
                        }

                    }

    

                    using (SqlCommand cmd = new SqlCommand(sql8, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[0] = reader[0].ToString();
                        }

                    }



                    using (SqlCommand cmd = new SqlCommand(sql9, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[1] = reader[0].ToString();
                        }

                    }

     

                    using (SqlCommand cmd = new SqlCommand(sql10, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[2] = reader[0].ToString();
                        }

                    }
        

                    using (SqlCommand cmd = new SqlCommand(sql11, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[3] = reader[0].ToString();
                        }

                    }

                 
                    

                    using (SqlCommand cmd = new SqlCommand(sql12, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[4] = reader[0].ToString();
                        }

                    }

                 

                    using (SqlCommand cmd = new SqlCommand(sql13, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[5] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql14, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[0] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql15, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[1] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql16, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[2] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql17, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[3] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql18, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[4] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql19, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[5] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql20, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[6] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql21, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[7] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql22, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[8] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql23, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[9] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql24, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[10] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql25, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[11] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql26, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[12] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql27, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[13] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql28, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[14] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql29, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[15] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql30, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[16] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql31, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[17] = reader[0].ToString();

                        }

                    }
                    using (SqlCommand cmd = new SqlCommand(sql32, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[18] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql33, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Sites[19] = reader[0].ToString();

                        }

                    }

                    //calculate percentages
                    int totalsamnum = 0;
                    for (int i = 0; i < 4; i++)
                    {
                        totalsamnum += Convert.ToInt32(Countries[i]);
                    }
                    for (int i = 0; i < 4; i++)
                    {
                        CountriesP[i] = (Convert.ToInt32(Countries[i]) * 100) / totalsamnum;
                    }
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