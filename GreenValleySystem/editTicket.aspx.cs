//Kirsi And Josh Coleman 2/15/21
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

using System.Web.UI.HtmlControls;

namespace Lab2
{
    public partial class editTicket : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view a ticket.";
                Response.Redirect("LoginPage.aspx");
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

    }
}