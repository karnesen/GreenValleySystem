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

namespace Lab1
{
    public partial class createCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to create a new customer.";
                Response.Redirect("LoginPage.aspx");
            }

            if (!IsPostBack)
            {
                fillStates();
            }
        }

        // fill drop down list with states
        protected void fillStates()
        {
            List<String> states = new List<String> { "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "VI", "WA", "WV", "WI", "WY" };
            foreach (String i in states)
            {
                ddlState.Items.Add(new ListItem(i));
            }

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clearPage();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String firstName = txtFirstName.Text;
                String lastName = txtLastName.Text;
                String email = txtEmail.Text;
                String phoneNumber = txtPhoneNumber.Text;
                String phoneType = ddlPhoneNumberType.SelectedItem.ToString();
                String address = txtAddress.Text;
                String city = txtCity.Text;
                String state = ddlState.SelectedValue;
                String zip = txtZipCode.Text;
                String initialContact = rdoContact.SelectedItem.ToString();
                if (initialContact == "Other")
                    initialContact = txtOther.Text;
                String hear = txtHear.Text;

                String sqlQuery = "INSERT INTO CUSTOMER VALUES (@firstName, @lastName, @phoneNumber, @phoneType, @email, @address, @city, @state, @zip, @initialContact, @hear, '" + DateTime.Now + "')";
                sqlQuery += "INSERT INTO TICKETNOTE (creationDate, customerID, noteCreator, noteTitle, noteText)" +
                    " VALUES('" + DateTime.Now + "', (select max(customerID) from customer), " + Session["EmployeeID"] + ", 'Initial Contact', @notes)";
                sqlQuery += " Select max(customerID) as selected from customer";


               SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.Add(new SqlParameter("@firstName", firstName));
                sqlCommand.Parameters.Add(new SqlParameter("@lastName", lastName));
                sqlCommand.Parameters.Add(new SqlParameter("@phoneNumber", firstName));
                sqlCommand.Parameters.Add(new SqlParameter("@phoneType", phoneType));
                sqlCommand.Parameters.Add(new SqlParameter("@email", email));
                sqlCommand.Parameters.Add(new SqlParameter("@address", address));
                sqlCommand.Parameters.Add(new SqlParameter("@city", city));
                sqlCommand.Parameters.Add(new SqlParameter("@state", state));
                sqlCommand.Parameters.Add(new SqlParameter("@zip", zip));
                sqlCommand.Parameters.Add(new SqlParameter("@initialContact", initialContact));
                sqlCommand.Parameters.Add(new SqlParameter("@hear", hear));
                sqlCommand.Parameters.Add(new SqlParameter("@notes", txtNotes.Text));

                sqlConnect.Open();
                SqlDataReader reader = sqlCommand.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        Session["selectedCustomer"] = reader["selected"];
                    }
                }
                sqlConnect.Close();

                clearPage();
                Response.Redirect("customerProfile.aspx");

            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "James";
            txtLastName.Text = "Gordon";
            txtEmail.Text = "gordonJ@gmail.com";
            txtPhoneNumber.Text = "4109875647";

            txtAddress.Text = "738 Dukes Way";
            txtCity.Text = "Harrisonburg";
            ddlState.SelectedIndex = 50;
            txtZipCode.Text = "22801";

            rdoContact.SelectedIndex = 1;
            txtHear.Text = "Online Advertisment";
            txtNotes.Text = "High Value Items";
        }

        // check to see that the current email does not exist in the system
        protected void cvCheckUniqueCustomer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            String email = txtEmail.Text;
            String sqlQuery = "Select * from CUSTOMER where email = '" + email + "'";
            // Define the connection to the Database:
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            if (queryResults.HasRows)
            {
                args.IsValid = false;
            }

            else
            {
                args.IsValid = true;
            }
            sqlConnect.Close();
        }

        public void clearPage()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
            txtAddress.Text = "";
            ddlState.SelectedValue = null;
            txtCity.Text = "";
            txtZipCode.Text = "";
            outputLbl.Text = "";
            rdoContact.SelectedIndex = -1;
            txtOther.Text = "";
            txtHear.Text = "";
            rfvOther.Enabled = false;
            txtNotes.Text = "";
        }
 
        // If other, make other box required 
        protected void rdoContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdoContact.SelectedIndex == 4)
                rfvOther.Enabled = true;
            else
                rfvOther.Enabled = false;
        }
    }
}
