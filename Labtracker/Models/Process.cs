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

        public string RD9_Initial { get; set; }

        [Display(Name = "Smear_date")]
        public Nullable<DateTime> Smear_date { get; set; }

        public string Smear_Initial { get; set; }

        [Display(Name = "LJ_date")]
        public Nullable<DateTime> LJ_date { get; set; }

        public string LJ_Initial { get; set; }

        [Display(Name = "LJ_P_date")]
        public Nullable<DateTime> LJ_P_date { get; set; }
        public string LJ_P_Initial { get; set; }

        [Display(Name = "MIJT_date")]
        public Nullable<DateTime> MIJT_date { get; set; }

        public string MGIT_Initial { get; set; }

        [Display(Name = "Spoligo_date")]
        public Nullable<DateTime> Spoligo_date { get; set; }

        public string Spoligo_Initial { get; set; }

        [Display(Name = "CultureSmear_date")]
        public Nullable<DateTime> CultureSmear_date { get; set; }

        public string CultureSmear_Initial { get; set; }

        [Display(Name = "HeatKill_date")]
        public Nullable<DateTime> HeatKill_date { get; set; }

        public string HeatKill_Initial { get; set; }

        [Display(Name = "FinalCultureResult_date")]
        public Nullable<DateTime> FinalCultureResult_date { get; set; }


        [Display(Name = "BHI_date")]
        public Nullable<DateTime> BHI_date { get; set; }

        public string BHI_Initial { get; set; }

        public string PatientId { get; set; }
       
        //public virtual ICollection<Sample> Samples { get; set; }
    }
}