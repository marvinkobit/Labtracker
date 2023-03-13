using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Site
    {

        [ScaffoldColumn(false)]
        public int SiteId { get; set; }

        [StringLength(100), Display(Name = "SitePatientId")]
        public string SitePatientId { get; set; }

        [StringLength(100), Display(Name = "Country")]
        public string Country { get; set; }

        [StringLength(100), Display(Name = "Region")]
        public string Region { get; set; }

        [StringLength(100), Display(Name = "Zone")]
        public string Zone { get; set; }

        [StringLength(100), Display(Name = "Woreda")]
        public string Woreda { get; set; }

        [StringLength(255), Display(Name = "HealthFacility")]
        public string HealthFacility { get; set; }
        [ Display(Name = "StartDate")]

        public Nullable<DateTime> StartDate { get; set; }

        [StringLength(100), Display(Name = "Status")]
        public string Status { get; set; }

        [ Display(Name = "Remark")]
        public string Remark { get; set; }

        [Display(Name = "LocationLatitude")]
        public string LocationLatitude { get; set; }

        [Display(Name = "LocationLongitude")]
        public string LocationLongitude { get; set; }

    }
}