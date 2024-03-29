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
    public partial class requestAuction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to create a new service.";
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                fillStates();
            }
        }

        protected void fillStates()
        {
            List<String> states = new List<String> { "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "VI", "WA", "WV", "WI", "WY" };
            foreach (String i in states)
            {
                ddlAuctionState.Items.Add(new ListItem(i));
            }
        }

        protected void auctionDateValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (String.IsNullOrEmpty(txtAuctionEndDate.Text))
                args.IsValid = true;
            else
                args.IsValid = Convert.ToDateTime(txtAuctionStartDate.Text) <= Convert.ToDateTime(txtAuctionEndDate.Text);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtAuctionAddress.Text = "";
            txtAuctionCity.Text = "";
            ddlAuctionState.SelectedValue = null;
            txtAuctionZip.Text = "";
            txtAuctionStartDate.Text = "";
            txtAuctionEndDate.Text = "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int customerID = Int32.Parse(Session["customerID"].ToString());
                String ServiceAddressA = txtAuctionAddress.Text;
                String ServiceCityA = txtAuctionCity.Text;
                String ServiceStateA = ddlAuctionState.SelectedValue;
                String ServiceZipA = txtAuctionZip.Text;

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
                    "VALUES('" + DateTime.Now + "', 1,'" + serviceStartDate + "', '" + completionDate + "', 'A', " + customerID + " )";
                sqlQuery += " INSERT INTO Auction(serviceID) VALUES((select max(serviceID) from service))";
                sqlQuery += " INSERT INTO ADDRESSES VALUES(@AserviceAddress, @AserviceCity, @AserviceState, @AserviceState, 'P', (select max(serviceID) from service))";
                sqlQuery += " INSERT INTO TICKETNOTE (creationDate, serviceID, noteTitle, noteText)" +
                    "VALUES('" + DateTime.Now + "',  (select max(serviceID) from service), 'Customer Initial Request', @notes)";


                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.Add(new SqlParameter("@AserviceAddress", ServiceAddressA));
                sqlCommand.Parameters.Add(new SqlParameter("@Aservicecity", ServiceCityA));
                sqlCommand.Parameters.Add(new SqlParameter("@AserviceState", ServiceStateA));
                sqlCommand.Parameters.Add(new SqlParameter("@Aservicezip", ServiceZipA));
                sqlCommand.Parameters.Add(new SqlParameter("@notes", txtNotes.Text));

                sqlConnect.Open();
                sqlCommand.ExecuteReader();
                sqlConnect.Close();

                Response.Redirect("customerHome.aspx");

            }
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            txtAuctionAddress.Text = "235 Rose Court";
            txtAuctionCity.Text = "Harrisonburg";
            txtAuctionZip.Text = "23405";
            ddlAuctionState.SelectedIndex = 50;

            txtAuctionStartDate.Text = "2021-03-16T12:35";
            txtAuctionEndDate.Text = "2021-03-28T12:35";
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
