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
        protected void Page_Load(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();
            //if (user.Type != false)
            //{
            //    Response.Redirect("~/Teacher/Statistics.aspx");
            //}
            SqlDataSource1.SelectParameters["ScheduleID"].DefaultValue = user.ID.ToString();
            SqlDataSource2.SelectParameters["HomeworkID"].DefaultValue = user.ID.ToString();
            welcome.Text = "Welcome," + user.Name;
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
    }
}