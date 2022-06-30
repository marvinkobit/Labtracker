using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public class AddStorage
    {

        internal (bool, string) Addstore(string PaId, string freezer, string rack, string box, int matrix, string date,int category)
        {
            var tbgstore = new Store();

            tbgstore.PatientId = PaId;
            tbgstore.Freezer = freezer;
            tbgstore.Rack = rack;
            tbgstore.Box = box;
            tbgstore.Matrix = matrix;
            tbgstore.category = category;
            tbgstore.storeDate = string.IsNullOrEmpty(date)? (DateTime?)null : Convert.ToDateTime(date);

            using (SampleContext _db= new SampleContext())
            {
                try
                {
                    _db.Stores.Add(tbgstore);
                    _db.SaveChanges();
                }
                catch (Exception e)
                {

                    return (false, e.GetType().ToString());
                }
            }
            return (true, "Perfecto");

        }
    }
}