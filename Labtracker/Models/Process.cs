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

        [Display(Name = "Rd9Date")]
        public DateTime RD9_date { get; set; }

        [Display(Name = "SmearDate")]
        public DateTime Smear_date { get; set; }

        [Display(Name = "LJDate")]
        public DateTime LJ_date { get; set; }

        [Display(Name = "MIJTDate")]
        public DateTime MIJT_date { get; set; }

        [Display(Name = "dat1")]
        public DateTime dat1 { get; set; }

        [Display(Name = "dat2")]
        public DateTime dat2 { get; set; }

        public int? SampleID { get; set; }
        public virtual Sample Sample
        {
            get; set;
        }
        //public virtual ICollection<Sample> Samples { get; set; }
    }
}