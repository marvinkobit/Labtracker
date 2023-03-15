using Labtracker.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Labtracker
{
    public class AddAccessLogs
    {

        public bool AddAccessLog(string userid, string browser,string ipaddress,string mobile,string useragent,string action)
        {
            var tbgaccesslog = new AccessLog();
            tbgaccesslog.UserId = userid;
            tbgaccesslog.AccessTime = DateTime.UtcNow;
            tbgaccesslog.Browser = browser;
            tbgaccesslog.Ipaddress = ipaddress;
            tbgaccesslog.Mobile = mobile;
            tbgaccesslog.UserAgent = useragent;
            tbgaccesslog.Action = action;


            using (SampleContext _db = new SampleContext())
            {
                // Add site to DB.

                try
                {
                    _db.AccessLogs.Add(tbgaccesslog);
                    _db.SaveChanges();
                }
                catch (Exception e)
                {

                    throw e;
                    return false;
                }
            }
            // Success.
            return true;
        }
    }
}