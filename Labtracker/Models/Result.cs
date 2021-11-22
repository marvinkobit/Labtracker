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
        public int ResultID { get; set; }

        [Display(Name = "Rd9Res")]
        public string RD9_res { get; set; }

        [Display(Name = "SmearRes")]
        public string Smear_res { get; set; }

        [Display(Name = "LJRes")]
        public string LJ_res { get; set; }

        [Display(Name = "MIJTRes")]
        public string MIJT_res { get; set; }

        [Display(Name = "res1")]
        public string res1 { get; set; }

        [Display(Name = "res2")]
        public string res2 { get; set; }

        public int? SampleID { get; set; }
        public virtual Sample Sample
        {
            get; set;
        }
        // public virtual ICollection<Sample> Samples { get; set; }
    }
}