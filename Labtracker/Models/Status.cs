using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Status
    {
        [ScaffoldColumn(false)]
        public int StatusID { get; set; }

        [Required, StringLength(100), Display(Name = "Name")]
        public string StatusName { get; set; }

        [Display(Name = "Status Description")]
        public string Description { get; set; }

        public int? SampleID { get; set; }
        public virtual Sample Sample
        {
            get; set;
        }

        //public virtual ICollection<Sample> Samples { get; set; }
    }
}