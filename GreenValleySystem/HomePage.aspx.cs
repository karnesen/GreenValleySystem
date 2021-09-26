//Kirsi And Josh Coleman 2/15/21
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace Lab2
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view employee home.";
                Response.Redirect("login.aspx");
            }
            if (!IsPostBack)
            {
                //GetData();
            }
        }

        protected void gvCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvCustomerTickets, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
        protected void gvCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvCustomerTickets.SelectedRow.Cells[0].Text == "Customer")
            {
            }
            else
            {
                Session["selectedCustomer"] = gvCustomerTickets.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvCustomerTickets.SelectedRow.Cells[0].Text + " " + gvCustomerTickets.SelectedRow.Cells[1].Text;
                Response.Redirect("customerProfile.aspx");
            }

        }

        protected void gvCustomerTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCustomerTickets.PageIndex = e.NewPageIndex;
            this.DataBind();
        }

        protected void lnkNote_Click(object sender, EventArgs e)
        {
          
        }

        protected void gvNotesRecent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvNotesRecent, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvNotesRecent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvNotesRecent.SelectedRow.Cells[0].Text == "Customer")
            {
            }
            else
            {
                Session["selectedCustomer"] = gvNotesRecent.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvNotesRecent.SelectedRow.Cells[0].Text + " " + gvNotesRecent.SelectedRow.Cells[1].Text;
                Response.Redirect("customerProfile.aspx");
            }
        }

        protected void gvNotesRecent_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvNotesRecent.PageIndex = e.NewPageIndex;
            this.DataBind();
        }

        protected void gvUpcomingServices_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUpcomingServices.PageIndex = e.NewPageIndex;
            this.DataBind();
        }

        protected void gvUpcomingServices_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvUpcomingServices.SelectedRow.Cells[0].Text == "Customer")
            {
            }
            else
            {
                Session["selectedCustomer"] = gvUpcomingServices.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvUpcomingServices.SelectedRow.Cells[0].Text + " " + gvUpcomingServices.SelectedRow.Cells[1].Text;
                Response.Redirect("customerProfile.aspx");
            }
        }

        protected void gvUpcomingServices_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvUpcomingServices, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void btnNewGlobalNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("setGlobalNotes.aspx");
        }

        //private void GetData()
        //{
        //    DataTable dt = new DataTable();
        //    String sqlQuery = "SELECT serviceTICKET.serviceTicketID, TICKETHOLDER.note as Note, TICKETHOLDER.creationDate as 'Assigned On:'" +
        //        "FROM serviceTICKET INNER JOIN TICKETHOLDER ON serviceTICKET.serviceTicketID = TICKETHOLDER.serviceTicketID " +
        //        "WHERE TICKETHOLDER.creationDate = (select max(creationDate) from TICKETHOLDER where serviceTicketID = serviceTICKET.serviceTicketID) " +
        //        "AND TICKETHOLDER.employeeID = " + Session["EmployeeID"];
        //    // Define the connection to the Database:
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
        //    // Create the SQL Command object which will send the query:
        //    SqlCommand sqlCommand = new SqlCommand();
        //    sqlCommand.Connection = sqlConnect;
        //    sqlCommand.CommandType = CommandType.Text;
        //    sqlCommand.CommandText = sqlQuery;
        //    // Open your connection, send the query, retrieve the results:
        //    sqlConnect.Open();
        //    SqlDataAdapter queryResults = new SqlDataAdapter(sqlCommand);
        //    queryResults.Fill(dt);
        //    gvWork.DataSource = dt;
        //    gvWork.DataBind();
        //}

        //protected void gvWork_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvWork, "Select$" + e.Row.RowIndex);
        //        e.Row.Attributes["style"] = "cursor:pointer";
        //        e.Row.Attributes["onmouseover"] = "this.style.backgroundColor = '#c8e4b6'";
        //        e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white'";
        //    }
        //}

        //protected void gvWork_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Session["selectedService"] = gvWork.SelectedValue.ToString();
        //    Response.Redirect("editTicket.aspx", false);
        //}

    }
}