using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace GreenValleySystem
{
    public partial class moveAssessment : System.Web.UI.Page
    {
        
        public string stateNav1 = "nav-link active";
        public string stateNav2 = "nav-link";
        public string stateNav3 = "nav-link";
        public string stateTab1 = "tab-pane fade show active";
        public string stateTab2 = "tab-pane fade";
        public string stateTab3 = "tab-pane fade";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must be logged in to view this page.";
                Response.Redirect("login.aspx");
            }

        }

        protected void btnNewAddress_Click(object sender, EventArgs e)
        {
            srcServiceAddresses.Insert();
            txtAddress.Text = "";
            txtCity.Text = "";
            txtZipCode.Text = "";
            ddlState.SelectedIndex = -1;
        }
        protected void btnEquipment_Click(object sender, EventArgs e)
        {
            srcTrucks.Insert();
            tabTwoOpen();
        }

        protected void lnkButtonSave_Click(object sender, EventArgs e)
        {
            tabTwoOpen();
;        }

        public void tabTwoOpen()
        {
            stateNav1 = "nav-link";
            stateNav2 = "nav-link active";
            stateNav3 = "nav-link";
            stateTab1 = "tab-pane fade";
            stateTab2 = "tab-pane fade show active";
            stateTab3 = "tab-pane fade";
        }

        public void tabThreeOpen()
        {
            stateNav1 = "nav-link";
            stateNav2 = "nav-link";
            stateNav3 = "nav-link active";
            stateTab1 = "tab-pane fade";
            stateTab2 = "tab-pane fade";
            stateTab3 = "tab-pane fade show active";
        }

        protected void btnSaveTab3_Click(object sender, EventArgs e)
        {
            tabThreeOpen();
        }
    }

}