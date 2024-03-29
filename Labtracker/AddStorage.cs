﻿using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public class AddStorage
    {

        public (bool, string) Addstore(string PaId, string freezer, string rack, string box, string matrix, string date,string category, string mediatype, string drawer, string shelf)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;

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
                    //check if boxmatrix is taken
                    SqlConnection SQLConn = new SqlConnection(connStr);
                    SqlCommand command = new SqlCommand("SELECT COUNT([StoreId]) FROM[Labtracker].[dbo].[Stores] WHERE [Freezer]=@freezer and [Rack]=@rack and Box=@box and Matrix=@matrix", SQLConn);
                    command.Parameters.Add("@Freezer", SqlDbType.NVarChar).Value = tbgstore.Freezer;
                    command.Parameters.Add("@Rack", SqlDbType.NVarChar).Value = tbgstore.Rack;
                    command.Parameters.Add("@Box", SqlDbType.NVarChar).Value = tbgstore.Box;
                    command.Parameters.Add("@Matrix", SqlDbType.NVarChar).Value = tbgstore.Matrix;
                    SQLConn.Open();
                    int count;               
                    using (SqlDataReader reader = command.ExecuteReader())
                     {
                            reader.Read();
                            count = Convert.ToInt32(reader[0]);
                     }
                    SQLConn.Close();
                    if (count==0){
                        
                    }
                    else
                    {
                        return (false, "Error... Another Isolate is stored at this position.");
                    }

                }
                catch
                {

                }
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

        public (bool, string) AddFreezer(string ahriUID, string manuname, string model, string serialnum, string currentloc, string equipcond, string calibdate, string calibdatenext)
        {
            var tbgfreezer = new Freezer
            {
                Freezer_AHRIUniqueId = ahriUID,
                ManufacturerName = manuname,

                Model = model,
                SerialNumber = serialnum,
                CurrentLocation = currentloc,
                EquipCondition = equipcond,
                CalibrationDate = string.IsNullOrEmpty(calibdate) ? (DateTime?)null : Convert.ToDateTime(calibdate),
                NextCalibrationDate = string.IsNullOrEmpty(calibdatenext) ? (DateTime?)null : Convert.ToDateTime(calibdatenext)
            };

            using (SampleContext _db = new SampleContext())
            {
                try
                {
                    _db.Freezers.Add(tbgfreezer);
                    _db.SaveChanges();
                }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        System.Diagnostics.Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:", eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"", ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    return (false, e.ToString());
                }
            }
            return (true, "Perfecto");

        }
    }
}