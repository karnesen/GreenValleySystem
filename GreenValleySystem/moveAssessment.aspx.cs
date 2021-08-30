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



            //string sqlQuery = "SELECT cubeSheet.* FROM cubeSheet INNER JOIN SERVICE ON cubeSheet.serviceID = SERVICE.serviceID INNER JOIN CUSTOMER ON SERVICE.customerID ="+ Session["selectedCustomer"];

            string sqlQuery = "SELECT CUSTOMER.customerID, CUSTOMER.firstName, CUSTOMER.lastName, cubeSheet.*, SERVICE.serviceID AS Expr1 FROM cubeSheet INNER JOIN SERVICE ON cubeSheet.serviceID ="+ Session["SelectedService"]+" INNER JOIN CUSTOMER ON SERVICE.customerID =" + Session["selectedCustomer"].ToString();

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

                string ottoman = queryResults["ottoman"].ToString();
                int Ottoman = Int16.Parse(ottoman);
                Ottoman = Ottoman * 9;

                string secretaryDesk = queryResults["secretaryDesk"].ToString();
                int SecretaryDesk = Int16.Parse(secretaryDesk);
                SecretaryDesk = SecretaryDesk * 35;

                string ETcetner = queryResults["ETcetner"].ToString();
                int ETCetner = Int16.Parse(ETcetner);
                ETCetner = ETCetner * 40;

                string fireplacEquipment = queryResults["fireplaceEquipment"].ToString();
                int FireplacEquipment = Int16.Parse(fireplacEquipment);
                FireplacEquipment = FireplacEquipment * 5;

                string footStool = queryResults["footStool"].ToString();
                int FootStool = Int16.Parse(footStool);
                FootStool = FootStool * 5;

                string grandClock = queryResults["grandClock"].ToString();
                int GrandClock = Int16.Parse(grandClock);
                GrandClock = GrandClock * 20;

                string coatRack= queryResults["coatRack"].ToString();
                int CoatRack = Int16.Parse(coatRack);
                CoatRack = CoatRack * 2;

                string coatRackLarge = queryResults["coatRackLarge"].ToString();
                int CoatRackLarge = Int16.Parse(coatRackLarge);
                CoatRackLarge = CoatRackLarge * 12;

                string floorLamp = queryResults["floorLamp"].ToString();
                int FloorLamp = Int16.Parse(floorLamp);
                FloorLamp = FloorLamp * 3;

                string magazineRack = queryResults["magazineRack"].ToString();
                int MagazineRack = Int16.Parse(magazineRack);
                MagazineRack = MagazineRack * 2;

                string musicCabinet = queryResults["musicCabinet"].ToString();
                int MusicCabinet = Int16.Parse(musicCabinet);
                MusicCabinet = MusicCabinet * 10;

                string smallOrgan = queryResults["smallOrgan"].ToString();
                int SmallOrgan = Int16.Parse(smallOrgan);
                SmallOrgan = SmallOrgan * 20;

                string pianoBabyGrUpr = queryResults["pianoBabyGrUpr"].ToString();
                int PianoBabyGrUpr = Int16.Parse(pianoBabyGrUpr);
                PianoBabyGrUpr = PianoBabyGrUpr * 70;

                string pianoParlorGrd = queryResults["pianoParlorGrd"].ToString();
                int PianoParlorGrd = Int16.Parse(pianoParlorGrd);
                PianoParlorGrd = PianoParlorGrd * 80;

                string pianoSpinet = queryResults["pianoSpinet"].ToString();
                int PianoSpinet = Int16.Parse(pianoSpinet);
                PianoSpinet = PianoSpinet * 60;

                string radiotTable = queryResults["radiotTable"].ToString();
                int RadiotTable = Int16.Parse(radiotTable);
                RadiotTable = RadiotTable * 2;

                string recordPlayerPortable = queryResults["recordPlayerPortable"].ToString();
                int RecordPlayerPortable = Int16.Parse(recordPlayerPortable);
                RecordPlayerPortable = RecordPlayerPortable * 2;

                string rugPadSmall = queryResults["rugPadSmall"].ToString();
                int RugPadSmall = Int16.Parse(rugPadSmall);
                RugPadSmall = RugPadSmall * 6;

                string rugPadLarge = queryResults["rugPadLarge"].ToString();
                int RugPadLarge = Int16.Parse(rugPadLarge);
                RugPadLarge = RugPadLarge * 13;

                string sofaRattanWicker = queryResults["sofaRattanWicker"].ToString();
                int SofaRattanWicker = Int16.Parse(sofaRattanWicker);
                SofaRattanWicker = SofaRattanWicker * 10;

                string sofaSectional = queryResults["sofaSectional"].ToString();
                int SofaSectional = Int16.Parse(sofaSectional);
                SofaSectional = SofaSectional * 30;

                string loveSeat = queryResults["loveSeat"].ToString();
                int LoveSeat = Int16.Parse(loveSeat);
                LoveSeat = LoveSeat * 35;

                string threeCushion = queryResults["threeCushion"].ToString();
                int ThreeCushion = Int16.Parse(threeCushion);
                ThreeCushion = ThreeCushion * 50;

                string fourCushion = queryResults["fourCushion"].ToString();
                int FourCushion = Int16.Parse(fourCushion);
                FourCushion = FourCushion * 60;

                string futon = queryResults["futon"].ToString();
                int Futon = Int16.Parse(futon);
                Futon = Futon * 15;

                string stereoComponent = queryResults["stereoComponent"].ToString();
                int StereoComponent = Int16.Parse(stereoComponent);
                StereoComponent = StereoComponent * 8;

                string console = queryResults["console"].ToString();
                int Console = Int16.Parse(console);
                Console = Console * 15;

                string speakerPair = queryResults["speakerPair"].ToString();
                int SpeakerPair = Int16.Parse(speakerPair);
                SpeakerPair = SpeakerPair * 5;

                string tableStandard = queryResults["tableStandard"].ToString();
                int TableStandard = Int16.Parse(tableStandard);
                TableStandard = TableStandard * 12;

                string tableCoffee = queryResults["tableCoffee"].ToString();
                int TableCoffee = Int16.Parse(tableCoffee);
                TableCoffee = TableCoffee * 12;

                string tableEnd = queryResults["tableEnd"].ToString();
                int TableEnd = Int16.Parse(tableEnd);
                TableEnd = TableEnd * 6;

                string phoneStand = queryResults["phoneStand"].ToString();
                int PhoneStand = Int16.Parse(phoneStand);
                PhoneStand = PhoneStand * 5;

                string flatScreenSmall = queryResults["flatScreenSmall"].ToString();
                int FlatScreenSmall = Int16.Parse(flatScreenSmall);
                FlatScreenSmall = FlatScreenSmall * 5;

                string flatScreenLarge = queryResults["flatScreenLarge"].ToString();
                int FlatScreenLarge = Int16.Parse(flatScreenLarge);
                FlatScreenLarge = FlatScreenLarge * 9;

                string bookCaseSmall = queryResults["bookCaseSmall"].ToString();
                int BookCaseSmall = Int16.Parse(bookCaseSmall);
                BookCaseSmall = BookCaseSmall * 12;

                string recliner = queryResults["recliner"].ToString();
                int Recliner = Int16.Parse(recliner);
                Recliner = Recliner * 25;

                string floorLampLarge = queryResults["floorLampLarge"].ToString();
                int FloorLampLarge = Int16.Parse(floorLampLarge);
                FloorLampLarge = FloorLampLarge * 10;

                string tableLamp = queryResults["tableLamp"].ToString();
                int TableLamp = Int16.Parse(tableLamp);
                TableLamp = TableLamp * 2;

                string heavyClockLamp = queryResults["heavyClockLamp"].ToString();
                int HeavyClockLamp = Int16.Parse(heavyClockLamp);
                HeavyClockLamp = HeavyClockLamp * 15;

                string bench = queryResults["bench"].ToString();
                int Bench = Int16.Parse(bench);
                Bench = Bench * 10;

                string buffestBase = queryResults["buffestBase"].ToString();
                int BuffestBase = Int16.Parse(buffestBase);
                BuffestBase = BuffestBase * 30;

                string hutchTop = queryResults["hutchTop"].ToString();
                int HutchTop = Int16.Parse(hutchTop);
                HutchTop = HutchTop * 20;

                string cornerCabinet = queryResults["cornerCabinet"].ToString();
                int CornerCabinet = Int16.Parse(cornerCabinet);
                CornerCabinet = CornerCabinet * 20;

                string diningTable = queryResults["diningTable"].ToString();
                int DiningTable = Int16.Parse(diningTable);
                DiningTable = DiningTable * 30;

                string diningTableChair = queryResults["diningTableChair"].ToString();
                int DiningTableChair = Int16.Parse(diningTableChair);
                DiningTableChair = DiningTableChair * 6;

                string diningTableLeaf = queryResults["diningTableLeaf"].ToString();
                int DiningTableLeaf = Int16.Parse(diningTableLeaf);
                DiningTableLeaf = DiningTableLeaf * 4;

                string bakingRack = queryResults["bakingRack"].ToString();
                int BakingRack = Int16.Parse(bakingRack);
                BakingRack = BakingRack * 20;

                string serverCart = queryResults["serverCart"].ToString();
                int ServerCart = Int16.Parse(serverCart);
                ServerCart = ServerCart * 15;

                string teaCart = queryResults["teaCart"].ToString();
                int TeaCart = Int16.Parse(teaCart);
                TeaCart = TeaCart * 15;

                string smallRugPad = queryResults["smallRugPad"].ToString();
                int SmallRugPad = Int16.Parse(smallRugPad);
                SmallRugPad = SmallRugPad * 10;

                string suiteChairs = queryResults["suiteChairs"].ToString();
                int SuiteChairs = Int16.Parse(suiteChairs);
                SuiteChairs = SuiteChairs * 5;

                string largeTable = queryResults["largeTable"].ToString();
                int LargeTable = Int16.Parse(largeTable);
                LargeTable = LargeTable * 10;

                string smallTable = queryResults["smallTable"].ToString();
                int SmallTable = Int16.Parse(smallTable);
                SmallTable = SmallTable * 5;

                string highChair = queryResults["highChair"].ToString();
                int HighChair = Int16.Parse(highChair);
                HighChair = HighChair * 5;

                string ironingBoard = queryResults["ironingBoard"].ToString();
                int IroningBoard = Int16.Parse(ironingBoard);
                IroningBoard = IroningBoard * 2;

                string kitchenCabinet = queryResults["kitchenCabinet"].ToString();
                int KitchenCabinet = Int16.Parse(kitchenCabinet);
                KitchenCabinet = KitchenCabinet * 30;

                string microwave = queryResults["microwave"].ToString();
                int Microwave = Int16.Parse(microwave);
                Microwave = Microwave * 10;

                string servingCart = queryResults["servingCart"].ToString();
                int ServingCart = Int16.Parse(servingCart);
                ServingCart = ServingCart * 15;

                string waterCooler = queryResults["waterCooler"].ToString();
                int WaterCooler = Int16.Parse(waterCooler);
                WaterCooler = WaterCooler * 5;

                string stool = queryResults["stool"].ToString();
                int Stool = Int16.Parse(stool);
                Stool = Stool * 5;

                string microwaveStand = queryResults["microwaveStand"].ToString();
                int MicrowaveStand = Int16.Parse(microwaveStand);
                MicrowaveStand = MicrowaveStand * 5;

                string kitchenBench = queryResults["kitchenBench"].ToString();
                int KitchenBench = Int16.Parse(kitchenBench);
                KitchenBench = KitchenBench * 12;

                //column1 (living dining and kitchen)
                int column1 = KitchenBench+MicrowaveStand+Stool+WaterCooler+ServingCart+Microwave+KitchenCabinet+IroningBoard+HighChair+SmallTable+LargeTable+SuiteChairs+SmallRugPad+TeaCart+ServerCart+BakingRack+DiningTableLeaf+DiningTableChair+DiningTable+CornerCabinet+HutchTop+BuffestBase+Bench+HeavyClockLamp+TableLamp+FloorLampLarge+Recliner+BookCaseSmall+FlatScreenLarge+FlatScreenSmall+PhoneStand+TableEnd+TableCoffee+TableStandard+SpeakerPair+Console+StereoComponent+Futon+FourCushion+ThreeCushion+LoveSeat+SofaSectional+SofaRattanWicker+RugPadLarge+RugPadSmall+RecordPlayerPortable+RadiotTable+PianoSpinet+PianoParlorGrd+PianoBabyGrUpr+SmallOrgan+MusicCabinet+FloorLamp+MagazineRack+CoatRackLarge+CoatRack+GrandClock+FootStool+FireplacEquipment+ETCetner+SecretaryDesk + Ottoman + Bar + PianoBench + LargeBookcase + BookShelves + Cabinet + StraightChair + ArmChair + RockerChair + OccasionalChair + OverStuffedChair + CedarChest + Computer + SmallDesk;
                
                
                
                
                //column2 (bedroom nursery and porch/outdoor)

                string kingBedSet = queryResults["kingBedSet"].ToString();
                int KingBedSet = Int16.Parse(kingBedSet);
                KingBedSet = KingBedSet * 70;

                string queenBedSet = queryResults["queenBedSet"].ToString();
                int QueenBedSet = Int16.Parse(queenBedSet);
                QueenBedSet = QueenBedSet * 65;

                string doubleBedSet = queryResults["doubleBedSet"].ToString();
                int DoubleBedSet = Int16.Parse(doubleBedSet);
                DoubleBedSet = DoubleBedSet * 60;

                string singleBedSet = queryResults["singleBedSet"].ToString();
                int SingleBedSet = Int16.Parse(singleBedSet);
                SingleBedSet = SingleBedSet * 40;

                string bunkBedSet = queryResults["bunkBedSet"].ToString();
                int BunkBedSet = Int16.Parse(bunkBedSet);
                BunkBedSet = BunkBedSet * 70;

                string dayBedSet = queryResults["dayBedSet"].ToString();
                int DayBedSet = Int16.Parse(dayBedSet);
                DayBedSet = DayBedSet * 30;

                string rollawayBedSet = queryResults["rollawayBedSet"].ToString();
                int RollawayBedSet = Int16.Parse(rollawayBedSet);
                RollawayBedSet = RollawayBedSet * 20;

                string bookShelvesBedroom = queryResults["bookShelvesBedroom"].ToString();
                int BookShelvesBedroom = Int16.Parse(bookShelvesBedroom);
                BookShelvesBedroom = BookShelvesBedroom * 2;

                string bedroomChair = queryResults["bedroomChair"].ToString();
                int BedroomChair = Int16.Parse(bedroomChair);
                BedroomChair = BedroomChair * 10;

                string rockerChairBedroom = queryResults["rockerChairBedroom"].ToString();
                int RockerChairBedroom = Int16.Parse(rockerChairBedroom);
                RockerChairBedroom = RockerChairBedroom * 10;

                string loungeChair = queryResults["loungeChair"].ToString();
                int LoungeChair = Int16.Parse(loungeChair);
                LoungeChair = LoungeChair * 25;

                string armoireSmall = queryResults["armoireSmall"].ToString();
                int ArmoireSmall = Int16.Parse(armoireSmall);
                ArmoireSmall = ArmoireSmall * 25;

                string armoireLarge = queryResults["armoireLarge"].ToString();
                int ArmoireLarge = Int16.Parse(armoireLarge);
                ArmoireLarge = ArmoireLarge * 50;

                string chestSmall = queryResults["chestSmall"].ToString();
                int ChestSmall = Int16.Parse(chestSmall);
                ChestSmall = ChestSmall * 12;

                string chestLarge = queryResults["chestLarge"].ToString();
                int ChestLarge = Int16.Parse(chestLarge);
                ChestLarge = ChestLarge * 15;

                string vanityBench = queryResults["vanityBench"].ToString();
                int VanityBench = Int16.Parse(vanityBench);
                VanityBench = VanityBench * 3;

                string bedroomBench = queryResults["bedroomBench"].ToString();
                int BedroomBench = Int16.Parse(bedroomBench);
                BedroomBench = BedroomBench * 5;

                string singleDresser = queryResults["singleDresser"].ToString();
                int SingleDresser = Int16.Parse(singleDresser);
                SingleDresser = SingleDresser * 30;

                string doubleDresser = queryResults["doubleDresser"].ToString();
                int DoubleDresser = Int16.Parse(doubleDresser);
                DoubleDresser = DoubleDresser * 40;

                string tripleDresser = queryResults["tripleDresser"].ToString();
                int TripleDresser = Int16.Parse(tripleDresser);
                TripleDresser = TripleDresser * 50;

                string vanityDresser = queryResults["vanityDresser"].ToString();
                int VanityDresser = Int16.Parse(vanityDresser);
                VanityDresser = VanityDresser * 15;

                string floorLampBedroom = queryResults["floorLampBedroom"].ToString();
                int FloorLampBedroom = Int16.Parse(floorLampBedroom);
                FloorLampBedroom = FloorLampBedroom * 3;

                string nightTable = queryResults["nightTable"].ToString();
                int NightTable = Int16.Parse(nightTable);
                NightTable = NightTable * 5;

                string smallWArdrobe = queryResults["smallWardrobe"].ToString();
                int SmallWArdrobe = Int16.Parse(smallWArdrobe);
                SmallWArdrobe = SmallWArdrobe * 20;

                string largeWardrobe = queryResults["largeWardrobe"].ToString();
                int LargeWardrobe = Int16.Parse(largeWardrobe);
                LargeWardrobe = LargeWardrobe * 40;

                string jewleryArmoire = queryResults["jewleryArmoire"].ToString();
                int JewleryArmoire = Int16.Parse(jewleryArmoire);
                JewleryArmoire = JewleryArmoire * 8;

                string tableLampBedroom = queryResults["tableLampBedroom"].ToString();
                int TableLampBedroom = Int16.Parse(tableLampBedroom);
                TableLampBedroom = TableLampBedroom * 2;

                string babyCarriageNursery = queryResults["babyCarriageNursery"].ToString();
                int BabyCarriageNursery = Int16.Parse(babyCarriageNursery);
                BabyCarriageNursery = BabyCarriageNursery * 3;

                string bassinette = queryResults["bassinette"].ToString();
                int Bassinette = Int16.Parse(bassinette);
                Bassinette = Bassinette * 5;

                string youthBed = queryResults["youthBed"].ToString();
                int YouthBed = Int16.Parse(youthBed);
                YouthBed = YouthBed * 30;

                string childChair = queryResults["childChair"].ToString();
                int ChildChair = Int16.Parse(childChair);
                ChildChair = ChildChair * 3;

                string highChairNursery = queryResults["highChairNursery"].ToString();
                int HighChairNursery = Int16.Parse(highChairNursery);
                HighChairNursery = HighChairNursery * 5;

                string chestNursery = queryResults["chestNursery"].ToString();
                int ChestNursery = Int16.Parse(chestNursery);
                ChestNursery = ChestNursery *15;

                string toyChest = queryResults["toyChest"].ToString();
                int ToyChest = Int16.Parse(toyChest);
                ToyChest = ToyChest * 10;

                string babyCrib = queryResults["babyCrib"].ToString();
                int BabyCrib = Int16.Parse(babyCrib);
                BabyCrib = BabyCrib * 10;

                string playpen = queryResults["playpen"].ToString();
                int Playpen = Int16.Parse(playpen);
                Playpen = Playpen * 10;

                string plasticToySmall = queryResults["plasticToySmall"].ToString();
                int PlasticToySmall = Int16.Parse(plasticToySmall);
                PlasticToySmall = PlasticToySmall * 1;

                string plasticToyLarge = queryResults["plasticToyLarge"].ToString();
                int PlasticToyLarge = Int16.Parse(plasticToyLarge);
                PlasticToyLarge = PlasticToyLarge * 3;

                string childTable = queryResults["childTable"].ToString();
                int ChildTable = Int16.Parse(childTable);
                ChildTable = ChildTable * 5;

                string draftingTable = queryResults["draftingTable"].ToString();
                int DraftingTable = Int16.Parse(draftingTable);
                DraftingTable = DraftingTable * 30;

                string largeGlass = queryResults["largeGlass"].ToString();
                int LargeGlass = Int16.Parse(largeGlass);
                LargeGlass = LargeGlass * 10;

                string grillSmall = queryResults["grillSmall"].ToString();
                int GrillSmall = Int16.Parse(grillSmall);
                GrillSmall = GrillSmall * 4;

                string grillLarge = queryResults["grillLarge"].ToString();
                int GrillLarge = Int16.Parse(grillLarge);
                GrillLarge = GrillLarge * 10;

                string chairAlumPlast = queryResults["chairAlumPlast"].ToString();
                int ChairAlumPlast = Int16.Parse(chairAlumPlast);
                ChairAlumPlast = ChairAlumPlast * 1;

                string chairMetal = queryResults["chairMetal"].ToString();
                int ChairMetal = Int16.Parse(chairMetal);
                ChairMetal = ChairMetal * 3;

                string chairWood = queryResults["chairWood"].ToString();
                int ChairWood = Int16.Parse(chairWood);
                ChairWood = ChairWood * 5;

                string hoseAndtools = queryResults["hoseAndtools"].ToString();
                int HoseAndtools = Int16.Parse(hoseAndtools);
                HoseAndtools = HoseAndtools * 10;

                string glider = queryResults["glider"].ToString();
                int Glider = Int16.Parse(glider);
                Glider = Glider * 30;

                string ladderSixFoot = queryResults["ladderSixFoot"].ToString();
                int LadderSixFoot = Int16.Parse(ladderSixFoot);
                LadderSixFoot = LadderSixFoot * 3;

                string ladderEightFoot = queryResults["ladderEightFoot"].ToString();
                int LadderEightFoot = Int16.Parse(ladderEightFoot);
                LadderEightFoot = LadderEightFoot * 2;

                string ladderExtension = queryResults["ladderExtension"].ToString();
                int LadderExtension = Int16.Parse(ladderExtension);
                LadderExtension = LadderExtension * 10;

                string lawnEdger = queryResults["lawnEdger"].ToString();
                int LawnEdger = Int16.Parse(lawnEdger);
                LawnEdger = LawnEdger * 3;

                string lawnMowerHand = queryResults["lawnMowerHand"].ToString();
                int LawnMowerHand = Int16.Parse(lawnMowerHand);
                LawnMowerHand = LawnMowerHand * 5;

                string lawnMowerPower = queryResults["lawnMowerPower"].ToString();
                int LawnMowerPower = Int16.Parse(lawnMowerPower);
                LawnMowerPower = LawnMowerPower * 15;

                string lawnMowerRide = queryResults["lawnMowerRide"].ToString();
                int LawnMowerRide = Int16.Parse(lawnMowerRide);
                LawnMowerRide = LawnMowerRide * 35;

                string leafSweeper = queryResults["leafSweeper"].ToString();
                int LeafSweeper = Int16.Parse(leafSweeper);
                LeafSweeper = LeafSweeper * 5;

                string childSlide = queryResults["childSlide"].ToString();
                int ChildSlide = Int16.Parse(childSlide);
                ChildSlide = ChildSlide * 10;

                string childGym = queryResults["childGym"].ToString();
                int ChildGym = Int16.Parse(childGym);
                ChildGym = ChildGym * 20;

                string childSwingSmall = queryResults["childSwingSmall"].ToString();
                int ChildSwingSmall = Int16.Parse(childSwingSmall);
                ChildSwingSmall = ChildSwingSmall * 30;

                string childSwingMed = queryResults["childSwingMed"].ToString();
                int ChildSwingMed = Int16.Parse(childSwingMed);
                ChildSwingMed = ChildSwingMed * 45;

                string childSwingLarge = queryResults["childSwingLarge"].ToString();
                int ChildSwingLarge = Int16.Parse(childSwingLarge);
                ChildSwingLarge = ChildSwingLarge * 70;

                string picnicTable = queryResults["picnicTable"].ToString();
                int PicnicTable = Int16.Parse(picnicTable);
                PicnicTable = PicnicTable * 20;

                string outdoorBench = queryResults["outdoorBench"].ToString();
                int OutdoorBench = Int16.Parse(outdoorBench);
                OutdoorBench = OutdoorBench * 5;

                string plasticTote = queryResults["plasticTote"].ToString();
                int PlasticTote = Int16.Parse(plasticTote);
                PlasticTote = PlasticTote * 5;

                string lawnRoller = queryResults["lawnRoller"].ToString();
                int LawnRoller = Int16.Parse(lawnRoller);
                LawnRoller = LawnRoller * 15;

                string sandBox = queryResults["sandBox"].ToString();
                int SandBox = Int16.Parse(sandBox);
                SandBox = SandBox * 10;

                string spreader = queryResults["spreader"].ToString();
                int Spreader = Int16.Parse(spreader);
                Spreader = Spreader * 2;

                string snowBlower = queryResults["snowBlower"].ToString();
                int SnowBlower = Int16.Parse(snowBlower);
                SnowBlower = SnowBlower * 10;

                string smallTableOutdoor = queryResults["smallTableOutdoor"].ToString();
                int SmallTableOutdoor = Int16.Parse(smallTableOutdoor);
                SmallTableOutdoor = SmallTableOutdoor * 2;

                string largeTableOutdoor = queryResults["largeTableOutdoor"].ToString();
                int LargeTableOutdoor = Int16.Parse(largeTableOutdoor);
                LargeTableOutdoor = LargeTableOutdoor * 4;

                string umbrella = queryResults["umbrella"].ToString();
                int Umbrella = Int16.Parse(umbrella);
                Umbrella = Umbrella * 5;

                string childWagon = queryResults["childWagon"].ToString();
                int ChildWagon = Int16.Parse(childWagon);
                ChildWagon = ChildWagon * 5;

                string whellBarrow = queryResults["whellBarrow"].ToString();
                int WhellBarrow = Int16.Parse(whellBarrow);
                WhellBarrow = WhellBarrow * 6;

                string smallAirCompressor = queryResults["smallAirCompressor"].ToString();
                int SmallAirCompressor = Int16.Parse(smallAirCompressor);
                SmallAirCompressor = SmallAirCompressor * 10;

                string largeAirCompressor = queryResults["largeAirCompressor"].ToString();
                int LargeAirCompressor = Int16.Parse(largeAirCompressor);
                LargeAirCompressor = LargeAirCompressor * 21;

                string gorillaRack = queryResults["gorillaRack"].ToString();
                int GorillaRack = Int16.Parse(gorillaRack);
                GorillaRack = GorillaRack * 20;

                string utilityCabinet = queryResults["utilityCabinet"].ToString();
                int UtilityCabinet = Int16.Parse(utilityCabinet);
                UtilityCabinet = UtilityCabinet * 8;

                int column2 = UtilityCabinet+GorillaRack + LargeAirCompressor + SmallAirCompressor + WhellBarrow + ChildWagon + Umbrella + LargeTableOutdoor + SmallTableOutdoor + SnowBlower + Spreader + SandBox + LawnRoller + PlasticTote + OutdoorBench + PicnicTable + ChildSwingLarge + ChildSwingMed + ChildSwingSmall + ChildGym + ChildSlide + LeafSweeper + LawnMowerPower + LawnMowerRide + LawnMowerHand + LawnEdger + LadderExtension + LadderEightFoot + LadderSixFoot + Glider+HoseAndtools + ChairWood + ChairMetal + ChairAlumPlast + GrillLarge + GrillSmall +LargeGlass + DraftingTable + ChildTable + PlasticToyLarge + PlasticToySmall + BabyCrib + Playpen + ToyChest + ChestNursery + HighChairNursery + ChildChair + Bassinette +BabyCarriageNursery + TableLampBedroom + JewleryArmoire + LargeWardrobe + SmallWArdrobe + NightTable + FloorLampBedroom + VanityDresser+ TripleDresser + DoubleDresser +SingleDresser+BedroomBench+VanityBench+ChestLarge+ChestSmall+ArmoireLarge+ArmoireSmall+LoungeChair+RockerChairBedroom+BedroomChair+BookShelvesBedroom+RollawayBedSet+DayBedSet+BunkBedSet+SingleBedSet+DoubleBedSet+QueenBedSet+KingBedSet;


                //column3 (appliances and misc)

                string airconSmall = queryResults["airconSmall"].ToString();
                int AirconSmall = Int16.Parse(airconSmall);
                AirconSmall = AirconSmall * 15;

                string airconLarge = queryResults["airconLarge"].ToString();
                int AirconLarge = Int16.Parse(airconLarge);
                AirconLarge = AirconLarge * 20;

                string babyCarriage = queryResults["babyCarriage"].ToString();
                int BabyCarriage = Int16.Parse(babyCarriage);
                BabyCarriage = BabyCarriage * 3;

                string dehumid = queryResults["dehumid"].ToString();
                int Dehumid = Int16.Parse(dehumid);
                Dehumid = Dehumid * 10;

                string dishWasher = queryResults["dishWasher"].ToString();
                int DishWasher = Int16.Parse(dishWasher);
                DishWasher = DishWasher * 20;

                string freezerTen = queryResults["freezerTen"].ToString();
                int FreezerTen = Int16.Parse(freezerTen);
                FreezerTen = FreezerTen * 30;

                string freezerFifteen = queryResults["freezerFifteen"].ToString();
                int FreezerFifteen = Int16.Parse(freezerFifteen);
                FreezerFifteen = FreezerFifteen * 45;

                string freezerOver = queryResults["freezerOver"].ToString();
                int FreezerOver = Int16.Parse(freezerOver);
                FreezerOver = FreezerOver * 60;

                string rangeWide = queryResults["rangeWide"].ToString();
                int RangeWide = Int16.Parse(rangeWide);
                RangeWide = RangeWide * 30;

                string refrigeratorSix = queryResults["refrigeratorSix"].ToString();
                int RefrigeratorSix = Int16.Parse(refrigeratorSix);
                RefrigeratorSix = RefrigeratorSix * 40;

                string refrigeratorTen = queryResults["refrigeratorTen"].ToString();
                int RefrigeratorTen = Int16.Parse(refrigeratorTen);
                RefrigeratorTen = RefrigeratorTen * 45;

                string refrigeratorOver = queryResults["refrigeratorOver"].ToString();
                int RefrigeratorOver = Int16.Parse(refrigeratorOver);
                RefrigeratorOver = RefrigeratorOver * 60;

                string sewingMachine = queryResults["sewingMachine"].ToString();
                int SewingMachine = Int16.Parse(sewingMachine);
                SewingMachine = SewingMachine * 5;

                string sewingWithCAB = queryResults["sewingWithCAB"].ToString();
                int SewingWithCAB = Int16.Parse(sewingWithCAB);
                SewingWithCAB = SewingWithCAB * 20;

                string steamCleaner = queryResults["steamCleaner"].ToString();
                int SteamCleaner = Int16.Parse(steamCleaner);
                SteamCleaner = SteamCleaner * 6;

                string trashCompactor = queryResults["trashCompactor"].ToString();
                int TrashCompactor = Int16.Parse(trashCompactor);
                TrashCompactor = TrashCompactor * 15;

                string vacuumCleaner = queryResults["vacuumCleaner"].ToString();
                int VacuumCleaner = Int16.Parse(vacuumCleaner);
                VacuumCleaner = VacuumCleaner * 5;

                string humid = queryResults["humid"].ToString();
                int Humid = Int16.Parse(humid);
                Humid = Humid * 2;

                string airPurifier = queryResults["airPurifier"].ToString();
                int AirPurifier = Int16.Parse(airPurifier);
                AirPurifier = AirPurifier * 2;

                string shopVac = queryResults["shopVac"].ToString();
                int ShopVac = Int16.Parse(shopVac);
                ShopVac = ShopVac * 2;

                string washer = queryResults["washer"].ToString();
                int Washer = Int16.Parse(washer);
                Washer = Washer * 25;

                string dryer = queryResults["dryer"].ToString();
                int Dryer = Int16.Parse(dryer);
                Dryer = Dryer * 25;

                string fakeTree = queryResults["fakeTree"].ToString();
                int FakeTree = Int16.Parse(fakeTree);
                FakeTree = FakeTree * 2;

                string barbellWeights = queryResults["barbellWeights"].ToString();
                int BarbellWeights = Int16.Parse(barbellWeights);
                BarbellWeights = BarbellWeights * 7;

                string clothesBasket = queryResults["clothesBasket"].ToString();
                int ClothesBasket = Int16.Parse(clothesBasket);
                ClothesBasket = ClothesBasket * 5;

                string bike = queryResults["bike"].ToString();
                int Bike = Int16.Parse(bike);
                Bike = Bike * 6;

                string bowlingBall = queryResults["bowlingBall"].ToString();
                int BowlingBall = Int16.Parse(bowlingBall);
                BowlingBall = BowlingBall * 3;

                string cardTable = queryResults["cardTable"].ToString();
                int CardTable = Int16.Parse(cardTable);
                CardTable = CardTable * 2;

                string clothesHamper = queryResults["clothesHamper"].ToString();
                int ClothesHamper = Int16.Parse(clothesHamper);
                ClothesHamper = ClothesHamper * 5;

                string cooler = queryResults["cooler"].ToString();
                int Cooler = Int16.Parse(cooler);
                Cooler = Cooler * 1;

                string foldingCot = queryResults["foldingCot"].ToString();
                int FoldingCot = Int16.Parse(foldingCot);
                FoldingCot = FoldingCot * 10;

                string officeDeskLarge = queryResults["officeDeskLarge"].ToString();
                int OfficeDeskLarge = Int16.Parse(officeDeskLarge);
                OfficeDeskLarge = OfficeDeskLarge * 30;

                string computerDesk = queryResults["computerDesk"].ToString();
                int ComputerDesk = Int16.Parse(computerDesk);
                ComputerDesk = ComputerDesk * 8;

                string studentDesk = queryResults["studentDesk"].ToString();
                int StudentDesk = Int16.Parse(studentDesk);
                StudentDesk = StudentDesk * 8;

                string officeChair = queryResults["officeChair"].ToString();
                int OfficeChair = Int16.Parse(officeChair);
                OfficeChair = OfficeChair * 5;

                string secretaryChair = queryResults["secretaryChair"].ToString();
                int SecretaryChair = Int16.Parse(secretaryChair);
                SecretaryChair = SecretaryChair * 4;

                string printerStand = queryResults["printerStand"].ToString();
                int PrinterStand = Int16.Parse(printerStand);
                PrinterStand = PrinterStand * 4;

                string exerciseEquip = queryResults["exerciseEquip"].ToString();
                int ExerciseEquip = Int16.Parse(exerciseEquip);
                ExerciseEquip = ExerciseEquip * 10;

                string miscFan = queryResults["miscFan"].ToString();
                int MiscFan = Int16.Parse(miscFan);
                MiscFan = MiscFan * 5;

                string fernPlantStand = queryResults["fernPlantStand"].ToString();
                int FernPlantStand = Int16.Parse(fernPlantStand);
                FernPlantStand = FernPlantStand * 2;

                string cardboardCabinet = queryResults["cardboardCabinet"].ToString();
                int CardboardCabinet = Int16.Parse(cardboardCabinet);
                CardboardCabinet = CardboardCabinet * 4;

                string twoDrawerCabinet = queryResults["twoDrawerCabinet"].ToString();
                int TwoDrawerCabinet = Int16.Parse(twoDrawerCabinet);
                TwoDrawerCabinet = TwoDrawerCabinet * 10;

                string fourDrwaerCabinet = queryResults["fourDrwaerCabinet"].ToString();
                int FourDrwaerCabinet = Int16.Parse(fourDrwaerCabinet);
                FourDrwaerCabinet = FourDrwaerCabinet * 20;

                string fishingPole = queryResults["fishingPole"].ToString();
                int FishingPole = Int16.Parse(fishingPole);
                FishingPole = FishingPole * 1;

                string fireArms = queryResults["fireArms"].ToString();
                int FireArms = Int16.Parse(fireArms);
                FireArms = FireArms * 1;

                string foldingChair = queryResults["foldingChair"].ToString();
                int FoldingChair = Int16.Parse(foldingChair);
                FoldingChair = FoldingChair * 1;

                string wineRack = queryResults["wineRack"].ToString();
                int WineRack = Int16.Parse(wineRack);
                WineRack = WineRack * 5;

                string footLocker = queryResults["footLocker"].ToString();
                int FootLocker = Int16.Parse(footLocker);
                FootLocker = FootLocker * 5;

                string cardTableLarge = queryResults["cardTableLarge"].ToString();
                int CardTableLarge = Int16.Parse(cardTableLarge);
                CardTableLarge = CardTableLarge * 15;

                string golfEquip = queryResults["golfEquip"].ToString();
                int GolfEquip = Int16.Parse(golfEquip);
                GolfEquip = GolfEquip * 10;

                string spaceHeater = queryResults["spaceHeater"].ToString();
                int SpaceHeater = Int16.Parse(spaceHeater);
                SpaceHeater = SpaceHeater * 5;

                string metalShelves = queryResults["metalShelves"].ToString();
                int MetalShelves = Int16.Parse(metalShelves);
                MetalShelves = MetalShelves * 3;

                string pingpongTable = queryResults["pingpongTable"].ToString();
                int PingpongTable = Int16.Parse(pingpongTable);
                PingpongTable = PingpongTable * 40;

                string poolTableComp = queryResults["poolTableComp"].ToString();
                int PoolTableComp = Int16.Parse(poolTableComp);
                PoolTableComp = PoolTableComp * 40;

                string poolTableSlate= queryResults["poolTableSlate"].ToString();
                int PoolTableSlate = Int16.Parse(poolTableSlate);
                PoolTableSlate = PoolTableSlate * 99;

                string hottubFour = queryResults["hottubFour"].ToString();
                int HottubFour = Int16.Parse(hottubFour);
                HottubFour = HottubFour * 75;

                string hottubSix = queryResults["hottubSix"].ToString();
                int HottubSix = Int16.Parse(hottubSix);
                HottubSix = HottubSix * 80;

                string hottubEight = queryResults["hottubEight"].ToString();
                int HottubEight = Int16.Parse(hottubEight);
                HottubEight = HottubEight * 85;

                string powerTool = queryResults["powerTool"].ToString();
                int PowerTool = Int16.Parse(powerTool);
                PowerTool = PowerTool * 3;

                string powerToolStand = queryResults["powerToolStand"].ToString();
                int PowerToolStand = Int16.Parse(powerToolStand);
                PowerToolStand = PowerToolStand * 15;

                string skis = queryResults["skis"].ToString();
                int Skis = Int16.Parse(skis);
                Skis = Skis * 1;

                string sled = queryResults["sled"].ToString();
                int Sled = Int16.Parse(sled);
                Sled = Sled * 1;

                string suitCase = queryResults["suitCase"].ToString();
                int SuitCase = Int16.Parse(suitCase);
                SuitCase = SuitCase * 5;

                string tackleBox = queryResults["tackleBox"].ToString();
                int TackleBox = Int16.Parse(tackleBox);
                TackleBox = TackleBox * 3;

                string tire = queryResults["tire"].ToString();
                int Tire = Int16.Parse(tire);
                Tire = Tire * 3;

                string tireAndRims = queryResults["tireAndRims"].ToString();
                int TireAndRims = Int16.Parse(tireAndRims);
                TireAndRims = TireAndRims * 5;

                string toolChestSmall = queryResults["toolChestSmall"].ToString();
                int ToolChestSmall = Int16.Parse(toolChestSmall);
                ToolChestSmall = ToolChestSmall * 5;

                string toolChestMed = queryResults["toolChestMed"].ToString();
                int ToolChestMed = Int16.Parse(toolChestMed);
                ToolChestMed = ToolChestMed * 10;

                string toolChestLarge = queryResults["toolChestLarge"].ToString();
                int ToolChestLarge = Int16.Parse(toolChestLarge);
                ToolChestLarge = ToolChestLarge * 15;

                string toolChestXL = queryResults["toolChestXL"].ToString();
                int ToolChestXL = Int16.Parse(toolChestXL);
                ToolChestXL = ToolChestXL * 7;

                string trashCan = queryResults["trashCan"].ToString();
                int TrashCan = Int16.Parse(trashCan);
                TrashCan = TrashCan * 7;

                string trampoline = queryResults["trampoline"].ToString();
                int Trampoline = Int16.Parse(trampoline);
                Trampoline = Trampoline * 25;

                string treadmill = queryResults["treadmill"].ToString();
                int Treadmill = Int16.Parse(treadmill);
                Treadmill = Treadmill * 15;

                string tricycle = queryResults["tricycle"].ToString();
                int Tricycle = Int16.Parse(tricycle);
                Tricycle = Tricycle * 2;

                string workBench = queryResults["workBench"].ToString();
                int WorkBench = Int16.Parse(workBench);
                WorkBench = WorkBench * 20;

                string sewingCabinet = queryResults["sewingCabinet"].ToString();
                int SewingCabinet = Int16.Parse(sewingCabinet);
                SewingCabinet = SewingCabinet * 20;

                string largeSafe = queryResults["largeSafe"].ToString();
                int LargeSafe = Int16.Parse(largeSafe);
                LargeSafe = LargeSafe * 21;

                string medSafe = queryResults["medSafe"].ToString();
                int MedSafe = Int16.Parse(medSafe);
                MedSafe = MedSafe * 15;

                string smallSage = queryResults["smallSage"].ToString();
                int SmallSage = Int16.Parse(smallSage);
                SmallSage = SmallSage * 10;

                string gunSafe = queryResults["gunSafe"].ToString();
                int GunSafe = Int16.Parse(gunSafe);
                GunSafe = GunSafe * 54;

                string statue = queryResults["statue"].ToString();
                int Statue = Int16.Parse(statue);
                Statue = Statue * 7;

                string smallMotorcycle = queryResults["smallMotorcycle"].ToString();
                int SmallMotorcycle = Int16.Parse(smallMotorcycle);
                SmallMotorcycle = SmallMotorcycle * 35;

                string medMotorcycle = queryResults["medMotorcycle"].ToString();
                int MedMotorcycle = Int16.Parse(medMotorcycle);
                MedMotorcycle = MedMotorcycle * 50;

                string largeMotorcycle = queryResults["largeMotorcycle"].ToString();
                int LargeMotorcycle = Int16.Parse(largeMotorcycle);
                LargeMotorcycle = LargeMotorcycle * 65;

                string fourWheeler = queryResults["fourWheeler"].ToString();
                int FourWheeler = Int16.Parse(fourWheeler);
                FourWheeler = FourWheeler * 40;




                int column3= FourWheeler+LargeMotorcycle + MedMotorcycle + SmallMotorcycle + Statue + GunSafe + SmallSage + MedSafe + LargeSafe + SewingCabinet + WorkBench + Tricycle + Treadmill + Trampoline + TrashCan + ToolChestXL + ToolChestLarge + ToolChestMed + ToolChestSmall + TireAndRims + Tire + TackleBox + SuitCase + Sled + Skis + PowerToolStand + PowerTool + HottubEight + HottubSix + HottubFour + PoolTableSlate + PoolTableComp + PingpongTable + MetalShelves + SpaceHeater + GolfEquip + CardTableLarge + FootLocker + WineRack + FoldingChair + FireArms + FishingPole + FourDrwaerCabinet + TwoDrawerCabinet + CardboardCabinet + FernPlantStand + MiscFan + ExerciseEquip + PrinterStand + SecretaryChair + OfficeChair + StudentDesk + ComputerDesk + OfficeDeskLarge + FoldingCot + Cooler + ClothesHamper + CardTable + BowlingBall + Bike + ClothesBasket + BarbellWeights + FakeTree + Dryer + Washer + AirPurifier + Humid + VacuumCleaner + TrashCompactor + SteamCleaner + SewingWithCAB + SewingMachine + RefrigeratorOver + RefrigeratorTen + RefrigeratorSix + RangeWide + FreezerOver + FreezerFifteen + FreezerTen + DishWasher + Dehumid + BabyCarriage + AirconLarge + AirconSmall;


                //column4 (cartons)
                string dishPack = queryResults["dishPack"].ToString();
                int DishPack = Int16.Parse(dishPack);
                DishPack = DishPack * 2;

                string wardbrobeLayFlat = queryResults["wardrobeLayFlat"].ToString();
                int WardbrobeLayFlat = Int16.Parse(wardbrobeLayFlat);
                WardbrobeLayFlat = WardbrobeLayFlat * 3;

                string wardbrobeStandup = queryResults["wardrobeStandup"].ToString();
                int WardbrobeStandup = Int16.Parse(wardbrobeStandup);
                WardbrobeStandup = WardbrobeStandup * 5;

                string smallBooks = queryResults["smallBooks"].ToString();
                int SmallBooks = Int16.Parse(smallBooks);
                SmallBooks = SmallBooks * 6;

                string smallCartons = queryResults["smallCartons"].ToString();
                int SmallCartons = Int16.Parse(smallCartons);
                SmallCartons = SmallCartons * 10;

                string mediumCartons = queryResults["mediumCartons"].ToString();
                int MediumCartons = Int16.Parse(mediumCartons);
                MediumCartons = MediumCartons * 5;

                string largeCartons = queryResults["largeCartons"].ToString();
                int LargeCartons = Int16.Parse(largeCartons);
                LargeCartons = LargeCartons * 10;

                string XLCartons = queryResults["XLCartons"].ToString();
                int XLCartonS = Int16.Parse(XLCartons);
                XLCartonS = XLCartonS * 3;

                string mirrorCarton = queryResults["mirrorCarton"].ToString();
                int MirrorCarton = Int16.Parse(mirrorCarton);
                MirrorCarton = MirrorCarton * 4;





                int column4 = MirrorCarton+XLCartonS + LargeCartons + MediumCartons + SmallCartons + SmallBooks + WardbrobeStandup + WardbrobeLayFlat + DishPack;
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