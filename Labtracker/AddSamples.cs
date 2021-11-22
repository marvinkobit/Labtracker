using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Labtracker.Models;

namespace Labtracker
{
    public class AddSamples
    {
        public bool AddSample(string SaId, string PaId,string CNo, string Vol,string Qly,string countr, string Region, string Zon, string Wored, string HealthF, DateTime datecoll, DateTime daterec,string labtech, string filep,int SampleCat, int ProjId)
        {
            var tbgsamples = new Sample();
            tbgsamples.SampleID = Convert.ToInt32(SaId);
            tbgsamples.PatientId = PaId;
            tbgsamples.CardNo = CNo;
            tbgsamples.Volume = Vol;
            tbgsamples.Quality = Qly;
            tbgsamples.FromCountry = countr;
            tbgsamples.FromRegion = Region;
            tbgsamples.Zone = Zon;
            tbgsamples.Woreda = Wored;
            tbgsamples.HealthFacility=HealthF;
            tbgsamples.CollectionDate = Convert.ToDateTime(datecoll);
            tbgsamples.RecivedDate= Convert.ToDateTime(daterec);
            tbgsamples.LabTech = labtech;
            tbgsamples.FilePath = filep;
            tbgsamples.CategoryID = SampleCat;
            tbgsamples.ProjectID = ProjId;

            using (SampleContext _db = new SampleContext())
            {
                // Add sample to DB.

                try
                {
                    _db.Samples.Add(tbgsamples);
                    _db.SaveChanges();
                }
                catch (Exception e)
                {

                    throw e;
                }
            }
            // Success.
            return true;
        }
    }
}