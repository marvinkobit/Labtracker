using ExcelDataReader;
using Labtracker.Models;
using System;
using System.Data;
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
                                var CardNo_ = row[1] ?? "NA";
                                var Volume_ = row[2] ?? "NA";
                                var Quality_ = row[3] ?? "NA";
                                Console.WriteLine(CardNo_);
                                var SampleID_ = context.Samples.Count();
                                Sample sam = new Sample() { SampleID= int.Parse(SampleID_.ToString()) ,PatientId=row[0].ToString(), CardNo = CardNo_.ToString(), Volume = Volume_.ToString(), Quality = Quality_.ToString(), FromCountry = row[4].ToString(), FromRegion = row[5].ToString(), Zone = row[6].ToString(), Woreda = row[7].ToString(), HealthFacility = row[8].ToString(), CollectionDate = DateTime.ParseExact(row[9].ToString(), "d/M/yyyy", null), RecivedDate = DateTime.ParseExact(row[10].ToString(), "d/M/yyyy", null), LabTech = row[11].ToString(), FilePath = upload.FileName, CategoryID= 1, ProjectID = 1 };
                                context.Samples.Add(sam);
                                context.SaveChanges();
                           
                            }

                        }

                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("File", ex.ToString()+ "Unable to Upload file!        Info: Data Validation Error, Invalid data entry.");
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