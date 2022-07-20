using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class updatestorage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //UsernameText.Text = User.Identity.GetUserName();
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/login.aspx");


            }
        }

        protected void btnGoback_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/storage.aspx");
        }

        protected void btnSaveup_Click(object sender, EventArgs e)
        {
            AddStorage addstorage = new AddStorage();
            bool addSuccess = false;
            string errors;
            int category = Convert.ToInt32(ddlSampleType.SelectedValue);
            int matrix = 1;
            if (Radio1.Checked)
            {
                matrix = 1;
            }
            else if (Radio2.Checked)
            {
                matrix = 2;
            }
            else if (Radio3.Checked)
            {
                matrix = 3;
            }
            else if (Radio4.Checked)
            {
                matrix = 4;
            }
            else if (Radio5.Checked)
            {
                matrix = 5;
            }
            else if (Radio6.Checked)
            {
                matrix = 6;
            }
            else if (Radio7.Checked)
            {
                matrix = 7;
                
            }
            else if (Radio8.Checked)
            {
                matrix = 8;
            }
            else if (Radio9.Checked)
            {
                matrix = 9;
            }
            else if (Radio10.Checked)
            {
                matrix = 10;
            }
            else if (Radio10.Checked)
            {
                matrix = 11;
            }
            else if (Radio12.Checked)
            {
                matrix = 12;
            }
            else if (Radio13.Checked)
            {
                matrix = 13;
            }
            else if (Radio14.Checked)
            {
                matrix = 14;
            }
            else if (Radio15.Checked)
            {
                matrix = 15;
            }
            else if (Radio16.Checked)
            {
                matrix = 16;
            }
            else if (Radio17.Checked)
            {
                matrix = 17;
            }
            else if (Radio18.Checked)
            {
                matrix = 18;
            }
            else if (Radio19.Checked)
            {
                matrix = 19;
            }
            else if (Radio20.Checked)
            {
                matrix = 20;
            }
            else if (Radio21.Checked)
            {
                matrix = 21;
            }
            else if (Radio22.Checked)
            {
                matrix = 22;
            }
            else if (Radio23.Checked)
            {
                matrix = 23;
            }
            else if (Radio24.Checked)
            {
                matrix = 24;
            }
            else if (Radio25.Checked)
            {
                matrix = 25;
            }
            else if (Radio26.Checked)
            {
                matrix = 26;
            }
            else if (Radio27.Checked)
            {
                matrix = 27;
            }
            else if (Radio28.Checked)
            {
                matrix = 28;
            }
            else if (Radio29.Checked)
            {
                matrix = 29;
            }
            else if (Radio30.Checked)
            {
                matrix = 30;
            }
            else if (Radio31.Checked)
            {
                matrix = 31;
            }
            else if (Radio32.Checked)
            {
                matrix = 32;
            }
            else if (Radio33.Checked)
            {
                matrix = 33;
            }
            else if (Radio34.Checked)
            {
                matrix = 34;
            }
            else if (Radio35.Checked)
            {
                matrix = 35;
            }
            else if (Radio36.Checked)
            {
                matrix = 36;
            }
            else if (Radio37.Checked)
            {
                matrix = 37;
            }
            else if (Radio38.Checked)
            {
                matrix = 38;
            }
            else if (Radio39.Checked)
            {
                matrix = 39;
            }
            else if (Radio40.Checked)
            {
                matrix = 40;
            }

            (addSuccess, errors) = addstorage.Addstore(txtSampleIdUpdate.Text,  txtFreezer.Text, txtStorageRack.Text, txtStorageBox.Text, matrix, txtDateProcess.Text, category);
            if (addSuccess)
            {
                Response.Redirect("~/Storage.aspx");
            }
            else
            {
                asSavelbl.Text = errors;
            }

        }
    }
}