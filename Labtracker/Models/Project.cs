using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Project
    {

        [ScaffoldColumn(false)]
        public int ProjectID { get; set; }

        [Display(Name = "ProjectName")]
        public string Project_Name { get; set; }

        [Display(Name = "ProjectDescription")]
        public string Proj_Desc { get; set; }

        [Display(Name = "StartDate")]
        public DateTime Proj_Start_Date { get; set; }

        [Display(Name = "EndDate")]
        public DateTime Proj_End_Date { get; set; }

        [Display(Name = "ProjectStatus")]
        public string Project_Status { get; set; }

        [Display(Name = "ProjectStr")]
        public string ProjectStr { get; set; }

        public virtual ICollection<Sample> Samples { get; set; }
    }
}