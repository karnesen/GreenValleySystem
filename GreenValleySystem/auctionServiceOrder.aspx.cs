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
    public partial class auctionServiceOrder : System.Web.UI.Page
    {
        public string pickupCollapse = "list-group-item collapse";
        protected void Page_Load(object sender, EventArgs e)
        {
            String sqlQuery = "Select pickup from auctionAssessment where pickup=1 and serviceID = " + Session["selectedService"].ToString();

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
                pickupCollapse = "list-group-item";
            }
            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();
        }


        protected void btnStorage_Click(object sender, EventArgs e)
        {
            srcStorage.Insert();
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {

        }
    }
}