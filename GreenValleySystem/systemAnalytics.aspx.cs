using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Web.Configuration;

namespace GreenValleySystem
{
    public partial class systemAnalytics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view the Database Management Reports.";
                Response.Redirect("login.aspx");
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePage.aspx");
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);

            //gridviews for printing
            gvHearAbout.RenderControl(htmlwriter);
          
            gvPhonebook.RenderControl(htmlwriter);
          
            gvStorage.RenderControl(htmlwriter);
            
            gvZipCodes.RenderControl(htmlwriter);


            Response.Output.Write(stringWriter.ToString());
            Response.End();
        }
        protected void btnPrintPhonebook_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);

            gvPhonebook.RenderControl(htmlwriter);


            Response.Output.Write(stringWriter.ToString());
            Response.End();
        }

        protected void btnPrintHearAbout_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);

            //gridviews for printing
            gvHearAbout.RenderControl(htmlwriter);

           

            Response.Output.Write(stringWriter.ToString());
            Response.End();
        }

        protected void btnPrintZipCodes_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);

            //gridviews for printing


            gvZipCodes.RenderControl(htmlwriter);


            Response.Output.Write(stringWriter.ToString());
            Response.End();
        }

        protected void btnPrintStorage_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);

            //gridviews for printing


            gvStorage.RenderControl(htmlwriter);

          


            Response.Output.Write(stringWriter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void gvPhonebook_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvPhonebook.SelectedRow.Cells[0].Text == "Customer")
            {
            }
            else
            {
                Session["selectedCustomer"] = gvPhonebook.SelectedValue.ToString();
                Session["selectedCustomerName"] = gvPhonebook.SelectedRow.Cells[0].Text;
                Response.Redirect("customerProfile.aspx");
            }
        }

        protected void gvPhonebook_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvPhonebook, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void btnPrintCubes_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";

            System.IO.StringWriter stringWriter = new System.IO.StringWriter();
            HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);

            //gridviews for printing


            gvCubeSheet.RenderControl(htmlwriter);




            Response.Output.Write(stringWriter.ToString());
            Response.End();
        }

        protected void gvCubeSheet_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvCubeSheet, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void gvCubeSheet_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (gvCubeSheet.SelectedRow.Cells[0].Text == "Customer")
            //{
            //}
            //else
            //{
            //    Session["selectedCustomer"] = gvCubeSheet.SelectedValue.ToString();
            //    Session["selectedCustomerName"] = gvCubeSheet.SelectedRow.Cells[2].Text + " " + gvCubeSheet.SelectedRow.Cells[3].Text;


            //    Response.Redirect("customerProfile.aspx");
            //    //Response.Redirect("customerProfile.aspx");
            //}

            //testing
            //print
            String sqlQuery = "select COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'cubeSheet'";

            // Define the connection to the Database:
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();

            string headersString = "";
            while (queryResults.Read())
            {
                

                headersString += queryResults["COLUMN_NAME"]+" 69 ";

               

            }
            // Close all related connections
            queryResults.Close();
            sqlConnect.Close();



            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls", "selectedrows"));
            Response.Charset = "";
            //gridviews for printing


            using (System.IO.StringWriter stringWriter = new System.IO.StringWriter())
            {
                HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);
                gvCubeSheet.AllowPaging = false;
                gvCubeSheet.HeaderRow.BackColor = gvCubeSheet.HeaderRow.BackColor;
               
                

                foreach(TableCell cell in gvCubeSheet.HeaderRow.Cells)
                {
                    
                    cell.BackColor = gvCubeSheet.HeaderStyle.BackColor;
                    
                }
                foreach(GridViewRow row in gvCubeSheet.Rows)
                {
                    row.BackColor = gvCubeSheet.RowStyle.BackColor;
                    
                    foreach(TableCell cell in row.Cells)
                    {
                        if(row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = gvCubeSheet.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = gvCubeSheet.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }


                    //format header string for printing
                    List<string> headersArray = new List<string>(
                        headersString.Split(new string[] { "69" }, StringSplitOptions.None));


                    Response.Write("<table>");
                    string style = @"<style> .textmode{mso-number-format:\@;}</style>";
                    Response.Write(style);
                    Response.Write("<td></td>");
                    Response.Write("<td>Customer ID</td>");
                    Response.Write("<td>First Name</td>");
                    Response.Write("<td>Last Name</td>");
                    for (int i = 0; i < headersArray.Count; i++)
                    {
                        Response.Write("<td>");
                        Response.Write(headersArray[i]);
                        Response.Write("</td>");

                    }
                    gvCubeSheet.SelectedRow.RenderControl(htmlwriter);
                   

                    Response.Output.Write(stringWriter.ToString());
                    Response.Write("</table>");
                    Response.Flush();
                    Response.End();
                }
            }
            

            



            




            
            



        }
    }

}