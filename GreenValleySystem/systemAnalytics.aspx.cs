using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GreenValleySystem
{
    public partial class systemAnalytics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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


    }

}