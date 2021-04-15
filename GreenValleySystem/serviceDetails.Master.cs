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
        public string state2 = "tab-pane fade";
        public string state3 = "tab-pane fade show active";
        public string state4 = "nav-link active";
        public string state5 = "nav-link";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["serviceType"].ToString()).Equals("Move"))
                {
                    lookAt.NavigateUrl = "moveAssessment.aspx";
                    serviceOrder.NavigateUrl = "moveServiceOrder.aspx";
                }
                else if ((Session["serviceType"].ToString()).Equals("Appraisal"))
                {
                    lookAt.NavigateUrl = "";
                    lookAt.Text = "";
                }
                else
                {
                    lookAt.NavigateUrl = "auctionAssessment.aspx";
                    serviceOrder.NavigateUrl = "auctionServiceOrder.aspx";
                }
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

        protected void keepOpen_Click(object sender, EventArgs e)
        {
            state = "collapse show";
            state2 = "tab-pane fade show active";
            state3 = "tab-pane fade";
            state4 = "nav-link";
            state5 = "nav-link active";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            state = "collapse show";
            state3 = "tab-pane fade";
            state2 = "tab-pane fade show active";
            fvDates.ChangeMode(FormViewMode.Insert);
            state4 = "nav-link";
            state5 = "nav-link active";
            lvSchedules.DataBind();
        }

        protected void LinkButtonEvent_Click(object sender, EventArgs e)
        {
            LinkButton link = (LinkButton)sender;
            Session["selectedDescription"] = link.Text;
            state = "collapse show";
            state3 = "tab-pane fade";
            state2 = "tab-pane fade show active";
            fvDates.ChangeMode(FormViewMode.ReadOnly);
            state4 = "nav-link";
            state5 = "nav-link active";

        }

        protected void srcDates_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            lvSchedules.DataBind();
        }

        protected void srcDates_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            lvSchedules.DataBind();
        }

        protected void ddlProgress_SelectedIndexChanged(object sender, EventArgs e)
        {
            srcProgress.Insert();
            lvHistory.DataBind();
            fvCurrent.DataBind();
        }

        //protected void fvProgress_DataBinding(object sender, EventArgs e)
        //{
        //    DropDownList ddlProgress = (DropDownList)(sender);

        //    if ((Session["serviceType"].ToString()).Equals("Move"))
        //    {
        //        ddlProgress.Items.Add(new ListItem("Contact Information Gathered", "Contact Information Gathered"));
        //        ddlProgress.Items.Add(new ListItem("Ready To Schedule Assessment", "Ready To Schedule Assessment"));
        //        ddlProgress.Items.Add(new ListItem("Move Assessment Scheduled","Move Assessment Scheduled"));
        //        ddlProgress.Items.Add(new ListItem("Initial Estimate Sent", "Initial Estimate Sent"));
        //        ddlProgress.Items.Add(new ListItem("Waiting for Estimate Response", "Waiting for Estimate Response"));
        //        ddlProgress.Items.Add(new ListItem("Ready to Schedule Move Service", "Ready to Schedule Move Service"));
        //        ddlProgress.Items.Add(new ListItem("Move Service Schedule", "Move Service Schedule"));
        //        ddlProgress.Items.Add(new ListItem("Service Completed", "Service Completed"));
        //    }
        //    else if ((Session["serviceType"].ToString()).Equals("Auction"))
        //    {
        //        ddlProgress.Items.Add(new ListItem("Contact Information Gathered", "Contact Information Gathered"));
        //        ddlProgress.Items.Add(new ListItem("Ready to Schedule Assessment", "Ready to Schedule Assessment"));
        //        ddlProgress.Items.Add(new ListItem("Auction Assessment Scheduled", "Auction Assessment Scheduled"));
        //        ddlProgress.Items.Add(new ListItem("Present Proposal", "Present Proposal"));
        //        ddlProgress.Items.Add(new ListItem("Waiting for Proposal Response", "Waiting for Proposal Response"));
        //        ddlProgress.Items.Add(new ListItem("Ready to Schedule Auction"));
        //        ddlProgress.Items.Add(new ListItem("Auction Pick Up Scheduled", "Auction Pick Up Scheduled"));
        //        ddlProgress.Items.Add(new ListItem("Trash Removal Scheduled", "Trash Removal Scheduled"));
        //        ddlProgress.Items.Add(new ListItem("Items in Storage", "Items in Storage"));
        //        ddlProgress.Items.Add(new ListItem("Auction Scheduled", "Auction Scheduled"));
        //        ddlProgress.Items.Add(new ListItem("Service Completed", "Service Completed"));
        //    }

        //    ddlProgress.SelectedValue = Bind("currentStep");
        //}
    }
}