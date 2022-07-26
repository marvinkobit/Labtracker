using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public class AddStorage
    {

        public (bool, string) Addstore(string PaId, string freezer, string rack, string box, string matrix, string date,string category, string mediatype, string drawer, string shelf)
        {
            var tbgstore = new Store
            {
                PatientId = PaId,
                Freezer = freezer,

                Rack = rack,
                Box = box,
                Matrix = matrix,
                MediaType = mediatype,
                Drawer = drawer,
                Shelf = shelf,

                category = category,
                storeDate = string.IsNullOrEmpty(date) ? (DateTime?)null : Convert.ToDateTime(date)
            };

            using (SampleContext _db= new SampleContext())
            {
                try
                {
                    _db.Stores.Add(tbgstore);
                    _db.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {
                    foreach(var eve in e.EntityValidationErrors)
                    {
                        System.Diagnostics.Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:", eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach(var ve in eve.ValidationErrors)
                        {
                            Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"",ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    return (false, e.ToString());
                }
            }
            return (true, "Perfecto");

        }
    }
}