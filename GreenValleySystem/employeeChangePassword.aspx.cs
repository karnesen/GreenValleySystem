using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace GreenValleySystem
{
    public partial class employeeChangePassword : System.Web.UI.Page
    {
        string strConnString = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        string str = null;
        SqlCommand com;
        byte up;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "SELECT passwordHash, employeeID from employee where employeeID=" + Session["employeeID"].ToString();
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();
            while (reader.Read())
            {
                string storedHash = reader["passwordHash"].ToString();
                if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                {
                    Session["employeeID"] = reader["employeeID"];
                    up = 1;
                }
            }
            reader.Close();
            con.Close();
            if (up == 1)
            {
                con.Open();
                str = "UPDATE employee set PasswordHash=@PasswordHash where employeeID='" + Session["employeeID"].ToString() + "'";
                com = new SqlCommand(str, con);
                com.Parameters.Add(new SqlParameter("@PasswordHash", PasswordHash.HashPassword(txtPassword1.Text)));
                com.ExecuteNonQuery();
                con.Close();



                lblMessage.Text = "Password successfully changed!";
            }
            else
            {
                lblMessage.Text = "Current password is invalid!";
            }
        }
    }
}