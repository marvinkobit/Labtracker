using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Sample
    {
        [ScaffoldColumn(false)]
        public int SampleID { get; set; }

        [Required,StringLength(100), Display(Name = "Patient Id")]
        public string PatientId { get; set; }

        [StringLength(100), Display(Name = "Patient Card No")]
        public string CardNo { get; set; }

        [StringLength(100), Display(Name = "Sample Volume")]
        public string Volume { get; set; }

        [StringLength(100), Display(Name = "Sample Quality")]
        public string  Quality  { get; set; }

        //public string FacilityName { get; set; }

        //[Required, StringLength(100), Display(Name = "Facility Name"), DataType(DataType.MultilineText)]

        [StringLength(100), Display(Name = "From Country")]
        public string FromCountry { get; set; }

        [StringLength(100), Display(Name = "From Region")]
        public string FromRegion { get; set; }
        [StringLength(100), Display(Name = "Zone")]

        public string Zone { get; set; }
        [Required, StringLength(100), Display(Name = "Woreda")]

        public string Woreda { get; set; }
        [StringLength(100), Display(Name = "Health Facility")]

        public string HealthFacility { get; set; }
        [Display(Name = "Date Collected")]


        public Nullable<DateTime> CollectionDate { get; set; }

        [Display(Name = "Date Recieved")]
        public Nullable<DateTime> RecivedDate { get; set; }

        public string LabTech { get; set; }
        [StringLength(100), Display(Name = "Lab Technician")]

        public string FilePath { get; set; }

        public int? CategoryID { get; set; }
        public virtual Category Category
        {
            get; set;
        }

        public int? ProjectID { get; set; }
        public virtual Project Project
        {
            get; set;
        }
    }
}