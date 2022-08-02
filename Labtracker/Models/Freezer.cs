using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Freezer
    {
        [Key]
        [ScaffoldColumn(false)]
        public int? FreezerID { get; set; }
        public string Freezer_AHRIUniqueId { get; set; }

        public string EquipName { get; set; }
        public string ManufacturerName { get; set; }
        public string Model { get; set; }
        public string SerialNumber { get; set; }
        public string CurrentLocation { get; set; }
        public string EquipCondition { get; set; }
        public Nullable<DateTime> CalibrationDate { get; set; }
        public Nullable<DateTime> NextCalibrationDate { get; set; }
        public Nullable<DateTime> ServiceDatae { get; set; }
        public Nullable<DateTime> NextServiceDate { get; set; }
    }
}