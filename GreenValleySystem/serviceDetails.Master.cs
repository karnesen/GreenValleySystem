using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleySystem
{
    public partial class serviceDetails : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if((Session["serviceType"].ToString()).Equals("Move"))
            {
                lookAt.NavigateUrl = "moveLookAt.aspx";
                schedule.NavigateUrl = "moveSchedule.aspx";
            }
            else
            {
            }
        }
    }
}