using ExcelDataReader;
using Labtracker.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Labtracker.Controllers
{
    public class ProgressExcelController : Controller
    {
        public ActionResult Index()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = (DataTable)Session["tmpdata"];
            }
            catch (Exception)
            {
                throw;
            }

            return View(dt);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(HttpPostedFileBase upload)
        {

            if (ModelState.IsValid)
            {

                if (upload != null && upload.ContentLength > 0)
                {
                    // ExcelDataReader works with the binary Excel file, so it needs a FileStream
                    // to get started. This is how we avoid dependencies on ACE or Interop:
                    Stream stream = upload.InputStream;

                    // We return the interface, so that
                    IExcelDataReader reader = null;


                    if (upload.FileName.EndsWith(".xls"))
                    {
                        reader = ExcelReaderFactory.CreateBinaryReader(stream);
                    }
                    else if (upload.FileName.EndsWith(".xlsx"))
                    {
                        reader = ExcelReaderFactory.CreateOpenXmlReader(stream);
                    }
                    else
                    {
                        ModelState.AddModelError("File", "This file format is not supported");
                        return View();
                    }
                    int fieldcount = reader.FieldCount;
                    int rowcount = reader.RowCount;


                    DataTable dt = new DataTable();
                    //dt.Columns.Add("UserName");
                    //dt.Columns.Add("Adddress");
                    DataRow row;


                    DataTable dt_ = new DataTable();
                    try
                    {

                        dt_ = reader.AsDataSet().Tables[0];

                        string ret = "";

                        for (int i = 0; i < dt_.Columns.Count; i++)
                        {
                            dt.Columns.Add(dt_.Rows[0][i].ToString());
                        }

                        int rowcounter = 0;
                        for (int row_ = 1; row_ < dt_.Rows.Count; row_++)
                        {
                            row = dt.NewRow();

                            for (int col = 0; col < dt_.Columns.Count; col++)
                            {

                                row[col] = dt_.Rows[row_][col].ToString();
                                rowcounter++;
                            }
                            dt.Rows.Add(row);


                            //db insert
                            using (var context = new SampleContext())

                            {

                                //Sample sam = new Sample() { SampleID = int.Parse(row[0].ToString()), PatientId = row[1].ToString(), CardNo = row[2].ToString(), Volume = row[3].ToString(), Quality = row[4].ToString(), FromCountry = row[5].ToString(), FromRegion = row[6].ToString(), Zone = row[7].ToString(), Woreda = row[8].ToString(), HealthFacility = row[9].ToString(), CollectionDate = DateTime.Today, RecivedDate = DateTime.Today, LabTech = row[12].ToString(), FilePath = upload.FileName, CategoryID = 1, ProjectID = 1 };
                                //context.Samples.Add(sam);
                                //context.SaveChanges();

                            }

                        }

                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("File", "Unable to Upload file!");
                        return View();
                    }

                    DataSet result = new DataSet();//reader.AsDataSet();
                    result.Tables.Add(dt);
                    string minutes_ID = "";

                    reader.Close();
                    reader.Dispose();
                    // return View();
                    //  return View(result.Tables[0]);

                    DataTable ddd = result.Tables[0];

                    Session["tmpdata"] = ddd;

                    return RedirectToAction("Index");

                }
                else
                {
                    ModelState.AddModelError("File", "Please Upload Your file");
                }
            }
            return View();
        }



    }
}