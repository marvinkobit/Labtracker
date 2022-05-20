using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Growth
    {
        [ScaffoldColumn(false)]
        public int? GrowthID { get; set; }

        [Display(Name = "Week")]
        public string Week { get; set; }

        [Display(Name = "Primary Media")]
        public string dat1 { get; set; }

        [Display(Name = "dat2")]
        public string dat2 { get; set; }

        [Display(Name = "Dater")]
        public Nullable<DateTime> Dater { get; set; }

        [Display(Name = "Initial")]
        public string Initial { get; set; }

        public int? SampleID { get; set; }
        public virtual Sample Sample
        {
            get; set;
        }
        // public virtual ICollection<Sample> Samples { get; set; }
    }
}