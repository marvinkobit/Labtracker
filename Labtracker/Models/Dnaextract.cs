using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Dnaextract
    {
        [Key]
        [ScaffoldColumn(false)]
        public int? DnaextractionId { get; set; }

        [Required]
        public string PatientId { get; set; }

        [Display(Name = "ND Conc")]
        public Nullable<decimal> NDConc { get; set; }

        [Display(Name = "Qubit Conc")]
        public string QubitConc { get; set; }

        [Display(Name = "Purity")]
        public Nullable<decimal> Purity { get; set; }

        [Display(Name = "Extract Date")]
        public Nullable<DateTime> ExtractDate { get; set; }

        [Display(Name = "Remark")]
        public string Remark { get; set; }

        [Display(Name = "Initial")]
        public string Initial { get; set; }
        public string TubeLabel { get; set; }

        public string GoodQQ { get; set; }
        public string SampleType { get; set; }
        public string AssayReagent { get; set; }

    }
}