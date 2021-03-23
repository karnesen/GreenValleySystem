//Kirsi And Josh Coleman 2/15/21
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

using System.Web.UI.HtmlControls;

namespace Lab2
{
    public partial class editTicket : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view a ticket.";
                Response.Redirect("LoginPage.aspx");
            }

        }


        protected void gvNotes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvNotes, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvNotes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ticketID"] = gvNotes.SelectedValue.ToString();
            Response.Redirect("noteDetails.aspx");
        }

        protected void btnNewNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("createNotes.aspx");
        }

        protected void btnCreateNote_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String sqlQuery = "INSERT INTO TICKETNOTE(creationDate, serviceID, noteCreator, noteTitle, noteText) VALUES('" +
                    DateTime.Now +
                    "', " + Session["selectedService"].ToString() +
                    ", " + Session["EmployeeID"].ToString() +
                    ", @noteName, @noteText)";


                // Define the connection to the Database:
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
                // Create the SQL Command object which will send the query:
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Parameters.Add(new SqlParameter("@noteName", txtNoteTitle.Text));
                sqlCommand.Parameters.Add(new SqlParameter("@noteText", txtNoteBody.Text));
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                // Open your connection, send the query, retrieve the results:
                sqlConnect.Open();
                sqlCommand.ExecuteReader();
                sqlConnect.Close();
                gvNotes.DataBind();
            }
        }

        protected void btnNewAddress_Click(object sender, EventArgs e)
        {
            srcServiceAddresses.Insert();
        }

        //protected void btnAssign_Click(object sender, EventArgs e)
        //{
        //    String sqlQuery = "INSERT INTO TICKETHOLDER VALUES('"
        //        + DateTime.Now + "', "
        //        + ddlEmployee.SelectedValue + ", "
        //        + ddlServices.SelectedValue + ", @assignNote )";
        //    // Define the connection to the Database:
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
        //    // Create the SQL Command object which will send the query:
        //    SqlCommand sqlCommand = new SqlCommand();
        //    sqlCommand.Parameters.Add(new SqlParameter("@assignNote", txtAssignTicket.Text));
        //    sqlCommand.Connection = sqlConnect;
        //    sqlCommand.CommandType = CommandType.Text;
        //    sqlCommand.CommandText = sqlQuery;
        //    // Open your connection, send the query, retrieve the results:
        //    sqlConnect.Open();
        //    SqlDataReader queryResults = sqlCommand.ExecuteReader();
        //    sqlConnect.Close();

        //    gvHolder.DataBind();
        //    txtAssignTicket.Text = "";
        //    ddlEmployee.SelectedIndex = -1;
        //    setCurrent();
        //}

        //private void setCurrent()
        //{
        //    int selected = Int32.Parse(ddlServices.SelectedValue);

        //    String sqlQuery = "SELECT EMPLOYEE.firstName + ' ' + EMPLOYEE.lastName as Name, TICKETHOLDER.creationDate " +
        //        " FROM EMPLOYEE INNER JOIN TICKETHOLDER ON EMPLOYEE.employeeID = TICKETHOLDER.employeeID " +
        //        " Where TICKETHOLDER.serviceTicketID = " + selected +
        //        " AND TICKETHOLDER.creationDate = (select max(creationDate) from TICKETHOLDER where serviceTicketID = " + selected + ")";


        //    // Define the connection to the Database:
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
        //    // Create the SQL Command object which will send the query:
        //    SqlCommand sqlCommand = new SqlCommand();
        //    sqlCommand.Connection = sqlConnect;
        //    sqlCommand.CommandType = CommandType.Text;
        //    sqlCommand.CommandText = sqlQuery;
        //    // Open your connection, send the query, retrieve the results:
        //    sqlConnect.Open();
        //    SqlDataReader queryResults = sqlCommand.ExecuteReader();
        //    String employee = "";
        //    while (queryResults.Read())
        //    {
        //        employee = queryResults["Name"].ToString();
        //    }
        //    sqlConnect.Close();
        //    lblCurrent.Text = "Current Ticket Holder: " + HttpUtility.HtmlEncode(employee);
        //}


        //protected void btnAddInventory_Click(object sender, EventArgs e)
        //{
        //    Session["serviceIDInventory"] = ddlServices.SelectedValue;
        //    Response.Redirect("InventoryAdd.aspx");

        //}








    }
}