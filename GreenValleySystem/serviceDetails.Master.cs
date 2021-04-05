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

namespace GreenValleySystem
{
    public partial class serviceDetails : System.Web.UI.MasterPage
    {
        public string state = "collapse";
        protected void Page_Load(object sender, EventArgs e)
        {
            if((Session["serviceType"].ToString()).Equals("Move"))
            {
                lookAt.NavigateUrl = "moveAssessment.aspx";
            }
            else
            {
                lookAt.NavigateUrl = "auctionAssessment.aspx";
            }
            if(!IsPostBack)
            {

            }    
        }

        protected void lvNotes_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvNotes.FindControl("dataPager") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            state = "collapse show";
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
                lvNotes.DataBind();
            }
        }

    }
}