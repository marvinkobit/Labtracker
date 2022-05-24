using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace Labtracker.Models
{
    public class SampleDatabaseInitializer : DropCreateDatabaseIfModelChanges<SampleContext>
    {
        public static DateTime CollectionDate { get; private set; }

        protected override void Seed(SampleContext context)
        {
            
                            
            GetProjects().ForEach(pr => context.Projects.Add(pr));
            context.SaveChanges();
            GetCategories().ForEach(c => context.Categories.Add(c));
            context.SaveChanges();
            GetSamples().ForEach(s => context.Samples.Add(s));
            context.SaveChanges();
            GetStatuses().ForEach(s => context.Statuses.Add(s));
            context.SaveChanges();
            GetResults().ForEach(r => context.Results.Add(r));
            context.SaveChanges();
            GetProcesses().ForEach(p => context.Processes.Add(p));
            context.SaveChanges();
            GetResistances().ForEach(rs => context.Resistances.Add(rs));
            context.SaveChanges();
            base.Seed(context);
        }

        protected static List<Process> GetProcesses()
        {
            var processes = new List<Process> {
                new Process
                {
                    ProcessID = 1,
                    RD9_date = DateTime.Parse("Sep 1, 2019"),
                    Smear_date = DateTime.Parse("Sep 1, 2019"),
                    LJ_date=DateTime.Parse("Sep 1, 2019"),
                    MIJT_date=DateTime.Parse("Sep 1, 2019"),
                    Spoligo_date=DateTime.Parse("Sep 1, 2019"),
                    CultureSmear_date=DateTime.Parse("Sep 1, 2019")
                },
                new Process
                {
                    ProcessID = 2,
                    RD9_date = DateTime.Parse("Sep 1, 2019"),
                    Smear_date = DateTime.Parse("Sep 1, 2019"),
                    LJ_date=DateTime.Parse("Sep 1, 2019"),
                    MIJT_date=DateTime.Parse("Sep 1, 2019"),
                    Spoligo_date=DateTime.Parse("Sep 1, 2019"),
                    CultureSmear_date=DateTime.Parse("Sep 1, 2019")
                },

            };

            return processes;
        }

        protected static List<Resistance> GetResistances()
        {
            var resistances = new List<Resistance> {
                new Resistance
                {
                    ResistanceID = 1,
                    stm = "no",
                    inh = "no",

                    rif="no",
                    emb="no",
                    pza="no",

                },
                new Resistance 
                {
                    ResistanceID = 2,
                    stm = "no",
                    inh = "no",
                    rif="no",
                    emb="no",
                    pza="no",
                },

            };

            return resistances;
        }

        protected static List<Result> GetResults()
        {
            var results = new List<Result> {
                new Result
                {
                    ResultID = 1,
                    RD9_res = "mtb",
                    Smear_res = "positive",
                    LJ_res="positive",
                    MIJT_res="positive",
                    HeatKilled_res="",
                    CultureSmear_res=""
                   
                },
                new Result
                {
                    ResultID = 2,
                    RD9_res = "mtb",
                    Smear_res = "positive",
                    LJ_res="positive",
                    MIJT_res="positive",
                    HeatKilled_res="",
                    CultureSmear_res=""
                },

            };

            return results;
        }

        protected static List<Status> GetStatuses()
        {
            var statuses = new List<Status> {
                new Status
                {
                    StatusID = 1,
                    StatusName = "alequate stored",
                    Description = "alequate stored"
                },
                new Status
                {
                    StatusID = 2,
                    StatusName = "cultured",
                    Description = "sputum cultured"
                },

            };

            return statuses;
        }

        protected static List<Category> GetCategories()
        {
            var categories = new List<Category> {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Blood",
                    Description = ""
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Sputum",
                    Description = ""
                },
                
            };

            return categories;
        }

        protected static List<Sample> GetSamples()
        {
            var samples = new List<Sample> {
                new Sample
                {
                    SampleID = 1,
                    PatientId = "ET-OR-ES-AD-AD-001",
                    CardNo="063192",
                    Volume="4",
                    Quality="1",
                    FromRegion="Oromiya",
                    Zone = "East Shoa",
                    Woreda = "Adama",
                    HealthFacility="Adama Hospital",
                    CollectionDate= DateTime.Parse("Sep 1, 2019"),
                    RecivedDate=DateTime.Parse("Sep 15, 2019"),
                    LabTech="Mekides",
                    FilePath="",
                    CategoryID = 1,
                    ProjectID=1
               },
                new Sample
                {
                    SampleID = 2,
                    PatientId = "ET-OR-ES-AD-AD-001",
                    CardNo="063192",
                    Volume="4",
                    Quality="1",
                    FromRegion="Oromiya",
                    Zone = "East Shoa",
                    Woreda = "Adama",
                    HealthFacility="Adama Hospital",
                    CollectionDate= DateTime.Parse("Sep 1, 2019"),
                    RecivedDate=DateTime.Parse("Sep 15, 2019"),
                    LabTech="Sebsib",
                    FilePath="",
                    CategoryID = 2,
                    ProjectID=1
               }
                
            };

            return samples;
        }

        protected static List<Project> GetProjects()
        {
            var projects = new List<Project> {
                new Project
                {
                    ProjectID = 1,
                    Project_Name= "TBGEN",
                    Proj_Desc = "TB genetics study",
                    Proj_Start_Date=DateTime.Parse("Sep 1, 2019"),
                    Proj_End_Date=DateTime.Parse("Sep 1, 2022"),
                    Project_Status="ongoing",

                },
               

            };

            return projects;
        }
    }
}
