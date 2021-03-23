using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

namespace GreenValleySystem
{
    public partial class MoveRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to create a new service.";
                Response.Redirect("LoginPage.aspx");
            }
        }

        protected void fillStates()
        {
            List<String> states = new List<String> { "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "VI", "WA", "WV", "WI", "WY" };
            foreach (String i in states)
            {
                ddlServiceState.Items.Add(new ListItem(i));
                ddlDestinationState.Items.Add(new ListItem(i));
            }

        }

        protected void dateValidation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(txtEndDate.Text))
                args.IsValid = true;
            else
                args.IsValid = Convert.ToDateTime(txtStartDate.Text) <= Convert.ToDateTime(txtEndDate.Text);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtServiceAddress.Text = "";
            txtServiceCity.Text = "";
            ddlServiceState.SelectedIndex = -1;
            txtServiceZip.Text = "";
            txtDestinationAddress.Text = "";
            txtDestinationCity.Text = "";
            ddlDestinationState.SelectedIndex = -1;
            txtDestinationZip.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int customerID = Int32.Parse(Session["selectedCustomer"].ToString());
            String ServiceAddress = txtServiceAddress.Text;
            String ServiceCity = txtServiceCity.Text;
            String ServiceState = ddlServiceState.SelectedValue;
            String ServiceZip = txtServiceZip.Text;

            String destAddress = txtDestinationAddress.Text;
            String destCity = txtDestinationCity.Text;
            String destState = ddlDestinationState.SelectedValue;
            String destZip = txtDestinationZip.Text;

            String serviceStartDate = DateTime.Parse(txtStartDate.Text).ToString("MM/dd/yyyy HH:mm:ss");
            DateTime serviceCompletionDate;
            String completionDate;
            if (String.IsNullOrEmpty(txtEndDate.Text))
            {
                completionDate = "";
            }
            else
            {
                serviceCompletionDate = DateTime.Parse(txtEndDate.Text);
                completionDate = serviceCompletionDate.ToString("MM/dd/yyyy HH:mm:ss");
            }

            String sqlQuery = "INSERT INTO SERVICE(serviceOpenDate, serviceStatus, serviceDeadlineStart, serviceDeadlineEnd, customerID) " +
                    "VALUES('" + DateTime.Now + "', 1,'" + serviceStartDate + "', '" + completionDate + "', " + customerID + " )";
            sqlQuery = "INSERT INTO MOVE(serviceID) VALUES((select max(serviceID) from service))";

            sqlQuery += " INSERT INTO ADDRESSES VALUES(@serviceAddress, @serviceCity, @serviceState, @serviceState, 'P', (select max(serviceID) from service))";
            sqlQuery += " INSERT INTO ADDRESSES VALUES(@destAddress, @destCity, @destState, @destState, 'D', (select max(serviceID) from service))";
            sqlQuery = "INSERT INTO TICKETNOTE (creationDate, serviceID, noteCreator, noteTitle, noteText)" +
                "VALUES('" + DateTime.Now + "',  (select max(serviceID) from service), " + Session["EmployeeID"] + ", 'Initial Request', @notes)";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlCommand.Parameters.Add(new SqlParameter("@serviceAddress", ServiceAddress));
            sqlCommand.Parameters.Add(new SqlParameter("@servicecity", ServiceCity));
            sqlCommand.Parameters.Add(new SqlParameter("@serviceState", ServiceState));
            sqlCommand.Parameters.Add(new SqlParameter("@servicezip", ServiceZip));

            sqlCommand.Parameters.Add(new SqlParameter("@destAddress", destAddress));
            sqlCommand.Parameters.Add(new SqlParameter("@destcity", destCity));
            sqlCommand.Parameters.Add(new SqlParameter("@destState", destState));
            sqlCommand.Parameters.Add(new SqlParameter("@destzip", destZip));
            sqlCommand.Parameters.Add(new SqlParameter("@notes", txtNotes.Text));
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            sqlCommand.ExecuteReader();
            sqlConnect.Close();

        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtServiceAddress.Text = "235 Rose Court";
            txtServiceCity.Text = "Harrisonburg";
            txtServiceZip.Text = "23405";
            ddlServiceState.SelectedIndex = 50;

            txtDestinationAddress.Text = "2019 Berry Way";
            txtDestinationCity.Text = "Harrisonburg";
            txtDestinationZip.Text = "28192";
            ddlDestinationState.SelectedIndex = 50;

            txtStartDate.Text = "2021-03-28T12:35";
            txtEndDate.Text = "2021-03-30T12:35";

            txtNotes.Text = "Notes!";
        }
    }
}