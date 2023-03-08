using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker.Admin
{
    public partial class adminpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated | !User.IsInRole("canAdmin"))
            {
                Response.Redirect("~/login.aspx");
            }

            if (!IsPostBack)
            {
                string connStr = ConfigurationManager.ConnectionStrings["Labtracker"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string sql = "SELECT COUNT(DISTINCT Id) FROM AspNetUsers";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            lblUsers.Text = reader[0].ToString();
                        }
                    }

                    string sql2 = "SELECT COUNT(DISTINCT HealthFacility) FROM Sites";
                    using (SqlCommand cmd2 = new SqlCommand(sql2, conn))
                    {
                        using (SqlDataReader reader = cmd2.ExecuteReader())
                        {
                            reader.Read();
                            lblSites.Text = reader[0].ToString();
                        }

                    }

                }
            }
        }
        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/login.aspx");
        }
    }
}