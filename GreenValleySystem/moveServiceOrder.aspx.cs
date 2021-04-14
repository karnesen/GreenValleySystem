﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GreenValleySystem
{
    public partial class moveServiceOrder : System.Web.UI.Page
    {
        public string pickupCollapse = "list-group-item collapse";
        public string packingCollapse = "list-group-item collapse";

        protected void Page_Load(object sender, EventArgs e)
        {
            String sqlQuery = "Select pickup, packing from moveAssessment where serviceID = " + Session["selectedService"].ToString();

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
            while (queryResults.Read())
            {
                if (queryResults.GetBoolean(0))
                    pickupCollapse = "list-group-item";
                if (queryResults.GetBoolean(1))
                    packingCollapse = "list-group-item";
            }
            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();
        }
    }
}