using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Labtracker
{
    public partial class UpdateFreezer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
            string equipCond = ddlEquipCond.SelectedItem.ToString();
            
            (addSuccess, errors) = addstorage.AddFreezer(txtAhriUniqueId.Text,txtManufacturer.Text , txtModel.Text, txtSerialNumber.Text, txtCurrrentLocation.Text, equipCond, txtDateCalibration.Text, txtDateCalibrationNext.Text);
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