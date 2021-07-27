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
    public partial class moveAssessment : System.Web.UI.Page
    {
        
        public string stateNav1 = "nav-link active";
        public string stateNav2 = "nav-link";
        public string stateNav3 = "nav-link";
        public string stateNav4 = "nav-link";
        public string stateTab1 = "tab-pane fade show active";
        public string stateTab2 = "tab-pane fade";
        public string stateTab3 = "tab-pane fade";
        public string stateTab4 = "tab-pane fade";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Session["InvalidUse"] = "You must be logged in to view this page.";
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
        protected void btnEquipment_Click(object sender, EventArgs e)
        {
            srcTrucks.Insert();
            tabTwoOpen();
        }

        protected void lnkButtonSave_Click(object sender, EventArgs e)
        {
            tabTwoOpen();
;        }

        public void tabTwoOpen()
        {
            stateNav1 = "nav-link";
            stateNav2 = "nav-link active";
            stateNav3 = "nav-link";
            stateNav4 = "nav-link";
            stateTab1 = "tab-pane fade";
            stateTab2 = "tab-pane fade show active";
            stateTab3 = "tab-pane fade";
            stateTab4 = "tab-pane fade";
        }

        public void tabThreeOpen()
        {
            stateNav1 = "nav-link";
            stateNav2 = "nav-link";
            stateNav3 = "nav-link active";
            stateNav4 = "nav-link";
            stateTab1 = "tab-pane fade";
            stateTab2 = "tab-pane fade";
            stateTab3 = "tab-pane fade show active";
            stateTab4 = "tab-pane fade";
        }

        public void tabFourOpen()
        {
            stateNav1 = "nav-link";
            stateNav2 = "nav-link";
            stateNav3 = "nav-link";
            stateNav4 = "nav-link active";
            stateTab1 = "tab-pane fade";
            stateTab2 = "tab-pane fade";
            stateTab3 = "tab-pane fade";
            stateTab4 = "tab-pane fade show active";
        }

        protected void btnSaveTab3_Click(object sender, EventArgs e)
        {
            tabThreeOpen();
        }

        protected void btnHandout_Click(object sender, EventArgs e)
        {
            tabFourOpen();
        }

        
        //protected void btnPrint_Click(object sender, EventArgs e)
        //{
        //    tabFourOpen();
        //    Response.Clear();
        //    Response.Buffer = true;
        //    Response.ContentType = "application/ms-excel";
        //    Response.AddHeader("content-disposition", string.Format("attachment;filename={0}.xls","selectedrows"));
        //    Response.Charset = "";

        //    System.IO.StringWriter stringWriter = new System.IO.StringWriter();
        //    HtmlTextWriter htmlwriter = new HtmlTextWriter(stringWriter);
        //    gvHandout.RenderControl(htmlwriter);
        //    Response.Output.Write(stringWriter.ToString());
        //    Response.End();

            
            
           
        //}

        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }

        protected void btnCubeCalc_Click(object sender, EventArgs e)
        {
            stateNav1 = "nav-link";
            stateNav2 = "nav-link";
            stateNav3 = "nav-link active";
            stateNav4 = "nav-link";
            stateTab1 = "tab-pane fade";
            stateTab2 = "tab-pane fade";
            stateTab3 = "tab-pane fade show active";
            stateTab4 = "tab-pane fade";


            //245 inputs...



            string sqlQuery = "SELECT cubeSheet.* FROM cubeSheet INNER JOIN SERVICE ON cubeSheet.serviceID = SERVICE.serviceID INNER JOIN CUSTOMER ON SERVICE.customerID ="+ Session["selectedCustomer"];

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Connect"].ConnectionString);
            // Create the SQL Command object which will send the query:
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            // Open your connection, send the query, retrieve the results:
            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            while (queryResults.Read())
            {
                // Column 1
                string bar = queryResults["bar"].ToString();
                int Bar = Int16.Parse(bar);
                Bar = Bar * 15;

                string pianoBench = queryResults["pianoBench"].ToString();
                int PianoBench = Int16.Parse(pianoBench);
                PianoBench = PianoBench * 5;

                string largeBookcase = queryResults["largeBookcase"].ToString();
                int LargeBookcase = Int16.Parse(largeBookcase);
                LargeBookcase = LargeBookcase * 20;

                string bookShelves = queryResults["bookShelves"].ToString();
                int BookShelves = Int16.Parse(bookShelves);
                BookShelves = BookShelves * 2;

                string cabinet = queryResults["cabinet"].ToString();
                int Cabinet = Int16.Parse(cabinet);
                Cabinet = Cabinet * 10;

                string straightChair = queryResults["straightChair"].ToString();
                int StraightChair = Int16.Parse(straightChair);
                StraightChair = StraightChair * 5;

                string armChair = queryResults["armChair"].ToString();
                int ArmChair = Int16.Parse(armChair);
                ArmChair = ArmChair * 10;

                string rockerChair = queryResults["rockerChair"].ToString();
                int RockerChair = Int16.Parse(rockerChair);
                RockerChair = RockerChair * 12;

                string occasionalChair = queryResults["occasionalChair"].ToString();
                int OccasionalChair = Int16.Parse(occasionalChair);
                OccasionalChair = OccasionalChair * 15;

                string overStuffedChair = queryResults["overStuffedChair"].ToString();
                int OverStuffedChair = Int16.Parse(overStuffedChair);
                OverStuffedChair = OccasionalChair * 25;

                string cedarChest = queryResults["cedarChest"].ToString();
                int CedarChest = Int16.Parse(cedarChest);
                CedarChest = CedarChest * 15;

                string computer = queryResults["computer"].ToString();
                int Computer = Int16.Parse(computer);
                Computer = Computer * 10;

                string smallDesk = queryResults["smallDesk"].ToString();
                int SmallDesk = Int16.Parse(smallDesk);
                SmallDesk = SmallDesk * 22;


                //column1 (living dining and kitchen)
                int column1 = Bar + PianoBench + LargeBookcase + BookShelves + Cabinet + StraightChair + ArmChair + RockerChair + OccasionalChair + OverStuffedChair + CedarChest + Computer + SmallDesk;
                //column2 (bedroom nursery and porch/outdoor)
                int column2=0;
                //column3 (appliances and misc)
                int column3=0;
                //column4 (cartons)
                int column4 = 0;
                //total
                int total = column1+column2+column3+column4;


                //assing labels
                lblColumnOne.Text = "Living Room, Dining Room, and Kitchen: " + column1.ToString();
                lblColumnTwo.Text = "Bedrooms, Nursery, and Porch/Outdoors: " + column2.ToString();
                lblColumnThree.Text = "Appliances and Misc: " + column3.ToString();
                lblPacking.Text = "Total Cartons in Cubic Feet: " + column4.ToString();
                lblCubeTotal.Text = "Total Cubic Feet: " + total.ToString();



            }
            sqlConnect.Close();
        }
    }

}