using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Labtracker.Models;
using System.Web.ModelBinding;

namespace Labtracker
{
    public partial class Collection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Sample> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new Labtracker.Models.SampleContext();
            IQueryable<Sample> query = _db.Samples;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(s => s.CategoryID == categoryId);
            }
            return query;
        }
    }
}