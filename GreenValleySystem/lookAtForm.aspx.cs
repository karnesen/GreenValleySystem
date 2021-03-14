using System;
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
    public partial class lookAtForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            setTitle();
        }

        protected void setTitle()
        {
            String sqlQuery = "SELECT CUSTOMER.firstName, CUSTOMER.lastName, SERVICE.lookAtDate FROM CUSTOMER INNER JOIN" +
                  " SERVICE ON CUSTOMER.customerID = SERVICE.customerID";
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
                lblLookAtForm.Text = queryResults["firstName"].ToString() + " " + queryResults["lastName"].ToString() + " Look At Form";
            }
        }
    }
}