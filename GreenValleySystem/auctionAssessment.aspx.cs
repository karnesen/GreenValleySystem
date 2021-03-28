using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleySystem
{
    public partial class auctionAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Command(object sender, CommandEventArgs e)
        {
           
        }

        protected void fvAuctionAssessment_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            //switch (e.CommandName)
            //{
            //    case "Edit":
            //        fvAuctionAssessment.ChangeMode(FormViewMode.Edit);
            //        break;
            //    case "Cancel":
            //        fvAuctionAssessment.ChangeMode(FormViewMode.ReadOnly);
            //        break;
            //    case "Update":
            //        srcAuctionAssessment.Update();
            //        break;
            //}
            //fvAuctionAssessment.DataBind();
        }


    }
}