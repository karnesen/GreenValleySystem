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
    public partial class setGlobalNotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view employee home.";
                Response.Redirect("login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.ToString();
            string text = txtText.Text.ToString();
            string author = Session["EmployeeID"].ToString();
            string date = DateTime.Now.ToString();
            string completed = ddlCompleted.SelectedValue.ToString();
            string crew = "";
            

            foreach(ListItem item in cbxCrew.Items)
            {
                if(item.Selected)
                {
                    crew += item.Value.ToString() + "; ";
                }
                else
                {
                    //nothing
                }
            }

            string sqlQuery = "insert into globalNotes(noteTitle, noteText, noteAuthor, noteReciever, creationDate, completed) VALUES(" +
                "'"+title+"',"+
                "'"+text+"',"+
                "'"+author+"',"+
                "'"+crew+"',"+
                "'"+date+"',"+
                "'"+completed+"')";

            // Define the connection to the Database:
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            sqlCommand.ExecuteReader();
            sqlConnect.Close();


            Response.Redirect("HomePage.aspx");
        }
    }
}