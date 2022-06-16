using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Result
    {
        [ScaffoldColumn(false)]
        public int? ResultID { get; set; }

        [Display(Name = "Rd9Res")]
        public string RD9_res { get; set; }

        [Display(Name = "SmearRes")]
        public string Smear_res { get; set; }

        [Display(Name = "LJRes")]
        public string LJ_res { get; set; }

        [Display(Name = "LJ_P_Res")]
        public string LJ_P_res { get; set; }


        [Display(Name = "MIJTRes")]
        public string MIJT_res { get; set; }

        [Display(Name = "HeatKilled_res")]
        public string HeatKilled_res { get; set; }

        [Display(Name = "CultureSmear_res")]
        public string CultureSmear_res { get; set; }

        [Display(Name = "Spoligo_res")]
        public string Spoligo_res { get; set; }

        [Display(Name = "labinitial")]
        public string Labinitial { get; set; }

        public string PatientId { get; set; }

        public string FinalCultureResult { get; set; }

        public string BHI { get; set; }

        public string Remark { get; set; }

        // public virtual ICollection<Sample> Samples { get; set; }
    }
}