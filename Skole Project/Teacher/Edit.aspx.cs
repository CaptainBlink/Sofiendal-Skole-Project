using Skole_Project.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skole_Project.Teacher
{
    public partial class Edit : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            var checkExisting3 = (from c in db.Classes where c.ID.Equals(user.Class) select c).FirstOrDefault();

            if (user.Type != true)
            {
                Response.Redirect("~/GoogleLogin.aspx");
            }

            welcome.Text = user.Name.ToUpper();
            imgPicture.ImageUrl = user.Picture;

            DateTime today = DateTime.Today;
            int currentDayOfWeek = (int)today.DayOfWeek;
            DateTime lastsunday = today.AddDays(-(currentDayOfWeek + 7));
            DateTime lastmonday = lastsunday.AddDays(1);
            DateTime sunday = today.AddDays(-currentDayOfWeek);
            DateTime monday = sunday.AddDays(1);
            DateTime nextsunday = today.AddDays(-(currentDayOfWeek - 7));
            DateTime nextmonday = nextsunday.AddDays(1);

            // If we started on Sunday, we should actually have gone *back*
            // 6 days instead of forward 1...
            if (currentDayOfWeek == 0)
            {
                monday = monday.AddDays(-7);

            }
            var lastweek = Enumerable.Range(0, 5).Select(days => lastmonday.AddDays(days)).ToList();
            var thisweek = Enumerable.Range(0, 5).Select(days => monday.AddDays(days)).ToList();
            var nextweek = Enumerable.Range(0, 5).Select(days => nextmonday.AddDays(days)).ToList();

            //last week

            date1.Text = lastweek.ElementAt(0).ToString("dd/MM");

            date2.Text = lastweek.ElementAt(1).ToString("dd/MM");

            date3.Text = lastweek.ElementAt(2).ToString("dd/MM");

            date4.Text = lastweek.ElementAt(3).ToString("dd/MM");

            date5.Text = lastweek.ElementAt(4).ToString("dd/MM");

            //this week

            date6.Text = thisweek.ElementAt(0).ToString("dd/MM");

            date7.Text = thisweek.ElementAt(1).ToString("dd/MM");

            date8.Text = thisweek.ElementAt(2).ToString("dd/MM");

            date9.Text = thisweek.ElementAt(3).ToString("dd/MM");

            date10.Text = thisweek.ElementAt(4).ToString("dd/MM");

            //next week

            date11.Text = nextweek.ElementAt(0).ToString("dd/MM");

            date12.Text = nextweek.ElementAt(1).ToString("dd/MM");

            date13.Text = nextweek.ElementAt(2).ToString("dd/MM");

            date14.Text = nextweek.ElementAt(3).ToString("dd/MM");

            date15.Text = nextweek.ElementAt(4).ToString("dd/MM");


            var attendance = (from c in db.UserDatas where c.UserID.Equals(user.ID) select c);
            int att = attendance.Count();
            lblattendance.Text = "Jeg har deltaget i lektiecafén" + "\n" + "<b>" + att + "</b>" + "\n" + "gange denne måned.";

            //last week

            SqlDataSource2.SelectParameters["HomeworkDate"].DefaultValue = lastweek.ElementAt(0).ToString("yyyy-MM-dd");
            SqlDataSource2.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource3.SelectParameters["HomeworkDate"].DefaultValue = lastweek.ElementAt(1).ToString("yyyy-MM-dd");
            SqlDataSource3.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource4.SelectParameters["HomeworkDate"].DefaultValue = lastweek.ElementAt(2).ToString("yyyy-MM-dd");
            SqlDataSource4.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource5.SelectParameters["HomeworkDate"].DefaultValue = lastweek.ElementAt(3).ToString("yyyy-MM-dd");
            SqlDataSource5.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource6.SelectParameters["HomeworkDate"].DefaultValue = lastweek.ElementAt(4).ToString("yyyy-MM-dd");
            SqlDataSource6.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();

            //this week

            SqlDataSource7.SelectParameters["HomeworkDate"].DefaultValue = thisweek.ElementAt(0).ToString("yyyy-MM-dd");
            SqlDataSource7.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource8.SelectParameters["HomeworkDate"].DefaultValue = thisweek.ElementAt(1).ToString("yyyy-MM-dd");
            SqlDataSource8.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource9.SelectParameters["HomeworkDate"].DefaultValue = thisweek.ElementAt(2).ToString("yyyy-MM-dd");
            SqlDataSource9.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource10.SelectParameters["HomeworkDate"].DefaultValue = thisweek.ElementAt(3).ToString("yyyy-MM-dd");
            SqlDataSource10.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource11.SelectParameters["HomeworkDate"].DefaultValue = thisweek.ElementAt(4).ToString("yyyy-MM-dd");
            SqlDataSource11.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();

            //next week

            SqlDataSource12.SelectParameters["HomeworkDate"].DefaultValue = nextweek.ElementAt(0).ToString("yyyy-MM-dd");
            SqlDataSource12.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource13.SelectParameters["HomeworkDate"].DefaultValue = nextweek.ElementAt(1).ToString("yyyy-MM-dd");
            SqlDataSource13.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource14.SelectParameters["HomeworkDate"].DefaultValue = nextweek.ElementAt(2).ToString("yyyy-MM-dd");
            SqlDataSource14.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource15.SelectParameters["HomeworkDate"].DefaultValue = nextweek.ElementAt(3).ToString("yyyy-MM-dd");
            SqlDataSource15.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
            SqlDataSource16.SelectParameters["HomeworkDate"].DefaultValue = nextweek.ElementAt(4).ToString("yyyy-MM-dd");
            SqlDataSource16.SelectParameters["UserClass"].DefaultValue = checkExisting3.ID.ToString();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {

            FormsAuthentication.SignOut();
            Response.Redirect("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:6829/GoogleLogin.aspx");

        }

        protected string GetImageUrl(object input)
        {
            if (Convert.ToBoolean(input) == true)
            {
                return "../img/active.png";
            }
            else
            {
                return "../img/inactve.png";
            }
        }
    }
}