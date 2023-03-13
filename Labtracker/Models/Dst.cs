using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Dst
    {
        [ScaffoldColumn(false)]
        public int? DstID { get; set; }

        [Display(Name = "DrugLine")]
        public string DrugLine { get; set; }

        [Display(Name = "Drug")]
        public string Drug { get; set; }

        [Display(Name = "Sensitivity")]
        public string Sensitivity { get; set; }

        [Display(Name = "Dater")]
        public Nullable<DateTime> Dater { get; set; }

        [Display(Name = "Initial")]
        public string Initial { get; set; }

        public string PatientId { get; set; }

        public Nullable<DateTime> DateResult { get; set; }

        // public virtual ICollection<Sample> Samples { get; set; }
    }
}