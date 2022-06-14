using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class LibraryPrep
    {
        [Key]
        [ScaffoldColumn(false)]
        public int? LibPrepId { get; set; }

        [Required]
        public string PatientId { get; set; }

        [Display(Name = "LibConc")]
        public decimal LibConc { get; set; }

        [Display(Name = "AverageSize")]
        public decimal AverageSize { get; set; }

        [Display(Name = "AverageSize Percent")]
        public decimal AverageSizePercent { get; set; }

        [Display(Name = "IndexI5")]
        public string IndexI5 { get; set; }

        [Display(Name = "IndexI7")]
        public string IndexI7 { get; set; }

        [Display(Name = "LibPrepDate")]
        public Nullable<DateTime> LibPrepDate { get; set; }

        [Display(Name = "Remark")]
        public string Remark { get; set; }

        [Display(Name = "Initial")]
        public string Initial { get; set; }


    }
}