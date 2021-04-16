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
    public partial class dateResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GetData();
            }
        }

        private void GetData()
        {
               String search = (DateTime.Parse(txtStartDate.Text)).ToString("yyyy-MM-dd");

                DataTable dt = new DataTable();
                String sqlQuery = "SELECT Customer.customerID, CUSTOMER.firstName + ' ' + CUSTOMER.lastName as customerName, Schedule.description, Schedule.confirmedDate, SERVICE.serviceType, SERVICE.serviceStatus " +
                    " FROM CUSTOMER INNER JOIN " +
                    " SERVICE ON CUSTOMER.customerID = SERVICE.customerID INNER JOIN " +
                    " Schedule ON SERVICE.serviceID = Schedule.serviceID" +
                    " where cast(confirmedDate as date) LIKE @search";

                // Define the connection to the Database:
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                // Create the SQL Command object which will send the query:
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.Add(new SqlParameter("@search",  search ));
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                // Open your connection, send the query, retrieve the results:
                sqlConnect.Open();
                SqlDataAdapter queryResults = new SqlDataAdapter(sqlCommand);
                queryResults.Fill(dt);
                gvDates.DataSource = dt;
                gvDates.DataBind();
            
        }

        protected void gvServiceAddress_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink( gvDates, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvServiceAddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvDates.SelectedRow.Cells[0].Text == "Customer")
            {
            }
            else
            {
                Session["selectedCustomer"] = gvDates.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvDates.SelectedRow.Cells[0].Text;
                Response.Redirect("customerProfile.aspx");
            }
        }
    }
}