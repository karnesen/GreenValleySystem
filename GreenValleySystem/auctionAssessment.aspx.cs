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
        public string state2 = "tab-pane fade";
        public string state3 = "tab-pane fade show active";
        public string state4 = "nav-link active";
        public string state5 = "nav-link";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must first login to view the Auction Assessment Form.";
                Response.Redirect("login.aspx");
            }


        }
        

        protected void btnEquipment_Click(object sender, EventArgs e)
        {
            srcTrucks.Insert();
            keepOpen();
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            keepOpen();
        }

        public void keepOpen()
        {
            state2 = "tab-pane fade show active";
            state3 = "tab-pane fade";
            state4 = "nav-link";
            state5 = "nav-link active";
    }
    }
}