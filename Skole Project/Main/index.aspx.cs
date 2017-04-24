using Skole_Project.DataBase;
using System;
using System.Collections.Generic;
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
            welcome.Text = "Welcome," + user.Name;
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
           
            FormsAuthentication.SignOut();
            Response.Redirect("https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:6829/GoogleLogin.aspx");
            
        }
    }
}