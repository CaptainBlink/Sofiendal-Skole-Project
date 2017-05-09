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
        TimeSpan startTime = new TimeSpan(2, 0, 0);
        TimeSpan endTime = new TimeSpan(4, 0, 0);

        protected void Page_Load(object sender, EventArgs e)
        {
           
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            //if (user.Type != false)
            //{
            //    Response.Redirect("~/Teacher/Statistics.aspx");
            //}
            SqlDataSource1.SelectParameters["ScheduleID"].DefaultValue = user.ID.ToString();
            SqlDataSource2.SelectParameters["HomeworkID"].DefaultValue = user.ID.ToString();
            welcome.Text = user.Name.ToUpper();
            imgPicture.ImageUrl = user.Picture;
            @class.Text = "6." + "\n" + user.Class + "kurchec";
        }

        protected void GetTime(object sender, EventArgs e)
        {
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            var checkExisting = (from c in db.UserDatas where c.Logout.Value.Date.Equals(DateTime.Now.Date) & c.UserID.Equals(user.ID) select c.Login).FirstOrDefault();

            if (DateTime.Now.TimeOfDay >= startTime && DateTime.Now.TimeOfDay <= endTime && checkExisting == null)
            {
                btnCafe.Enabled = true;
                btnCafe.Attributes["style"] = "background-color: green; margin-bottom:10px;";
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
            Response.Redirect("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:6829/GoogleLogin.aspx");
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
                    btnCafe.Attributes["style"] = "background-color: red;";
                    //btnCafe.Attributes["data-featherlight"] = "#HomeworkList";
                    //btnCafe.Attributes["data-featherlight-close-on-click"] = "false";
                }
                else
                {
                    btnCafe.Text = "CheckOut";
                    btnCafe.Attributes["style"] = "background-color: red;";
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
            btnCafe.Attributes["style"] = "background-color: Green;";
        }
    }
}