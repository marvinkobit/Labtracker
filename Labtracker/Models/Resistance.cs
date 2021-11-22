using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Resistance
    {
        [ScaffoldColumn(false)]
        public int ResistanceID { get; set; }

        [Display(Name = "STM")]
        public string stm { get; set; }

        [Display(Name = "INH")]
        public string inh { get; set; }

        [Display(Name = "RIF")]
        public string rif { get; set; }

        [Display(Name = "EMB")]
        public string emb { get; set; }

        [Display(Name = "PZA")]
        public string pza { get; set; }

        public int? SampleID { get; set; }
        public virtual Sample Sample
        {
            get; set;
        }
        //public virtual ICollection<Sample> Samples { get; set; }
    }
}