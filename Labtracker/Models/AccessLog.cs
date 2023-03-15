using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class AccessLog
    {
        [Key,ScaffoldColumn(false)]
        public int LogID { get; set; }
        public string UserId { get; set; }
        public Nullable<DateTime> AccessTime { get; set; }
        public string Browser { get; set; }
        public string Ipaddress { get; set; }
        public string Mobile { get; set; }
        public string UserAgent { get; set; }
        public string Action { get; set; }


    }
}