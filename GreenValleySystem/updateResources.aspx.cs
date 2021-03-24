using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleySystem
{
    public partial class updateResources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gvEmployees.DataBind();
        }


        protected void btnInsertEmployee_Click(object sender, EventArgs e)
        {
            srcEmployees.Insert();
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPosition.Text = "";
        }

        protected void lbtnNewEquipment_Click(object sender, EventArgs e)
        {
            srcEquipment.Insert();
            txtEquipmentName.Text = "";
            txtDatePurchased.Text = "";
        }
    }
}