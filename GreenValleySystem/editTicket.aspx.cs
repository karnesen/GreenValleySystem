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
using Amazon;
using Amazon.S3;
using Amazon.S3.Transfer;


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
            GenerateDownloadLinks();
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
            folder = Server.MapPath("~/forms/" + Session["selectedCustomer"].ToString() + "/");

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
                    lblResult.Text = fileName + " file already exists in the database!";
                    lblResult.ForeColor = System.Drawing.Color.Red;

                }
                else
                {
                    oFile.PostedFile.SaveAs(filePath);
                    lblResult.Text = fileName + " has been successfully uploaded!";
                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
            }
            else
            {
                lblResult.Text = "Click 'Browse' to select the file to upload.";
            }
            //displayyyyyyyyyy
            panelConfirm.Visible = true;
            DataListContent.DataBind();
        }

        private void GenerateDownloadLinks()
        {
            string path = Server.MapPath("~/forms/" + Session["selectedCustomer"].ToString() + "/");
            if (Directory.Exists(path))
            {
                DataTable ShowContent = new DataTable();
                ShowContent.Columns.Add("Icon", typeof(string));
                ShowContent.Columns.Add("DownloadLink", typeof(string));
                ShowContent.Columns.Add("FileName", typeof(string));
                DirectoryInfo di = new DirectoryInfo(path);
                foreach (FileInfo fi in di.GetFiles())
                {
                    DataRow dr = ShowContent.NewRow();
                    dr["FileName"] = fi.Name;
                    dr["DownloadLink"] = Server.MapPath("~/forms/" + Session["selectedCustomer"].ToString() + "/") + fi.Name;
                    string ext = Path.GetExtension(fi.FullName);
                    switch (ext)
                    {
                        case "pdf":
                            dr["Icon"] = ResolveUrl("~/images/PdfIcon.png");
                            break;
                        case "doc":
                            dr["Icon"] = ResolveUrl("~/images/DocIcon.png");
                            break;
                        case "xls":
                            dr["Icon"] = ResolveUrl("~/images/ExcelIcon.png");
                            break;
                        case "txt":
                            dr["Icon"] = ResolveUrl("~/images/TxtIcon.png");
                            break;
                        case "zip":
                            dr["Icon"] = ResolveUrl("~/images/ZipIcon.png");
                            break;
                    }
                    ShowContent.Rows.Add(dr);
                    
                }
                DataListContent.DataSource = ShowContent;
                DataListContent.DataBind();
            }
        }

        protected void ButtonDownloadContent(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string path = e.CommandArgument.ToString();
                string name = Path.GetFileName(path);
                string ext = Path.GetExtension(path);
                Response.AppendHeader("content-disposition", "attachment; filename=" + name);
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(path);
                Response.End();
            }
        }

        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            GenerateDownloadLinks();
        }

        
    }
    }
