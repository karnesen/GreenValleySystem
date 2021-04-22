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
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web.SessionState;
using System.IO;


namespace Lab2
{
    public partial class editTicket : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view a ticket.";
                Response.Redirect("login.aspx");
            }

        }

        protected void btnNewAddress_Click(object sender, EventArgs e)
        {
            srcServiceAddresses.Insert();
            txtAddress.Text = "";
            txtCity.Text = "";
            txtZipCode.Text = "";
            ddlState.SelectedIndex = -1;
        }

        protected void btnImageupload_Click(object sender, EventArgs e)
        {
            string fileName;
            string filePath;
            string folder;
            folder = Server.MapPath("~/images/");

            //retrieve name of posted file
            fileName = oFile.PostedFile.FileName;
            fileName = Path.GetFileName(fileName);


            if (oFile.Value != "")
            {
                //create folderz
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
                //save to server
                filePath = folder + fileName;
                if (File.Exists(filePath))
                {
                    lblResult.Text = fileName + "file already exists in the database!";
                    lblResult.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    oFile.PostedFile.SaveAs(filePath);
                    lblResult.Text = fileName + "has been successfully uploaded!";
                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                lblResult.Text = "Click 'Browse' to select the file to upload.";
            }
            //displayyyyyyyyyy
            panelConfirm.Visible = true;
        }
    }
}