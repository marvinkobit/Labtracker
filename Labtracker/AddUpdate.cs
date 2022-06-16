using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Labtracker.Models;

namespace Labtracker
{
    public class AddUpdates
    {

        //public bool AddUpdate(int ProId,string smearRes, DateTime smeardate,)



        /*public bool AddUpdate(int ProId, DateTime rd9date, DateTime smeardate, DateTime ljdate, DateTime mijtdate,
                              DateTime dat1date, DateTime dat2date, string SaId, int ResisId, string stmr, string inhr,
                              string rifr, string embr, string pzar, int ResuId, string rd9res, string smrres,
                              string ljres, string mijtres, string res1res, string res2res, int StatId,
                              string namestat, string descstat)
        {
            //var tbgsamupdates = new Sample();
            var tbgresupdates = new Result();
            var tbgprocessupdates = new Process();
            var tbgstatusupdates = new Status();
            var tbgresistupdates = new Resistance();

            //tbgsamupdates.SampleID = Convert.ToInt32(SaId);

            tbgresupdates.ResultID = ResuId;
            tbgresupdates.LJ_P_res = ljres;
            tbgresupdates.MIJT_res = mijtres;
            tbgresupdates.RD9_res = rd9res;
            tbgresupdates.res1 = res1res;
            tbgresupdates.res2 = res2res;

            tbgprocessupdates.ProcessID = ProId;
            tbgprocessupdates.RD9_date = Convert.ToDateTime(rd9date);
            tbgprocessupdates.Smear_date = Convert.ToDateTime(smeardate);
            tbgprocessupdates.LJ_date = Convert.ToDateTime(ljdate);
            tbgprocessupdates.dat1 = Convert.ToDateTime(dat1date);
            tbgprocessupdates.dat2 = Convert.ToDateTime(dat2date);

            tbgresistupdates.ResistanceID = ResisId;
            tbgresistupdates.stm = stmr;
            tbgresistupdates.inh = inhr;
            tbgresistupdates.rif = rifr;
            tbgresistupdates.pza = pzar;
            tbgresistupdates.emb = embr;

            tbgstatusupdates.StatusID = StatId;
            tbgstatusupdates.StatusName = namestat;
            tbgstatusupdates.Description = descstat;

          

            using (SampleContext _db = new SampleContext())
            {
                // Add sample to DB.
                _db.Results.Add(tbgresupdates);
                _db.Processes.Add(tbgprocessupdates);
                _db.Resistances.Add(tbgresistupdates);
                _db.Statuses.Add(tbgstatusupdates);
                _db.SaveChanges();
            }
            // Success.
            return true;
        }
*/
        //ResultsUpdate (string,string,string,string,DateTime,string)
        public bool AddUpdate(string SaId, string ResuId,
                              string resultant,string restype, DateTime? dateProcess,string labinitial)
        {
            
            var tbgresupdates = new Result();
            var tbgprocessupdates = new Process();
            

            /*   var tbgstatusupdates = new Status();
               var tbgresistupdates = new Resistance();*/
            tbgprocessupdates.PatientId = SaId;
            tbgresupdates.PatientId = SaId;
            tbgresupdates.Labinitial = labinitial;
            string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;

            //tbgresupdates.ResultID = Convert.ToInt32(ResuId);

            //tbgprocessupdates.ProcessID = Convert.ToInt32(SaId);


            switch (restype)
            {
                case "Primary Smear":

                    SqlConnection SQLConn = new SqlConnection(connStr);
                    SqlCommand command = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET Smear_res=@Smear_result,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn);
                    command.Parameters.Add("@Smear_result", SqlDbType.NVarChar).Value = resultant;
                    command.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn.Open();
                    command.ExecuteNonQuery();
                    SQLConn.Close();

                    
                    SQLConn.Open();
                    SqlCommand commandd = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET Smear_date=@Smear_date,PatientId=@patient WHERE PatientId=@patient", SQLConn);
                    commandd.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd.Parameters.Add("@Smear_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;                      
                    commandd.ExecuteNonQuery();
                    SQLConn.Close();                  
                    //tbgresupdates.Smear_res = resultant;
                    //tbgprocessupdates.Smear_date = Convert.ToDateTime(dateProcess);
                    break;
                case "LJ-G":
                    SqlConnection SQLConn2 = new SqlConnection(connStr);
                    SqlCommand command2 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET LJ_P_res=@LJ_P_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn2);
                    command2.Parameters.Add("@LJ_P_res", SqlDbType.NVarChar).Value = resultant;
                    command2.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command2.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn2.Open();
                    command2.ExecuteNonQuery();
                    SQLConn2.Close();

                    SQLConn2.Open();
                    SqlCommand commandd2 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET LJ_date=@LJ_date,PatientId=@patient WHERE PatientId=@patient", SQLConn2);
                    commandd2.Parameters.Add("@LJ_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd2.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd2.ExecuteNonQuery();
                    SQLConn2.Close();

                    //tbgresupdates.LJ_P_res = resultant;
                    //tbgprocessupdates.LJ_date = Convert.ToDateTime(dateProcess);
                    break;
                case "LJ-P":
                    SqlConnection SQLConn10 = new SqlConnection(connStr);
                    SqlCommand command10 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET LJ_P_res=@LJ_P_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn10);
                    command10.Parameters.Add("@LJ_P_res", SqlDbType.NVarChar).Value = resultant;
                    command10.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command10.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn10.Open();
                    command10.ExecuteNonQuery();
                    SQLConn10.Close();

                    SQLConn10.Open();
                    SqlCommand commandd10 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET LJ_P_date=@LJ_P_date,PatientId=@patient WHERE PatientId=@patient", SQLConn10);
                    commandd10.Parameters.Add("@LJ_P_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd10.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd10.ExecuteNonQuery();
                    SQLConn10.Close();

                    //tbgresupdates.LJ_P_res = resultant;
                    //tbgprocessupdates.LJ_date = Convert.ToDateTime(dateProcess);
                    break;
                case "MGIT":
                    SqlConnection SQLConn3 = new SqlConnection(connStr);
                    SqlCommand command3 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET MIJT_res=@MIJT_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn3);
                    command3.Parameters.Add("@MIJT_res", SqlDbType.NVarChar).Value = resultant;
                    command3.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command3.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn3.Open();
                    command3.ExecuteNonQuery();
                    SQLConn3.Close();

                    SQLConn3.Open();
                    SqlCommand commandd3 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET MIJT_date=@MIJT_date,PatientId=@patient WHERE PatientId=@patient", SQLConn3);
                    commandd3.Parameters.Add("@MIJT_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd3.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd3.ExecuteNonQuery();
                    SQLConn3.Close();
                    //tbgresupdates.MIJT_res = resultant;
                    //tbgprocessupdates.MIJT_date = Convert.ToDateTime(dateProcess);
                    break;
                case "RD9":
                    SqlConnection SQLConn4 = new SqlConnection(connStr);
                    SqlCommand command4 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET RD9_res=@RD9_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn4);
                    command4.Parameters.Add("@RD9_res", SqlDbType.NVarChar).Value = resultant;
                    command4.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command4.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn4.Open();
                    command4.ExecuteNonQuery();
                    SQLConn4.Close();

                    SQLConn4.Open();
                    SqlCommand commandd4 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET RD9_date=@RD9_date,PatientId=@patient WHERE PatientId=@patient", SQLConn4);
                    commandd4.Parameters.Add("@RD9_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd4.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd4.ExecuteNonQuery();
                    SQLConn4.Close();
                    //tbgresupdates.RD9_res = resultant;
                    //tbgprocessupdates.RD9_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Heat Killed":
                    SqlConnection SQLConn5 = new SqlConnection(connStr);
                    SqlCommand command5 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET HeatKilled_res=@HeatKilled_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn5);
                    command5.Parameters.Add("@HeatKilled_res", SqlDbType.NVarChar).Value = resultant;
                    command5.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command5.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn5.Open();
                    command5.ExecuteNonQuery();
                    SQLConn5.Close();

                    SQLConn5.Open();
                    SqlCommand commandd5 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET HeatKill_date=@HeatKill_date,PatientId=@patient WHERE PatientId=@patient", SQLConn5);
                    commandd5.Parameters.Add("@HeatKill_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd5.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd5.ExecuteNonQuery();
                    SQLConn5.Close();
                    //tbgresupdates.HeatKilled_res = resultant;
                   // tbgprocessupdates.HeatKill_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Culture Smear":
                    SqlConnection SQLConn6 = new SqlConnection(connStr);
                    SqlCommand command6 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET CultureSmear_res=@CultureSmear_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn6);
                    command6.Parameters.Add("@CultureSmear_res", SqlDbType.NVarChar).Value = resultant;
                    command6.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command6.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn6.Open();
                    command6.ExecuteNonQuery();
                    SQLConn6.Close();

                    SQLConn6.Open();
                    SqlCommand commandd6 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET CultureSmear_date=@CultureSmear_date,PatientId=@patient WHERE PatientId=@patient", SQLConn6);
                    commandd6.Parameters.Add("@CultureSmear_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd6.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd6.ExecuteNonQuery();
                    SQLConn6.Close();
                    //tbgresupdates.CultureSmear_res = resultant;
                    //tbgprocessupdates.CultureSmear_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Spoligo":
                    SqlConnection SQLConn7 = new SqlConnection(connStr);
                    SqlCommand command7 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET Spoligo_res=@Spoligo_res,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn7);
                    command7.Parameters.Add("@Spoligo_res", SqlDbType.NVarChar).Value = resultant;
                    command7.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command7.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn7.Open();
                    command7.ExecuteNonQuery();
                    SQLConn7.Close();

                    SQLConn7.Open();
                    SqlCommand commandd7 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET Spoligo_date=@Spoligo_date,PatientId=@patient WHERE PatientId=@patient", SQLConn7);
                    commandd7.Parameters.Add("@Spoligo_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd7.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd7.ExecuteNonQuery();
                    SQLConn7.Close();
                    //tbgresupdates.Spoligo_res = resultant;
                    //tbgprocessupdates.Spoligo_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Final Culture Result":
                    SqlConnection SQLConn8 = new SqlConnection(connStr);
                    SqlCommand command8 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET FinalCultureResult=@FinalCultureResult,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn8);
                    command8.Parameters.Add("@FinalCultureResult", SqlDbType.NVarChar).Value = resultant;
                    command8.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command8.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn8.Open();
                    command8.ExecuteNonQuery();
                    SQLConn8.Close();

                    SQLConn8.Open();
                    SqlCommand commandd8 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET FinalCultureResult_date=@FinalCultureResult_date,PatientId=@patient WHERE PatientId=@patient", SQLConn8);
                    commandd8.Parameters.Add("@FinalCultureResult_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value;
                    commandd8.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd8.ExecuteNonQuery();
                    SQLConn8.Close();
                    break;
                case "BHI":
                    SqlConnection SQLConn9 = new SqlConnection(connStr);
                    SqlCommand command9 = new SqlCommand("INSERT INTO Results (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Results WHERE PatientId =@patient) UPDATE Results SET BHI=@BHI,PatientId=@patient,Labinitial=@labinitial WHERE PatientId=@patient", SQLConn9);
                    command9.Parameters.Add("@BHI", SqlDbType.NVarChar).Value = resultant;
                    command9.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    command9.Parameters.Add("@labinitial", SqlDbType.NVarChar).Value = labinitial;
                    SQLConn9.Open();
                    command9.ExecuteNonQuery();
                    SQLConn9.Close();

                    SQLConn9.Open();
                    SqlCommand commandd9 = new SqlCommand("INSERT INTO Processes (PatientId) SELECT PatientId=@patient WHERE NOT EXISTS (SELECT PatientId FROM Processes WHERE PatientId =@patient) UPDATE Processes SET BHI_date=@BHI_date,PatientId=@patient WHERE PatientId=@patient", SQLConn9);
                    commandd9.Parameters.Add("@BHI_date", SqlDbType.DateTime).Value = (object)dateProcess ?? DBNull.Value; 
                    commandd9.Parameters.Add("@patient", SqlDbType.NVarChar).Value = SaId;
                    commandd9.ExecuteNonQuery();
                    SQLConn9.Close();
                    break;
                default:
                    break;
            }
           

            using (SampleContext _db = new SampleContext())
            {

                //try
                //{
                    // Add sample to DB.
                    //_db.Results.Add(tbgresupdates);
                    //_db.Processes.Add(tbgprocessupdates);

                    /*      _db.Resistances.Add(tbgresistupdates);
                          _db.Statuses.Add(tbgstatusupdates);*/
                   // _db.SaveChanges();
                //}
                //catch (Exception e)
                //{
                //    return false;
                //}
               
            }
            // Success.
            return true;
        }

        


