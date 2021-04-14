using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleySystem
{
    public partial class updateResources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        

        protected void lbtnNewEquipment_Click(object sender, EventArgs e)
        {
            srcEquipment.Insert();
            txtEquipmentName.Text = "";
            txtDatePurchased.Text = "";
        }
    }
}