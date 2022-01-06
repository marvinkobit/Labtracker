using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using Labtracker.Models;
using Labtracker.Logic;
//using System.Web.Mvc;
using Hangfire;
using System.Web.Mvc;

namespace Labtracker
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            AreaRegistration.RegisterAllAreas();
            //GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Initialize the sample database.
            //Database.SetInitializer(new SampleDatabaseInitializer());


            SampleContext c = new SampleContext();
            //c.Database.Initialize(true);
            //c.Database.CreateIfNotExists();


            // Create the custom role and user.
            RoleActions roleActions = new RoleActions();
            roleActions.AddUserAndRole();
        }
    }
}