        //Overload for DST (string, string, string, string, string, DateTime)
        public bool AddUpdate(string SaId, string sensetive , string drug, string drugline, string labinitial, DateTime? dater)
        {
           
            var tbgdstupdates = new Dst();

            tbgdstupdates.PatientId = SaId;

            //tbgdstupdates.DstID = Convert.ToInt32(ResuId);
            tbgdstupdates.Initial = labinitial;
            tbgdstupdates.DrugLine = drugline;
            tbgdstupdates.Drug = drug;
            tbgdstupdates.Sensitivity = sensetive;
            tbgdstupdates.Dater = Convert.ToDateTime(dater);
              

            using (SampleContext _db = new SampleContext())
            {

                try
                {
                    // Add sample to DB.
                   
                    _db.Dsts.Add(tbgdstupdates);
               
                    _db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }

            }
            // Success.
            return true;
        }


        //Overload for GrowthDetection (string, string, string ,string ,string, string, string, string )
        public bool AddUpdate(string dater,string repDate, string SaId, string week, string primarymedia, string input, string labinitial, string remark)
        {

            var tbggrowthupdates = new Growth();

            tbggrowthupdates.PatientId = SaId;

            //tbgdstupdates.DstID = Convert.ToInt32(ResuId);
            tbggrowthupdates.Initial = labinitial;
            tbggrowthupdates.Week = week;
            tbggrowthupdates.dat1 = primarymedia;
            tbggrowthupdates.dat2 = input;
            tbggrowthupdates.Dater = string.IsNullOrEmpty(dater)? (DateTime?)null : Convert.ToDateTime(dater);
            tbggrowthupdates.ReportDate = string.IsNullOrEmpty(repDate) ? (DateTime?)null : Convert.ToDateTime(repDate);
            tbggrowthupdates.Remark = remark;


            using (SampleContext _db = new SampleContext())
            {

                try
                {
                    // Add sample to DB.
                    _db.Growths.Add(tbggrowthupdates);

                    _db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }

            }
            // Success.
            return true;
        }


