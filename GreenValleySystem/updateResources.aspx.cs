using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleySystem
{
    public partial class updateResources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to update resources.";
                Response.Redirect("login.aspx");
            }

            gvEmployees.DataBind();
        }


        protected void btnInsertEmployee_Click(object sender, EventArgs e)
        {
            srcEmployees.InsertParameters["password"].DefaultValue = PasswordHash.HashPassword(txtPassword.Text);
            srcEmployees.Insert();
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPosition.Text = "";
            txtPassword.Text = "";

            //String firstName = txtFirstName.Text;
            //String lastName = txtLastName.Text;
            //String position = txtPosition.Text;
            //String email = txtEmail.Text;



            //String sqlQuery = "SELECT* from Employee where currentEmployee = 1";
            //sqlQuery += "UPDATE Employee SET firstName = @firstName, lastName = @lastName, position = @position, email = @email where employeeID = @employeeID";
            //sqlQuery += "INSERT into Employee(firstName, lastName, Position, currentEmployee, email,'" + PasswordHash.HashPassword(txtPassword.Text) + "') VALUES(@firstName, @lastName, @Position, 1, @email, @password)";
            //sqlQuery += "UPDATE EMPLOYEE set currentEmployee=0 where employeeID=@employeeID";

            //SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            //SqlCommand sqlCommand = new SqlCommand();
            //sqlCommand.Connection = sqlConnect;
            //sqlCommand.CommandType = System.Data.CommandType.Text;
            //sqlCommand.CommandText = sqlQuery;

            //sqlCommand.Parameters.Add(new SqlParameter("@firstName", firstName));
            //sqlCommand.Parameters.Add(new SqlParameter("@lastName", lastName));
            //sqlCommand.Parameters.Add(new SqlParameter("@position", position));
            //sqlCommand.Parameters.Add(new SqlParameter("@email", email));


        }

        protected void lbtnNewEquipment_Click(object sender, EventArgs e)
        {
            srcEquipment.Insert();
            txtEquipmentName.Text = "";
            txtDatePurchased.Text = "";
        }
    }
}