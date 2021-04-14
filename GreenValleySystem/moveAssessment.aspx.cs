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
        public string state2 = "tab-pane fade";
        public string state3 = "tab-pane fade show active";

        public string state4 = "nav-link active";
        public string state5 = "nav-link";

        protected void Page_Load(object sender, EventArgs e)
        {

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
        }
    }
}