﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.IO;

namespace GreenValleySystem
{
    public partial class requestAppraisal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCustomer.Text = Session["selectedCustomerName"].ToString() + " Appraisal Request";
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to create a new service.";
                Response.Redirect("login.aspx");
            }

        }

        protected void auctionDateValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(txtAuctionEndDate.Text))
                args.IsValid = true;
            else
                args.IsValid = Convert.ToDateTime(txtAuctionStartDate.Text) <= Convert.ToDateTime(txtAuctionEndDate.Text);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int customerID = Int32.Parse(Session["selectedCustomer"].ToString());

                String serviceStartDate;
                if (String.IsNullOrEmpty(txtAuctionStartDate.Text))
                {
                    serviceStartDate = "";
                }
                else
                {
                    serviceStartDate = DateTime.Parse(txtAuctionStartDate.Text).ToString("MM/dd/yyyy HH:mm:ss");
                }

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

                String sqlQuery = "INSERT INTO SERVICE(serviceOpenDate, serviceStatus, serviceDeadlineStart, serviceDeadlineEnd, serviceType, customerID) " +
                    "VALUES('" + DateTime.Now + "', 1,'" + serviceStartDate + "', '" + completionDate + "', 'P', " + customerID + " )";
                sqlQuery += " INSERT INTO Appraisal(serviceID, appraisalSize, appraisalPurpose, inventory) VALUES((select max(serviceID) from service), '', '0', '')";
                sqlQuery += " INSERT INTO TICKETNOTE (creationDate, serviceID, noteCreator, noteTitle, noteText)" +
                    "VALUES('" + DateTime.Now + "',  (select max(serviceID) from service), " + Session["EmployeeID"] + ", 'Initial Request', @notes)";

                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.Add(new SqlParameter("@notes", txtNotes.Text));

                sqlConnect.Open();
                sqlCommand.ExecuteReader();
                sqlConnect.Close();
                Response.Redirect("customerProfile.aspx");

            }
        }
    }
}