using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Labtracker.Models
{
    public class Store
    {
        [Key]
        public string StoreId { get; set; }

        public string PatientId { get; set; }

        public string Freezer { get; set; }

        public string Rack { get; set; }

        public string Box { get; set; }

        public int Matrix { get; set; }


        [DisplayFormat(DataFormatString = "dd/mm/yyyy")]
        public Nullable<DateTime> storeDate { get; set; }

    }
}