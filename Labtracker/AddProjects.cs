using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public class AddProjects
    {

        public bool AddProject(string projectName, string projectStr, string projectDescription, string startDate, string endDate)
        {
            var labtrackerProject = new Project();
            labtrackerProject.Project_Name = projectName;
            labtrackerProject.ProjectStr = projectStr;
            labtrackerProject.Proj_Desc = projectDescription;

            labtrackerProject.Proj_Start_Date =  string.IsNullOrEmpty(startDate) ? (DateTime?)null : Convert.ToDateTime(startDate);
            labtrackerProject.Proj_End_Date = string.IsNullOrEmpty(endDate) ? (DateTime?)null : Convert.ToDateTime(endDate);


           
          

            using (SampleContext _db = new SampleContext())
            {
                // Add site to DB.

                try
                {
                    _db.Projects.Add(labtrackerProject);
                    _db.SaveChanges();
                }
                catch (Exception e)
                {

                    return false;
                   
                }
            }
            // Success.
            return true;
        }

    }
}