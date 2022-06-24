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
            if (Radio1.Checked)
            {

            }
            (addSuccess, errors) = addstorage.Addstore(txtSampleIdUpdate.Text,  txtFreezer.Text, txtStorageRack.Text, txtStorageBox.Text, Radio1.Checked? 1:0, txtDateProcess.Text);
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