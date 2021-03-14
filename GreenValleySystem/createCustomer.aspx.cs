//Kirsi And Josh Coleman 2/15/21
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
                disableAuction();
                disableMove();
                fillStates();
                if (Session["selectedCustomer"] != null)
                {
                    fillCustomerTable(Session["selectedCustomer"].ToString());
                }
            }
        }

        // fill drop down list with states
        protected void fillStates()
        {
            List<String> states = new List<String> { "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "VI", "WA", "WV", "WI", "WY" };
            foreach (String i in states)
            {
                ddlState.Items.Add(new ListItem(i));
                ddlServiceState.Items.Add(new ListItem(i));
                ddlDestinationState.Items.Add(new ListItem(i));
                ddlAuctionState.Items.Add(new ListItem(i));
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

                // Create your Query String

                String sqlQuery = "INSERT INTO CUSTOMER VALUES (@firstName, @lastName, @phoneNumber, @phoneType, @email, @address, @city, @state, @zip, @initialContact, @hear, '" + DateTime.Now + "')  SELECT CAST(scope_identity() AS int)";
              
                // Define the connection to the Database:
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                // Create the SQL Command object which will send the query:
                SqlCommand sqlCommand = new SqlCommand();
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
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                // Open your connection, send the query, retrieve the results:
                sqlConnect.Open();
                int customerID = (int)sqlCommand.ExecuteScalar();
                sqlConnect.Close();

   

                sqlQuery = "INSERT INTO SERVICE(serviceCost, customerID) VALUES('', " +
                    customerID + ")  SELECT CAST(scope_identity() AS int)";

                sqlCommand.CommandText = sqlQuery;
                sqlConnect.Open();
                int serviceID = (int)sqlCommand.ExecuteScalar();
                sqlConnect.Close();
                
                if (cbService.Items[1].Selected)
                {
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
                    sqlQuery = "INSERT INTO MOVE(serviceID, serviceDeadlineStart, serviceDeadlineEnd) VALUES(" + serviceID + ", '" + serviceStartDate + "', '" + completionDate + "')";

                    sqlQuery += " INSERT INTO ADDRESSES VALUES(@serviceAddress, @serviceCity, @serviceState, @serviceState, 'mP'," + serviceID + ")";
                    sqlQuery += " INSERT INTO ADDRESSES VALUES(@destAddress, @destCity, @destState, @destState, 'mD'," + serviceID + ")";

                    sqlCommand.Parameters.Add(new SqlParameter("@serviceAddress", ServiceAddress));
                    sqlCommand.Parameters.Add(new SqlParameter("@servicecity", ServiceCity));
                    sqlCommand.Parameters.Add(new SqlParameter("@serviceState", ServiceState));
                    sqlCommand.Parameters.Add(new SqlParameter("@servicezip", ServiceZip));

                    sqlCommand.Parameters.Add(new SqlParameter("@destAddress", destAddress));
                    sqlCommand.Parameters.Add(new SqlParameter("@destcity", destCity));
                    sqlCommand.Parameters.Add(new SqlParameter("@destState", destState));
                    sqlCommand.Parameters.Add(new SqlParameter("@destzip", destZip));
                    sqlCommand.CommandText = sqlQuery;
                    sqlConnect.Open();
                    sqlCommand.ExecuteReader();
                    sqlConnect.Close();

                }
                else if (cbService.Items[0].Selected)
                {
                    String ServiceAddressA = txtAuctionAddress.Text;
                    String ServiceCityA = txtAuctionCity.Text;
                    String ServiceStateA = ddlDestinationState.SelectedValue;
                    String ServiceZipA = txtAuctionZip.Text;

                    String serviceStartDate = DateTime.Parse(txtAuctionStartDate.Text).ToString("MM/dd/yyyy HH:mm:ss");
                    DateTime serviceCompletionDate;
                    String completionDate;
                    if (String.IsNullOrEmpty(txtAuctionEndDate.Text))
                    {
                        completionDate = "";
                    }
                    else
                    {
                        serviceCompletionDate = DateTime.Parse(txtAuctionEndDate.Text);
                        completionDate = serviceCompletionDate.ToString("MM/dd/yyyy HH:mm:ss");
                    }

                    sqlQuery = "INSERT INTO Auction(serviceID, serviceDeadlineStart, serviceDeadlineEnd) VALUES(" + serviceID + ", '" + serviceStartDate + "', '" + completionDate + "')";
                    sqlQuery += " INSERT INTO ADDRESSES VALUES(@AserviceAddress, @AserviceCity, @AserviceState, @AserviceState, 'aP'," + serviceID + ")";
                    sqlCommand.Parameters.Add(new SqlParameter("@AserviceAddress", ServiceAddressA));
                    sqlCommand.Parameters.Add(new SqlParameter("@Aservicecity", ServiceCityA));
                    sqlCommand.Parameters.Add(new SqlParameter("@AserviceState", ServiceStateA));
                    sqlCommand.Parameters.Add(new SqlParameter("@Aservicezip", ServiceZipA));
                    sqlCommand.CommandText = sqlQuery;
                    sqlConnect.Open();
                    sqlCommand.ExecuteReader();
                    sqlConnect.Close();
                }

                sqlQuery = " INSERT INTO SERVICETICKET VALUES(" + Session["EmployeeID"].ToString() + ", " + serviceID + ", '" +  DateTime.Now + "'," + 1 + ")";

                sqlCommand.CommandText = sqlQuery;
                sqlConnect.Open();
                sqlCommand.ExecuteReader();
                sqlConnect.Close();

                sqlQuery += "INSERT INTO TICKETNOTE VALUES('" + DateTime.Now + "', " + serviceID + ", " + Session["EmployeeID"] + ", 'Initial Contact', @notes)";
                sqlCommand.Parameters.Add(new SqlParameter("@notes", txtNotes.Text));

                sqlCommand.CommandText = sqlQuery;
                sqlConnect.Open();
                sqlCommand.ExecuteReader();
                sqlConnect.Close();

                clearPage();

                outputLbl.Text = HttpUtility.HtmlEncode(firstName) + " " + HttpUtility.HtmlEncode(lastName) + " has been added to the customer list.";
            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "Jeremy";
            txtLastName.Text = "Loan";
            txtEmail.Text = "JeremyL@gmail.com";
            txtPhoneNumber.Text = "2349581823";
            txtAddress.Text = "258 Merry Way";
            txtCity.Text = "Harrisonburg";
            ddlState.SelectedIndex = 50;
            txtZipCode.Text = "22801";
            rdoContact.SelectedIndex = 1;
            txtHear.Text = "Online Advertisment";
            txtServiceAddress.Text = "235 Rose Court";
            txtServiceCity.Text = "Harrisonburg";
            txtServiceZip.Text = "23405";
            txtDestinationAddress.Text = "2019 Berry Way";
            txtDestinationCity.Text = "Harrisonburg";
            txtDestinationZip.Text = "28192";

            txtStartDate.Text = "2021-02-28T12:35";
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
            rfvOther.Enabled = false;
            txtAuctionAddress.Text = "";
            txtAuctionCity.Text = "";
            ddlAuctionState.SelectedValue = null;
            txtAuctionZip.Text = "";
            txtAuctionStartDate.Text = "";
            txtAuctionEndDate.Text = "";
            disableAuction();
            disableMove();
            cbService.Items[0].Selected = false;
            cbService.Items[1].Selected = false;
            panelService.Visible = false;

        }

      

        protected void dateValidation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(txtEndDate.Text))
                args.IsValid = true;
            else
                args.IsValid = Convert.ToDateTime(txtStartDate.Text) <= Convert.ToDateTime(txtEndDate.Text);
        }

        protected void rdoContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdoContact.SelectedIndex == 4)
                rfvOther.Enabled = true;
            else
                rfvOther.Enabled = false;
        }

        private void fillCustomerTable(String id)
        {
            String sqlQuery = "Select * from serviceRequest inner join Person ON serviceRequest.UserID = Person.UserID where Person.UserID = " + id;
            
            // Define the connection to the Database:
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            String serviceRequestId ="";
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                txtFirstName.Text = queryResults["FirstName"].ToString();
                txtLastName.Text = queryResults["LastName"].ToString();
                txtEmail.Text = queryResults["Username"].ToString();
                txtPhoneNumber.Text = queryResults["phoneNumber"].ToString();
                ddlPhoneNumberType.SelectedValue = queryResults["phoneType"].ToString();
                txtAddress.Text = queryResults["streetAddress"].ToString();
                txtCity.Text = queryResults["city"].ToString();
                ddlState.SelectedValue = queryResults["state"].ToString();
                txtZipCode.Text = queryResults["zipcode"].ToString();

                DateTime start = DateTime.Parse(queryResults["serviceDeadlineStart"].ToString());
                DateTime end = DateTime.Parse(queryResults["serviceDeadlineEnd"].ToString());
                txtStartDate.Text = start.ToString("yyyy-MM-ddTHH:mm");
                txtEndDate.Text = end.ToString("yyyy-MM-ddTHH:mm");

                serviceRequestId = queryResults["serviceRequestID"].ToString();
            }
            sqlConnect.Close();
            sqlConnect.Open();
            sqlQuery = "UPDATE serviceRequest SET requestStatus = 0 where serviceRequestID =" + serviceRequestId
                + "UPDATE PERSON SET new = 0 where UserID = " + id;
            sqlCommand.CommandText = sqlQuery;
            queryResults = sqlCommand.ExecuteReader();

            sqlConnect.Close();

            
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbService.Items[0].Selected && cbService.Items[1].Selected)
            {
                panelService.Visible = true;
                HtmlGenericControl listItem = this.navAuction as HtmlGenericControl;
                HtmlGenericControl listItem2 = this.navMove as HtmlGenericControl;
                this.navAuction.Attributes.Add("style", "visibility:visible");
                this.navMove.Attributes.Add("style", "visibility:visible");
                enableAuction();
                enableMove();


            }
            else if(cbService.Items[0].Selected)
            {
                panelService.Visible = true;
                HtmlGenericControl listItem = this.navAuction as HtmlGenericControl;
                HtmlGenericControl listItem2 = this.navMove as HtmlGenericControl;
                this.navAuction.Attributes.Add("style", "visibility:visible");
                this.navMove.Attributes.Add("style", "visibility:hidden");
                enableAuction();
                disableMove();
            }
            else if(cbService.Items[1].Selected)
            {
                panelService.Visible = true;
                HtmlGenericControl listItem = this.navAuction as HtmlGenericControl;
                HtmlGenericControl listItem2 = this.navMove as HtmlGenericControl;
                this.navAuction.Attributes.Add("style", "visibility:hidden");
                this.navMove.Attributes.Add("style", "visibility:visible");
                disableAuction();
                enableMove();
            }
            else
            {
                panelService.Visible = false;
                HtmlGenericControl listItem = this.navAuction as HtmlGenericControl;
                HtmlGenericControl listItem2 = this.navMove as HtmlGenericControl;
                this.navAuction.Attributes.Add("style", "visibility:hidden");
                this.navMove.Attributes.Add("style", "visibility:hidden");
                disableMove();
                disableAuction();
            }
        }

        protected void enableAuction()
        {
            rfvAuctionAddress.Enabled = true;
            rfvAuctionCity.Enabled = true;
            rfvAuctionState.Enabled = true;
            rfvAuctionZip.Enabled = true;
            rfvStartDateAuction.Enabled = true;
            auctionDateValidate.Enabled = true;
        }

        protected void disableAuction()
        {
            rfvAuctionAddress.Enabled = false;
            rfvAuctionCity.Enabled = false;
            rfvAuctionState.Enabled = false;
            rfvAuctionZip.Enabled = false;
            rfvStartDateAuction.Enabled = false;
            auctionDateValidate.Enabled = false;
        }

        protected void disableMove()
        {
            rfvServiceAddress.Enabled = false;
            rfvServiceCity.Enabled = false;
            rfvServiceState.Enabled = false;
            rfvServiceZip.Enabled = false;
            rfvStartDate.Enabled = false;

            rfvDestAddress.Enabled = false;
            rfvDestinationCity.Enabled = false;
            rfvDestinationState.Enabled = false;
            rfvDestinationZip.Enabled = false;
            dateValidation.Enabled = false;
        }

        protected void enableMove()
        {
            rfvAddress.Enabled = true;
            rfvServiceCity.Enabled = true;
            rfvServiceState.Enabled = true;
            rfvServiceZip.Enabled = true;
            rfvStartDate.Enabled = true;

            rfvDestAddress.Enabled = true;
            rfvDestinationCity.Enabled = true;
            rfvDestinationState.Enabled = true;
            rfvDestinationZip.Enabled = true;
            dateValidation.Enabled = true;
        }

        protected void auctionDateValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(txtAuctionEndDate.Text))
                args.IsValid = true;
            else
                args.IsValid = Convert.ToDateTime(txtAuctionStartDate.Text) <= Convert.ToDateTime(txtAuctionEndDate.Text);
        }
    }
}
