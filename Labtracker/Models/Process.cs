using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Process
    {
        [ScaffoldColumn(false)]
        public int ProcessID { get; set; }

        [Display(Name = "RD9_date")]
        public Nullable<DateTime> RD9_date { get; set; }

        [Display(Name = "Smear_date")]
        public Nullable<DateTime> Smear_date { get; set; }

        [Display(Name = "LJ_date")]
        public Nullable<DateTime> LJ_date { get; set; }

        [Display(Name = "MIJT_date")]
        public Nullable<DateTime> MIJT_date { get; set; }

        [Display(Name = "Spoligo_date")]
        public Nullable<DateTime> Spoligo_date { get; set; }

        [Display(Name = "CultureSmear_date")]
        public Nullable<DateTime> CultureSmear_date { get; set; }

        [Display(Name = "HeatKill_date")]
        public Nullable<DateTime> HeatKill_date { get; set; }

        public int? SampleID { get; set; }
        public virtual Sample Sample
        {
            get; set;
        }
        //public virtual ICollection<Sample> Samples { get; set; }
    }
}