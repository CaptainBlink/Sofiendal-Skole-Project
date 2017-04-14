using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skole_Project.Teacher
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBase.DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
            DataBase.User user = (from c in db.Users where c.Name.Contains(HttpContext.Current.User.Identity.Name) select c).SingleOrDefault();
            if (user.Type != true)
            {
                Response.Redirect("~/login.aspx");
            }

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/login.aspx", true);
        }


        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DataBase.DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
            var checkExisting = (from c in db.Users where c.Name.Contains(User.Identity.Name) select c.ID);
            var checkExisting2 = (from c in db.UserDatas where c.UserID.Equals(checkExisting.SingleOrDefault()) select c.Login);
            var checkExisting3 = (from c in checkExisting2 where c.Value.Day.Equals(Calendar1.SelectedDate.Day) select c);
            var checkExisting4 = (from c in db.UserDatas where c.Login.Equals(checkExisting3.FirstOrDefault()) select c.Homework);
            var splitDate = checkExisting3.FirstOrDefault().ToString().Split('/')[1];

            if (Calendar1.SelectedDate.Day == Convert.ToInt32(splitDate))
            {
                Label1.Text = checkExisting4.FirstOrDefault().ToString();
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DataBase.DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
            var checkExisting = (from c in db.Users where c.Name.Contains(User.Identity.Name) select c.ID);
            var checkExisting2 = (from c in db.UserDatas where c.UserID.Equals(checkExisting.SingleOrDefault()) select c.Login);
            foreach(DateTime dr in checkExisting2)
            {
                if (dr.Date == e.Day.Date)
                {
                    e.Cell.BackColor = Color.Red;
                }
            }
        }
    }
}