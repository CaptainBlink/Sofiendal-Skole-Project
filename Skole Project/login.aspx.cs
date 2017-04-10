using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skole_Project
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ValidateUser(txtUserName.Value, txtUserPass.Value))
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Value, false);
            else
                Label1.Visible = true;
        }
        private bool ValidateUser(string eMail, string passWord)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return false;
            }
            try
            {
                Skole_Project.DataBase.DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
                DataBase.User user = (from m in db.Users
                                      where m.Username.ToLower() == eMail.ToLower() &&
                                      m.Password == passWord
                                      select m).SingleOrDefault();
                if (user != null)
                {
                    return true;
                }

            }
            catch
            {
                Response.Write("error");
            }
            return false;
        }
    }
}