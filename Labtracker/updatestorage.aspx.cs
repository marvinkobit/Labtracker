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
            string category = ddlSampleType.SelectedItem.ToString();
            string mediatype = DDLRESVAL.SelectedItem.ToString();
            int matrix = 1;

            if (Radio1.Checked) { matrix = 1; }
            else if (Radio2.Checked) { matrix = 2; }
            else if (Radio3.Checked) { matrix = 3; }
            else if (Radio4.Checked) { matrix = 4; }
            else if (Radio5.Checked) { matrix = 5; }
            else if (Radio6.Checked) { matrix = 6; }
            else if (Radio7.Checked) { matrix = 7; }
            else if (Radio8.Checked) { matrix = 8; }
            else if (Radio9.Checked) { matrix = 9; }
            else if (Radio10.Checked) { matrix = 10; }
            else if (Radio11.Checked) { matrix = 11; }
            else if (Radio12.Checked) { matrix = 12; }
            else if (Radio13.Checked) { matrix = 13; }
            else if (Radio14.Checked) { matrix = 14; }
            else if (Radio15.Checked) { matrix = 15; }
            else if (Radio16.Checked) { matrix = 16; }
            else if (Radio17.Checked) { matrix = 17; }
            else if (Radio18.Checked) { matrix = 18; }
            else if (Radio19.Checked) { matrix = 19; }
            else if (Radio20.Checked) { matrix = 20; }
            else if (Radio21.Checked) { matrix = 21; }
            else if (Radio22.Checked) { matrix = 22; }
            else if (Radio23.Checked) { matrix = 23; }
            else if (Radio24.Checked) { matrix = 24; }
            else if (Radio25.Checked) { matrix = 25; }
            else if (Radio26.Checked) { matrix = 26; }
            else if (Radio27.Checked) { matrix = 27; }
            else if (Radio28.Checked) { matrix = 28; }
            else if (Radio29.Checked) { matrix = 29; }
            else if (Radio30.Checked) { matrix = 30; }
            else if (Radio31.Checked) { matrix = 31; }
            else if (Radio32.Checked) { matrix = 32; }
            else if (Radio33.Checked) { matrix = 33; }
            else if (Radio34.Checked) { matrix = 34; }
            else if (Radio35.Checked) { matrix = 35; }
            else if (Radio36.Checked) { matrix = 36; }
            else if (Radio37.Checked) { matrix = 37; }
            else if (Radio38.Checked) { matrix = 38; }
            else if (Radio39.Checked) { matrix = 39; }
            else if (Radio40.Checked) { matrix = 40; }
            else if (Radio41.Checked) { matrix = 41; }
            else if (Radio42.Checked) { matrix = 42; }
            else if (Radio43.Checked) { matrix = 43; }
            else if (Radio44.Checked) { matrix = 44; }
            else if (Radio45.Checked) { matrix = 45; }
            else if (Radio46.Checked) { matrix = 46; }
            else if (Radio47.Checked) { matrix = 47; }
            else if (Radio48.Checked) { matrix = 48; }
            else if (Radio49.Checked) { matrix = 49; }
            else if (Radio50.Checked) { matrix = 50; }
            else if (Radio51.Checked) { matrix = 51; }
            else if (Radio52.Checked) { matrix = 52; }
            else if (Radio53.Checked) { matrix = 53; }
            else if (Radio54.Checked) { matrix = 54; }
            else if (Radio55.Checked) { matrix = 55; }
            else if (Radio56.Checked) { matrix = 56; }
            else if (Radio57.Checked) { matrix = 57; }
            else if (Radio58.Checked) { matrix = 58; }
            else if (Radio59.Checked) { matrix = 59; }
            else if (Radio60.Checked) { matrix = 60; }
            else if (Radio61.Checked) { matrix = 61; }
            else if (Radio62.Checked) { matrix = 62; }
            else if (Radio63.Checked) { matrix = 63; }
            else if (Radio64.Checked) { matrix = 64; }
            else if (Radio65.Checked) { matrix = 65; }
            else if (Radio66.Checked) { matrix = 66; }
            else if (Radio67.Checked) { matrix = 67; }
            else if (Radio68.Checked) { matrix = 68; }
            else if (Radio69.Checked) { matrix = 69; }
            else if (Radio70.Checked) { matrix = 70; }
            else if (Radio71.Checked) { matrix = 71; }
            else if (Radio72.Checked) { matrix = 72; }
            else if (Radio73.Checked) { matrix = 73; }
            else if (Radio74.Checked) { matrix = 74; }
            else if (Radio75.Checked) { matrix = 75; }
            else if (Radio76.Checked) { matrix = 76; }
            else if (Radio77.Checked) { matrix = 77; }
            else if (Radio78.Checked) { matrix = 78; }
            else if (Radio79.Checked) { matrix = 79; }
            else if (Radio80.Checked) { matrix = 80; }
            else if (Radio81.Checked) { matrix = 81; }
            else if (Radio82.Checked) { matrix = 82; }
            else if (Radio83.Checked) { matrix = 83; }
            else if (Radio84.Checked) { matrix = 84; }
            else if (Radio85.Checked) { matrix = 85; }
            else if (Radio86.Checked) { matrix = 86; }
            else if (Radio87.Checked) { matrix = 87; }
            else if (Radio88.Checked) { matrix = 88; }
            else if (Radio89.Checked) { matrix = 89; }
            else if (Radio90.Checked) { matrix = 90; }
            else if (Radio91.Checked) { matrix = 91; }
            else if (Radio92.Checked) { matrix = 92; }
            else if (Radio93.Checked) { matrix = 93; }
            else if (Radio94.Checked) { matrix = 94; }
            else if (Radio95.Checked) { matrix = 95; }
            else if (Radio96.Checked) { matrix = 96; }
            else if (Radio97.Checked) { matrix = 97; }
            else if (Radio98.Checked) { matrix = 98; }
            else if (Radio99.Checked) { matrix = 99; }
            else if (Radio100.Checked) { matrix = 100; }


            char mediaY = Convert.ToChar(65 + ((matrix - 1) / 10));
            int mediaX = matrix % 10;
            string media;
            switch (mediaX)
            {
                case 0:
                    media = mediaY + "10";
                    break;
                default:
                    media = mediaY + mediaX.ToString();
                    break;
            }
            (addSuccess, errors) = addstorage.Addstore(txtSampleIdUpdate.Text,  txtFreezer.Text, txtStorageRack.Text, txtStorageBox.Text, media, txtDateProcess.Text, category, mediatype.Equals("Choose Media")? null:mediatype, txtDrawer.Text, txtShelf.Text);
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