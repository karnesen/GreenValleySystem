using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab3
{
    public partial class searchResults : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetData();
            GetData2();
            GetData3();
        }

        //private void GetData()
        //{
        //    String search = Session["search"].ToString();
        //    DataTable dt = new DataTable();
        //    String sqlQuery = "SELECT customerID, firstName +  ' ' +  lastName as customerName FROM CUSTOMER " +
        //        "WHERE((firstName LIKE @search) " +
        //        "OR(lastName LIKE  @search)" +
        //        "OR(firstName + ' ' + lastName LIKE  @search))";
        //    // Define the connection to the Database:
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
        //    // Create the SQL Command object which will send the query:
        //    SqlCommand sqlCommand = new SqlCommand();
        //    sqlCommand.Parameters.Add(new SqlParameter("@search", "%" + search + "%"));
        //    sqlCommand.Connection = sqlConnect;
        //    sqlCommand.CommandType = CommandType.Text;
        //    sqlCommand.CommandText = sqlQuery;
        //    // Open your connection, send the query, retrieve the results:
        //    sqlConnect.Open();
        //    SqlDataAdapter queryResults = new SqlDataAdapter(sqlCommand);
        //    queryResults.Fill(dt);
        //    gvCustomer.DataSource = dt;
        //    gvCustomer.DataBind();
        //}

        private void GetData2()
        {
            String search = Session["search"].ToString();
            DataTable dt = new DataTable();
            String sqlQuery = "SELECT customerID, firstName +  ' ' +  lastName as customerName, streetAddress +  ' ' +  city + ' ' + state + ' ' + zipcode as customerAddress FROM Customer " +
                "WHERE((streetAddress LIKE @search) " +
                "OR(state LIKE  @search)" +
                "OR(city LIKE @search)" +
                "OR(streetAddress + city + state + zipcode LIKE @search)" +
                "OR(zipcode LIKE  @search)" +
                "OR(firstName LIKE @search) " +
                "OR(lastName LIKE  @search)" +
                "OR(firstName + ' ' + lastName LIKE  @search))";
            // Define the connection to the Database:
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Parameters.Add(new SqlParameter("@search", "%" + search + "%"));
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            SqlDataAdapter queryResults = new SqlDataAdapter(sqlCommand);
            queryResults.Fill(dt);
            gvCustomers.DataSource = dt;
            gvCustomers.DataBind();
        }

        private void GetData3()
        {
            String search = Session["search"].ToString();
            DataTable dt = new DataTable();
            String sqlQuery = "SELECT Customer.customerID, Customer.firstName + ' ' + Customer.lastName as customerName, Addresses.addressID, Service.serviceType, Addresses.addressType, Addresses.streetAddress +  ' ' +  Addresses.city + ' ' + Addresses.state + ' ' + Addresses.zipcode as serviceAddress " +
                "from Customer inner join Service on Customer.customerID = Service.customerID inner join Addresses on Addresses.serviceID = Service.serviceID " +
                "WHERE((Addresses.streetAddress LIKE @search) " +
                "OR(Addresses.state LIKE  @search) " +
                "OR(Addresses.city LIKE @search) " +
                "OR(Addresses.streetAddress +  ' ' +  Addresses.city + ' ' + Addresses.state + ' ' + Addresses.zipcode LIKE @search) " +
                "OR(Addresses.zipcode LIKE  @search))";

            // Define the connection to the Database:
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Parameters.Add(new SqlParameter("@search", "%" + search + "%"));
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            SqlDataAdapter queryResults = new SqlDataAdapter(sqlCommand);
            queryResults.Fill(dt);
            gvServiceAddress.DataSource = dt;
            gvServiceAddress.DataBind();
        }


        protected void gvCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvCustomers, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
        protected void gvServiceAddress_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvServiceAddress, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
        protected void gvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["selectedCustomer"] = gvCustomers.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvCustomers.SelectedRow.Cells[0].Text;
                Response.Redirect("customerProfile.aspx");
            }
            catch { }
        }
        protected void gvServiceAddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["selectedCustomer"] = gvServiceAddress.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvServiceAddress.SelectedRow.Cells[0].Text;
                Response.Redirect("customerProfile.aspx");
            }
            catch { }
        }
    }
}