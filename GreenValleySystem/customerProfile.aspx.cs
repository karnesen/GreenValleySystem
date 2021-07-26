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

namespace GreenValleySystem
{
    public partial class customerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view a customer.";
                Response.Redirect("login.aspx");
            }

        }

        protected void gvCustomerTickets_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvCustomerTickets, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }

        protected void gvCustomerTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvCustomerTickets.SelectedRow.Cells[2].Text == "Status")
            {
            }
            else
            {
                Session["selectedService"] = gvCustomerTickets.SelectedValue.ToString();
                Session["serviceType"] = (gvCustomerTickets.SelectedRow.FindControl("lblService") as Label).Text;
                Response.Redirect("editTicket.aspx");
            }
        }

        protected void lvNotes_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvNotes.FindControl("dataPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        }

        protected void btnCreateNote_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String sqlQuery = "INSERT INTO TICKETNOTE(creationDate, customerID, noteCreator, noteTitle, noteText) VALUES('" +
                    DateTime.Now +
                    "', " + Session["selectedCustomer"].ToString() +
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
                lvNotes.DataBind();
            }
        }

        protected void btnNewMove_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveRequest.aspx");
        }

        protected void btnNewAuction_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionRequest.aspx");
        }

        protected void btnNewAppraisal_Click(object sender, EventArgs e)
        {
            Response.Redirect("requestAppraisal.aspx");
        }

        protected void ddlFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if(ddlFilter.SelectedValue=="x")
                srcNotes.FilterExpression = null;

            else if(ddlFilter.SelectedValue == "e")
                srcNotes.FilterExpression = "serviceType IS NULL";

            else
                srcNotes.FilterExpression = "serviceType='" + ddlFilter.SelectedValue + "'";
        }

        protected void btnMap_Click(object sender, EventArgs e)
        {
            string sqlQuery = "Select * from Customer where customerID =" + Session["selectedCustomer"];
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
                string address = queryResults["streetAddress"].ToString();
                string city = queryResults["city"].ToString();
                string state = queryResults["state"].ToString();
                string zipcode = queryResults["zipcode"].ToString();

                string url = "https://www.google.com/maps/place/"+address+"+"+city+"+"+state+"+"+zipcode;

                string script = string.Format("window.open('{0}');", url);

                Page.ClientScript.RegisterStartupScript(this.GetType(),
                    "newPage" + UniqueID, script, true);
            }
            sqlConnect.Close();

        }
    }
}