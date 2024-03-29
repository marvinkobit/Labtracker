﻿using Labtracker.Models;
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
        public string[] Regions = new string[10];
        public string[] Sites = new string[20];

        public string[] Sites_PID = new string[1000];
        public string[] Sites_Name = new string[1000];
        public string[] Sites_Samples = new string[1000];
        public string[] Sites_latit = new string[1000];
        public string[] Sites_long = new string[1000];
        public int SitesNum=0;
        public string SequencedNum;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
            
 
            if (!Page.IsPostBack)
            {
                /* Sample s = new Sample();
                 lblTotalSample.Text=s.SampleID.ToString();*/

                using (SampleContext _db = new SampleContext())
                {
                    lblTotalSample.Text = _db.Samples.Count().ToString();
                    lblIsolateStored.Text = _db.Stores.Count().ToString();
                    lblHeatkill.Text = _db.HeatKills.Count().ToString();
                    
                    string sampleColTarget = Convert.ToString( Math.Round( Convert.ToDecimal(_db.Samples.Count().ToString()) / 10, 1));  //target of sample collecton 1000 eth
                    string sampleResultTarget = Convert.ToString(Math.Round(Convert.ToDecimal(_db.Results.Count().ToString()) / 10, 1));
                    lblsamplecoltar.Text = sampleColTarget; 
                    lblisolatetar.Text = sampleResultTarget;
                    progressBar1.Attributes.Add("Style", String.Format("width: {0}%", sampleColTarget));
                    progressBar2.Attributes.Add("Style", String.Format("width: {0}%", sampleColTarget));

                    FromServer[0] = "5";

                }

                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string sqlsite_PIDs = "SELECT SitePatientId FROM Sites";
                    using (SqlCommand cmd = new SqlCommand(sqlsite_PIDs, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            List<string> values = new List<string>();
                            while (reader.Read())
                            {
                                values.Add(reader.GetString(0));
                            }
                            reader.Close();
                            Sites_PID = values.ToArray();
                            SitesNum = Sites_PID.Length;
                        }

                    }

                    string sqlsite_Name = "SELECT HealthFacility FROM Sites";
                    using (SqlCommand cmd = new SqlCommand(sqlsite_Name, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            List<string> values = new List<string>();
                            while (reader.Read())
                            {
                                values.Add(reader.IsDBNull(0) ? "null" : reader.GetString(0));
                            }
                            reader.Close();
                            Sites_Name = values.ToArray();
                        }

                    }

                    string sqlsite_latit = "SELECT LocationLatitude FROM Sites";
                    using (SqlCommand cmd = new SqlCommand(sqlsite_latit, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            List<string> values = new List<string>();
                            while (reader.Read())
                            {
                                values.Add(reader.IsDBNull(0)? "null" : reader.GetString(0));
                            }
                            reader.Close();
                            Sites_latit = values.ToArray();
                        }

                    }

                    string sqlsite_long = "SELECT LocationLongitude FROM Sites";
                    using (SqlCommand cmd = new SqlCommand(sqlsite_long, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            List<string> values = new List<string>();
                            while (reader.Read())
                            {
                                values.Add(reader.IsDBNull(0) ? "null" : reader.GetString(0));
                            }
                            reader.Close();
                            Sites_long = values.ToArray();
                        }

                    }

                    for (int i=0; i < Sites_PID.Length; i++)
                    {
                        string pid = Sites_PID[i];
                        string sqlsite_samples = String.Format("SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE '{0}%'", pid);
                        using (SqlCommand cmd = new SqlCommand(sqlsite_samples, conn))
                        {
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                reader.Read();
                                Sites_Samples[i] = reader[0].ToString();
                            }

                        }
                    }




                    string sql = "SELECT COUNT(DISTINCT PatientId) FROM Dsts";
                    string sql7 = "SELECT COUNT(LJ_res) FROM Results WHERE LJ_res='Neg'";
                    string sql2 = "SELECT COUNT(DISTINCT PatientId) FROM Results";

                    string sql3 = "SELECT COUNT(FromCountry) FROM Samples WHERE FromCountry='Ethiopia'";
                    string sql4 = "SELECT COUNT(DISTINCT PatientId) FROM Stores WHERE PatientId LIKE 'ER%'";
                    string sql5 = "SELECT COUNT(DISTINCT PatientId) FROM Stores WHERE PatientId LIKE 'CM%'";
                    string sql6 = "SELECT COUNT(DISTINCT PatientId) FROM Stores WHERE PatientId LIKE 'SD%'";

                    string sql8 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-OR%'";
                    string sql9 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN%'";
                    string sql10 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-GA%'";
                    string sql11 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AA%'";
                    string sql12 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AM%'";
                    string sql13 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SO%'";
                    string sql34 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-BG%'";
                    string sql35 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-TG%'";
                    string sql36 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AF%'";
                    string sql37 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-HR%'";



                    string sql14 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-OR-ES-AD-AH%'";
                    string sql15 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-OR-AR-SH-SH%'";
                    string sql16 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-WO-SO-SH%'";
                    string sql17 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-GA-AN-GA-GH%'"; 
                    string sql18 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-SI-YE-YH%'";
                    string sql19 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-GG-AM-AH%'";
                    string sql20 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SO-GO-GH%'";
                    string sql21 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'sodo hospital'";
                    string sql22 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-SI-HA-HH%'";
                    string sql23 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-HA-HA-HH%'";
                    string sql24 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-HA-HO-HH%'";
                    string sql25 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-SN-GE-DL-DH%'";
                    string sql26 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-OR-WS-AM-AH%'";
                    string sql27 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-OR-SWS-BE-TBH%'";
                    string sql28 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AM-BD-BD-AAH%'";
                    string sql29 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AA-YE-Y12H%'";
                    string sql30 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AA-AK-AK-HC%'";
                    string sql31 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AA-KK-W3-HC%'";
                    string sql32 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AA-KK-MK-HC%'";
                    string sql33 = "SELECT COUNT(PatientId) FROM Samples WHERE PatientId LIKE 'ET-AA-KK-KE-HC'";



                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblDst.Text = reader[0].ToString();
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

                    using (SqlCommand cmd = new SqlCommand(sql34, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[6] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql35, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[7] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql36, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[8] = reader[0].ToString();

                        }

                    }

                    using (SqlCommand cmd = new SqlCommand(sql37, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            Regions[9] = reader[0].ToString();

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
                        if (totalsamnum == 0)
                        {
                            CountriesP[i] = 0;
                        }
                        else
                        {
                            CountriesP[i] = (Convert.ToInt32(Countries[i]) * 100) / totalsamnum;
                        }
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