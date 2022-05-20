using System;
using System.Collections.Generic;
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
            tbgresupdates.LJ_res = ljres;
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
        //ResultsUpdate
        public bool AddUpdate(string SaId, string ResuId,
                              string resultant,string restype,DateTime dateProcess,string labinitial)
        {
            //var tbgsamupdates = new Sample();
            var tbgresupdates = new Result();
            var tbgprocessupdates = new Process();
            var tbgdstupdates = new Dst();

            /*   var tbgstatusupdates = new Status();
               var tbgresistupdates = new Resistance();*/
            tbgprocessupdates.SampleID = Convert.ToInt32(SaId);
            tbgresupdates.SampleID = Convert.ToInt32(SaId);
            tbgresupdates.ResultID = Convert.ToInt32(ResuId);
            tbgresupdates.Labinitial = labinitial;
            tbgprocessupdates.ProcessID = Convert.ToInt32(SaId);

            
            switch (restype)
            {
                case "Primary Smear":
                    tbgresupdates.Smear_res = resultant;
                    tbgprocessupdates.Smear_date = Convert.ToDateTime(dateProcess);
                    break;
                case "LJ":
                    tbgresupdates.LJ_res = resultant;
                    tbgprocessupdates.LJ_date = Convert.ToDateTime(dateProcess);
                    break;
                case "MGIT":
                    tbgresupdates.MIJT_res = resultant;
                    tbgprocessupdates.MIJT_date = Convert.ToDateTime(dateProcess);
                    break;
                case "RD9":
                    tbgresupdates.RD9_res = resultant;
                    tbgprocessupdates.RD9_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Heat Killed":
                    tbgresupdates.HeatKilled_res = resultant;
                    tbgprocessupdates.HeatKill_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Culture Smear":
                    tbgresupdates.CultureSmear_res = resultant;
                    tbgprocessupdates.CultureSmear_date = Convert.ToDateTime(dateProcess);
                    break;
                case "Spoligo":
                    tbgresupdates.Spoligo_res = resultant;
                    tbgprocessupdates.Spoligo_date = Convert.ToDateTime(dateProcess);
                    break;
              
                default:
                    break;
            }
           
           
            //tbgresupdates.res1 = ljres;
            //tbgresupdates.res2 = ljres;

            // tbgprocessupdates.SampleID = Convert.ToInt32(SaId);
            //tbgprocessupdates.ProcessID = ProId;
            //tbgprocessupdates.LJ_date = Convert.ToDateTime(ljdate);

            using (SampleContext _db = new SampleContext())
            {

                try
                {
                    // Add sample to DB.
                    _db.Results.Add(tbgresupdates);
                    _db.Processes.Add(tbgprocessupdates);

                    /*      _db.Resistances.Add(tbgresistupdates);
                          _db.Statuses.Add(tbgstatusupdates);*/
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


        //Overload for DST
        public bool AddUpdate(string SaId, string sensetive , string drug, string drugline, string labinitial, DateTime dater)
        {
           
            var tbgdstupdates = new Dst();

            tbgdstupdates.SampleID = Convert.ToInt32(SaId);

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


        //Overload for GrowthDetection 
        public bool AddUpdate(DateTime dater, string SaId, string week, string primarymedia, string input, string labinitial)
        {

            var tbggrowthupdates = new Growth();

            tbggrowthupdates.SampleID = Convert.ToInt32(SaId);

            //tbgdstupdates.DstID = Convert.ToInt32(ResuId);
            tbggrowthupdates.Initial = labinitial;
            tbggrowthupdates.Week = week;
            tbggrowthupdates.dat1 = primarymedia;
            tbggrowthupdates.dat2 = input;
            tbggrowthupdates.Dater = Convert.ToDateTime(dater);


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


    }
}