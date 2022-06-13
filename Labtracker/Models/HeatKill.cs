using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class HeatKill
    {
        [Key]
        [ScaffoldColumn(false)]
        public int? HeatKillId { get; set; }

        public string PatientId { get; set; }

        [Display(Name = "MediaType")]
        public string MediaType { get; set; }

        [Display(Name = "InitialTransfer")]
        public string InitialTransfer { get; set; }

        [Display(Name = "InitialRecieved")]
        public string InitialRecieved { get; set; }

        [Display(Name = "Heat Killing Date")]
        public Nullable<DateTime> DateHeatKill { get; set; }

        [Display(Name = "DateTransfer")]
        public Nullable<DateTime> DateTransfer { get; set; }

        [Display(Name = "Remark")]
        public string Remark { get; set; }

    }
}