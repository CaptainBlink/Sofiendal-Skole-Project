using Skole_Project.DataBase;
using System;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skole_Project
{
    public partial class index : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        TimeSpan startTime = new TimeSpan(10, 0, 0);
        TimeSpan endTime = new TimeSpan(18, 0, 0);

        protected void Page_Load(object sender, EventArgs e)
        {
           
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            Homework homework = (from c in db.Homeworks where c.Class.Equals(user.Class) select c).FirstOrDefault();
            //if (user.Type != false)
            //{
            //    Response.Redirect("~/Teacher/Statistics.aspx");
            //}
            SqlDataSource1.SelectParameters["ScheduleID"].DefaultValue = user.ID.ToString();
            
            welcome.Text = user.Name.ToUpper();
            imgPicture.ImageUrl = user.Picture;
            @class.Text = "6." + "\n" + user.Class;

            var checkExisting = (from c in db.UserDatas where c.Login.Value.Date.Equals(DateTime.Now.Date) select c.Login).FirstOrDefault();
            var checkExisting2 = (from c in db.UserDatas where c.Logout.Value.Date.Equals(DateTime.Now.Date) select c.Logout).FirstOrDefault();
            if (checkExisting != null)
            {
                btnCafe.Text = "CheckOut";
                btnCafe.Attributes["style"] = "background-color: #F44336; margin-bottom:10px;";
            }
            if(checkExisting != null && checkExisting2 != null)
            {
                btnCafe.Text = "CheckIn";
                btnCafe.Attributes["style"] = "background-color: none; margin-bottom:10px;";
            }

            DateTime today = DateTime.Today;
            int currentDayOfWeek = (int)today.DayOfWeek;
            DateTime sunday = today.AddDays(-currentDayOfWeek);
            DateTime monday = sunday.AddDays(1);
            // If we started on Sunday, we should actually have gone *back*
            // 6 days instead of forward 1...
            if (currentDayOfWeek == 0)
            {
                monday = monday.AddDays(-7);
            }
            var dates = Enumerable.Range(0, 5).Select(days => monday.AddDays(days)).ToList();
            string[] split1 = dates.ElementAt(0).ToString("dd/MM/yyyy").Split('/');
            date1.Text = split1[0] + "/" + split1[1];
            string[] split2 = dates.ElementAt(1).ToString("dd/MM/yyyy").Split('/');
            date2.Text = split2[0] + "/" + split2[1];
            string[] split3 = dates.ElementAt(2).ToString("dd/MM/yyyy").Split('/');
            date3.Text = split3[0] + "/" + split3[1];
            string[] split4 = dates.ElementAt(3).ToString("dd/MM/yyyy").Split('/');
            date4.Text = split4[0] + "/" + split4[1];
            string[] split5 = dates.ElementAt(4).ToString("dd/MM/yyyy").Split('/');
            date5.Text = split5[0] + "/" + split5[1];

            var attendance = (from c in db.UserDatas where c.UserID.Equals(user.ID) select c);
            int att = attendance.Count();
            lblattendance.Text = "Jeg har deltaget i lektiecafén" + "\n" + "<b>" + att + "</b>" + "\n" + "gange denne måned.";
            SqlDataSource2.SelectParameters["HomeworkDate"].DefaultValue = date1.Text + "/" + "2017";
            SqlDataSource2.SelectParameters["UserClass"].DefaultValue = user.Class;
            SqlDataSource3.SelectParameters["HomeworkDate"].DefaultValue = date2.Text + "/" + "2017";
            SqlDataSource3.SelectParameters["UserClass"].DefaultValue = user.Class;
            SqlDataSource4.SelectParameters["HomeworkDate"].DefaultValue = date3.Text + "/" + "2017";
            SqlDataSource4.SelectParameters["UserClass"].DefaultValue = user.Class;
            SqlDataSource5.SelectParameters["HomeworkDate"].DefaultValue = date4.Text + "/" + "2017";
            SqlDataSource5.SelectParameters["UserClass"].DefaultValue = user.Class;
            SqlDataSource6.SelectParameters["HomeworkDate"].DefaultValue = date5.Text + "/" + "2017";
            SqlDataSource6.SelectParameters["UserClass"].DefaultValue = user.Class;
        }

        protected void GetTime(object sender, EventArgs e)
        {
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            var checkExisting = (from c in db.UserDatas where c.Logout.Value.Date.Equals(DateTime.Now.Date) & c.UserID.Equals(user.ID) select c.Login).FirstOrDefault();

            if (DateTime.Now.TimeOfDay >= startTime && DateTime.Now.TimeOfDay <= endTime && checkExisting == null)
            {
                if(btnCafe.Text != "CheckOut")
                {
                    btnCafe.Attributes["style"] = "background-color: #549788; margin-bottom:10px;";
                }
                btnCafe.Enabled = true;
                               
            }
            else
            {
                btnCafe.Enabled = false;
            }

        }

        public string ProcessMyDataItem1(object LunchBreak)
        {
            if (LunchBreak.ToString() == "Lunch Break")
            {
                return "text-align:center;margin-top: 20px;margin-bottom: 20px;display: inline-block;margin-left: 20%;font-size: initial;";
            }

            return LunchBreak.ToString();
        }

        public string ProcessMyDataItem(object check)
        {
            if (check == DBNull.Value)
            {
                return "";
            }

            return check.ToString();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://brage.ucn.dk/1028717/GoogleLogin.aspx");
        }

        protected void btnCafe_Click(object sender, EventArgs e)
        {
            
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            UserData userData = (from c in db.UserDatas where c.UserID.Equals(user.ID) select c).FirstOrDefault();
            if (btnCafe.Text == "CheckIn")
            {
                var checkExisting = (from c in db.UserDatas where c.Login.Value.Date.Equals(DateTime.Now.Date) & c.UserID.Equals(user.ID) select c.Login).FirstOrDefault();
                if (checkExisting == null)
                {
                    UserData newUserData = new UserData();
                    newUserData.UserID = user.ID;
                    newUserData.Login = DateTime.Now;
                    db.UserDatas.InsertOnSubmit(newUserData);
                    db.SubmitChanges();
                    btnCafe.Text = "CheckOut";
                    btnCafe.Attributes["style"] = "background-color: #F44336; margin-bottom:10px;";
                    //btnCafe.Attributes["data-featherlight"] = "#HomeworkList";
                    //btnCafe.Attributes["data-featherlight-close-on-click"] = "false";
                }
                else
                {
                    btnCafe.Text = "CheckOut";
                    btnCafe.Attributes["style"] = "background-color: #F44336; margin-bottom:10px;";
                    //btnCafe.Attributes["data-featherlight"] = "#HomeworkList";
                    //btnCafe.Attributes["data-featherlight-close-on-click"] = "false";
                    //Label1.Text = "You already registered for Lesson Cafe";
                }

            }

            else
            {
                gus.Attributes["style"] = "display:block;";

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var list = CheckBoxHomework.Items.Cast<ListItem>().Where(item => item.Selected == true).Select(item => item.Value);
            var result = string.Join(",", list);           
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            UserData userDataLogOut = (from c in db.UserDatas where c.Login.Value.Date.Equals(DateTime.Now.Date) & c.UserID.Equals(user.ID) select c).FirstOrDefault();
            userDataLogOut.Logout = DateTime.Now;
            userDataLogOut.Homework = result;
            db.SubmitChanges();
            CheckBoxHomework.ClearSelection();
            gus.Attributes["style"] = "display:none;";
            btnCafe.Text = "CheckIn";
            btnCafe.Enabled = false;
            btnCafe.Attributes["style"] = "background-color:none; margin-bottom:10px;";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            CheckBoxHomework.ClearSelection();
            gus.Attributes["style"] = "display:none;";
        }
    }
}