        //Overload for DnaExtraction
        public bool AddUpdater(DateTime? dater, string PaId, string purity, string ndConc, string qubConc,string remark , string labInitial)
        {
            var tbgdnaextractupdates = new Dnaextract();

            tbgdnaextractupdates.PatientId = PaId;
            //tbgdstupdates.DstID = Convert.ToInt32(ResuId);
            tbgdnaextractupdates.Initial = labInitial;
            tbgdnaextractupdates.Purity = Convert.ToDecimal(purity);
            tbgdnaextractupdates.NDConc = Convert.ToDecimal(ndConc);
            tbgdnaextractupdates.QubitConc = Convert.ToDecimal(qubConc);


            tbgdnaextractupdates.ExtractDate = Convert.ToDateTime(dater);
            tbgdnaextractupdates.Remark = remark;


            using (SampleContext _db = new SampleContext())
            {

                try
                {
                    // Add sample to DB.
                    _db.Dnaextracts.Add(tbgdnaextractupdates);

                    _db.SaveChanges();
                }
                catch (Exception e)
                {
                    return false;
                }

            }
            // Success.
            return true;
        }

        //Heatkilling
        public (bool,string) HeatKilling(string PaId, string primaryMedia, string dateHeatKill, string dateTransfer, string initialTransfer, string initialRecieved , string remark)
        {
            var tbgheatkillupdates = new HeatKill();

            tbgheatkillupdates.PatientId = PaId;
            //tbgdstupdates.DstID = Convert.ToInt32(ResuId);

            tbgheatkillupdates.MediaType = primaryMedia;
            tbgheatkillupdates.InitialRecieved = initialRecieved;
            tbgheatkillupdates.InitialTransfer = initialTransfer;

            tbgheatkillupdates.DateHeatKill = string.IsNullOrEmpty(dateHeatKill) ? (DateTime?)null : Convert.ToDateTime(dateHeatKill);
            tbgheatkillupdates.DateTransfer = string.IsNullOrEmpty(dateTransfer) ? (DateTime?)null : Convert.ToDateTime(dateTransfer);
            tbgheatkillupdates.Remark = remark;


            using (SampleContext _db = new SampleContext())
            {

                try
                {
                    // Add sample to DB.
                    _db.HeatKills.Add(tbgheatkillupdates);

                    _db.SaveChanges();
                }
                catch (Exception e)
                {
                    return (false,e.ToString());
                }

            }
            // Success.
            return (true,"Perfecto");
        }

        internal (bool , string ) LibraryPreparation(string PaId, string remark, string initial, string libconc, string avgsize, string avgsizepct, string i5, string i7, string date)
        {
            var tbglibprep = new LibraryPrep();

            tbglibprep.PatientId = PaId;
            tbglibprep.LibConc = Convert.ToDecimal(libconc);
            tbglibprep.AverageSize = Convert.ToDecimal(avgsize);
            tbglibprep.AverageSizePercent = Convert.ToDecimal(avgsizepct);

            tbglibprep.IndexI5 = i5;
            tbglibprep.IndexI7 = i7;
            tbglibprep.LibPrepDate = string.IsNullOrEmpty(date) ? (DateTime?)null : Convert.ToDateTime(date); ;
            tbglibprep.Remark = remark;
            tbglibprep.Initial = initial;

            using (SampleContext _db = new SampleContext())
            {
                try
                {
                    _db.LibraryPreps.Add(tbglibprep);
                    _db.SaveChanges();
                }
                catch (Exception e)
                {
                    return (false, e.ToString());
                }
            }

            return (true, "Perfecto");
            
        }



    }
}