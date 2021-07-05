using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab1
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
               // btnToLogin.Visible = true;
                btnToLogout.Visible = false;
                lblMessage.Text = "Login for more!";
            }
            else
            {
                //btnToLogin.Visible = false;
                btnToLogout.Visible = true;
                lblMessage.Text = "Welcome, " + Session["username"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnToLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("login.aspx?loggedout=true");
        }

        protected void btnCustomerSearch_Click(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to search customers.";
                Response.Redirect("LoginPage.aspx");
            }
            Session["search"] = txtSearchCustomer.Text;
            Response.Redirect("searchResults.aspx");
        }
        protected void btnOutlook_Click(object sender, EventArgs e)
        {
            string url = "http://www.outlook.com";
            string script = string.Format("window.open('{0}');", url);

            Page.ClientScript.RegisterStartupScript(this.GetType(),
                "newPage" + UniqueID, script, true);

        }

        protected void btnToUpdatePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("employeeChangePassword.aspx");
        }

        protected void txtSearchCustomer_TextChanged(object sender, EventArgs e)
        {

        }
    }
}