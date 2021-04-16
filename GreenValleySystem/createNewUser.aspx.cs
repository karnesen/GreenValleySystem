using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web.SessionState;
using System.Web.UI.HtmlControls;
using System.IO;

namespace GreenValleySystem
{
    public partial class createNewUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 

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
                String phoneNumber2 = txtPhoneNumber2.Text;
                String phoneType = ddlPhoneNumberType.SelectedItem.ToString();
                String phoneType2 = ddlPhoneNumberType2.SelectedItem.ToString();
                String address = txtAddress.Text;
                String city = txtCity.Text;
                String state = ddlState.SelectedValue;
                String zip = txtZipCode.Text;

                String hear = txtHear.Text;

                String sqlQuery = "INSERT INTO CUSTOMER VALUES(@firstName, @lastName, @phoneNumber, @phoneType, @phoneNumber2, @phoneType2, " +
                     "@mobilePref, @homePref, @emailPref, @textPref, " +
                     "@email, @address, @city, @state, @zip, 'Customer Portal', @hear, '" + DateTime.Now + "', '" + DateTime.Now + "')";

                sqlQuery += "INSERT INTO TICKETNOTE (creationDate, customerID, noteTitle, noteText)" +
                    " VALUES('" + DateTime.Now + "', (select max(customerID) from customer), 'New Customer', @notes)";
                sqlQuery += "Insert INTO CUSTOMERAUTH VALUES((select max(customerID) from customer), '" + PasswordHash.HashPassword(txtPassword.Text) + "')";
                sqlQuery += " Select max(customerID) as selected from customer";


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = System.Data.CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.Add(new SqlParameter("@firstName", firstName));
                sqlCommand.Parameters.Add(new SqlParameter("@lastName", lastName));
                sqlCommand.Parameters.Add(new SqlParameter("@phoneNumber", phoneNumber));
                sqlCommand.Parameters.Add(new SqlParameter("@phoneNumber2", phoneNumber2));
                sqlCommand.Parameters.Add(new SqlParameter("@phoneType", phoneType));
                sqlCommand.Parameters.Add(new SqlParameter("@phoneType2", phoneType2));
                sqlCommand.Parameters.Add(new SqlParameter("@email", email));
                sqlCommand.Parameters.Add(new SqlParameter("@address", address));
                sqlCommand.Parameters.Add(new SqlParameter("@city", city));
                sqlCommand.Parameters.Add(new SqlParameter("@state", state));
                sqlCommand.Parameters.Add(new SqlParameter("@zip", zip));
                sqlCommand.Parameters.Add(new SqlParameter("@hear", hear));
                sqlCommand.Parameters.Add(new SqlParameter("@notes", txtNotes.Text));

                sqlCommand.Parameters.Add(new SqlParameter("@mobilePref", chMobile.Checked));
                sqlCommand.Parameters.Add(new SqlParameter("@homePref", chHome.Checked));
                sqlCommand.Parameters.Add(new SqlParameter("@emailPref", chEmail.Checked));
                sqlCommand.Parameters.Add(new SqlParameter("@textPref", chText.Checked));

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
                Response.Redirect("customerLogin.aspx");

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
            sqlCommand.CommandType = System.Data.CommandType.Text;
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
            txtHear.Text = "";
            txtNotes.Text = "";
        }

        protected void rdoContact_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //protected void btnImageupload_Click(object sender, EventArgs e)
        //{
        //    string fileName;
        //    string filePath;
        //    string folder;
        //    folder = Server.MapPath("~/images/");

        //    //retrieve name of posted file
        //    fileName = oFile.PostedFile.FileName;
        //    fileName = Path.GetFileName(fileName);

           
        //    if (oFile.Value != "")
        //    {
        //        //create folderz
        //        if (!Directory.Exists(folder))
        //        {
        //            Directory.CreateDirectory(folder);
        //        }
        //        //save to server
        //        filePath = folder + fileName;
        //        if (File.Exists(filePath))
        //        {
        //            lblResult.Text = fileName + "file already exists in the database!";
        //            lblResult.ForeColor = System.Drawing.Color.Red;

        //        }
        //        else
        //        {
        //            oFile.PostedFile.SaveAs(filePath);
        //            lblResult.Text = fileName + "has been successfully uploaded!";
        //            lblResult.ForeColor = System.Drawing.Color.Green;
        //        }
        //    }
        //    else
        //    {
        //        lblResult.Text = "Click 'Browse' to select the file to upload.";
        //    }
        //    //displayyyyyyyyyy
        //    panelConfirm.Visible = true;
        //}
    }
}