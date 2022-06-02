using ExcelDataReader;
using Labtracker.Models;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Labtracker.Controllers
{
    public class SampleExcelController : Controller
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
                    string err1="", err2="";
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

                            err1 = row[9].ToString();
                            err2 =  row[10].ToString();
                            //db insert
                            try
                            {
                                using (var context = new SampleContext())

                                {
                                    var CardNo_ = String.IsNullOrEmpty(row[1].ToString()) ? null : row[1].ToString();
                                    var Volume_ = String.IsNullOrEmpty(row[2].ToString()) ? null : row[2].ToString();
                                    var Quality_ = String.IsNullOrEmpty(row[3].ToString()) ? null : row[3].ToString();
                                    var labTech = String.IsNullOrEmpty(row[11].ToString()) ? null : row[11].ToString();

                                    var collectionDate = String.IsNullOrEmpty(row[9].ToString()) ? (DateTime?)null : DateTime.ParseExact(row[9].ToString(), "d/M/yyyy", CultureInfo.InvariantCulture);
                                    var recieveDate = String.IsNullOrEmpty(row[10].ToString()) ? (DateTime?)null : DateTime.ParseExact(row[10].ToString(), "d/M/yyyy", CultureInfo.InvariantCulture);
                                    var SampleID_ = context.Samples.Count();

                                    Sample sam = new Sample() { SampleID = int.Parse(SampleID_.ToString()), PatientId = row[0].ToString(), CardNo = CardNo_, Volume = Volume_, Quality = Quality_, FromCountry = row[4].ToString(), FromRegion = row[5].ToString(), Zone = row[6].ToString(), Woreda = row[7].ToString(), HealthFacility = row[8].ToString(), CollectionDate = collectionDate, RecivedDate = recieveDate, LabTech = labTech, FilePath = upload.FileName, CategoryID = 1, ProjectID = 1 };
                                    context.Samples.Add(sam);
                                    context.SaveChanges();

                                }
                            }
                            catch (Exception ex1)
                            {
                                throw ex1;
                                
                            }

                        }

                    }
                    catch (Exception ex)
                    {
                        
                        ModelState.AddModelError("File", ex.ToString() + err1 + err2 + "Unable to Upload file! Info: Data Validation Error, Invalid data entry.");
                       
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
                    ModelState.AddModelError("File", "Please Choose Your file to Upload");
                }
            }
            return View();
        }



    }
}