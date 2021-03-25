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
            GetData();
        }

        private void GetData()
        {
            String search = Session["search"].ToString();
            DataTable dt = new DataTable();
            String sqlQuery = "SELECT customerID, firstName +  ' ' +  lastName as customerName FROM CUSTOMER " +
                "WHERE((firstName LIKE @search) " +
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
            gvCustomer.DataSource = dt;
            gvCustomer.DataBind();
        }

        protected void gvCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvCustomer, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["selectedCustomer"] = gvCustomer.SelectedValue.ToString();
            Session["selectedCustomerName"] = gvCustomer.SelectedRow.Cells[0].Text;
            Response.Redirect("customerProfile.aspx");
        }
    }
}