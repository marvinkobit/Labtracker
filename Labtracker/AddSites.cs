using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public class AddSites
    {
        public bool AddSite( string facilityName, string sitePid, string country, string region, string zone, string woreda, string gpsLat, string gpsLong, string startdate,  string remark)
        {
            var tbgsites = new Site();
            tbgsites.SitePatientId = sitePid;
            tbgsites.HealthFacility = facilityName;
            tbgsites.Country = country;
            tbgsites.Region = region;
            tbgsites.Zone = zone;
            tbgsites.Woreda = woreda;
            tbgsites.LocationLatitude = gpsLat;
            tbgsites.LocationLongitude = gpsLong;
            tbgsites.StartDate = string.IsNullOrEmpty(startdate) ? (DateTime?)null : Convert.ToDateTime(startdate);       
            tbgsites.Remark = remark;
     

            using (SampleContext _db = new SampleContext())
            {
                // Add site to DB.

                try
                {
                    _db.Sites.Add(tbgsites);
                    _db.SaveChanges();
                }
                catch (Exception e)
                {

                    throw e;
                    return false;
                }
            }
            // Success.
            return true;
        }
    }
}