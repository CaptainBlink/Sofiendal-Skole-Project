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
    
    public partial class overview : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (from c in db.Users where c.Token.Contains(HttpContext.Current.User.Identity.Name) select c).FirstOrDefault();

            if (user.Type != true)
            {
                Response.Redirect("~/GoogleLogin.aspx");
            }

            welcome.Text = user.Name.ToUpper();
            imgPicture.ImageUrl = user.Picture;
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

        protected void btnTime_Click(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

    }
}