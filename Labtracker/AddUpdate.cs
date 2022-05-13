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
                              string ljres)
        {
            //var tbgsamupdates = new Sample();
            var tbgresupdates = new Result();
            //var tbgprocessupdates = new Process();
         /*   var tbgstatusupdates = new Status();
            var tbgresistupdates = new Resistance();*/

            tbgresupdates.SampleID = Convert.ToInt32(SaId);
            tbgresupdates.ResultID = Convert.ToInt32(ResuId);
            tbgresupdates.LJ_res = ljres;
            //tbgresupdates.RD9_res = ljres;
            //tbgresupdates.MIJT_res = ljres;
            //tbgresupdates.Smear_res = ljres;
            //tbgresupdates.res1 = ljres;
            //tbgresupdates.res2 = ljres;

            // tbgprocessupdates.SampleID = Convert.ToInt32(SaId);
            //tbgprocessupdates.ProcessID = ProId;
            //tbgprocessupdates.LJ_date = Convert.ToDateTime(ljdate);

            using (SampleContext _db = new SampleContext())
            {
                // Add sample to DB.
                _db.Results.Add(tbgresupdates);
                //_db.Processes.Add(tbgprocessupdates);
          /*      _db.Resistances.Add(tbgresistupdates);
                _db.Statuses.Add(tbgstatusupdates);*/
                _db.SaveChanges();
            }
            // Success.
            return true;
        }

    }
}