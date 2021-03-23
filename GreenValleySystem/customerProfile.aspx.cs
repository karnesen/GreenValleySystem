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


        }

        protected void gvCustomerTickets_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(gvCustomerTickets, "Select$" + e.Row.RowIndex);
            e.Row.Attributes["style"] = "cursor:pointer";
        }

        protected void gvCustomerTickets_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["selectedService"] = gvCustomerTickets.SelectedValue.ToString();
            Response.Redirect("editTicket.aspx");
        }


        protected void btnNewMove_Click(object sender, EventArgs e)
        {
            Response.Redirect("MoveRequest.aspx");
        }

        protected void btnNewAuction_Click(object sender, EventArgs e)
        {
            Response.Redirect("AuctionRequest.aspx");
        }
    }
}