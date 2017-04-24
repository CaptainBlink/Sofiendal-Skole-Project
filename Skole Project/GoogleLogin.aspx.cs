using Skole_Project.DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skole_Project
{
    public partial class GoogleLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ValidateUser(Token.Value))
                FormsAuthentication.RedirectFromLoginPage(Token.Value, false);
            else
                Label1.Visible = true;
        }
        private bool ValidateUser(string eMail)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                return false;
            }
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                User user = (from m in db.Users where m.Token.Contains(Token.Value) select m).SingleOrDefault();
                if (user != null)
                {
                    return true;
                }
                else
                {
                    if(Token.Value == "")
                    {
                        return false;
                    }
                    User newUser = new User();
                    newUser.Name = Name.Value;
                    newUser.Token = Token.Value;
                    newUser.Class = "A";
                    newUser.Mandatory = false;
                    newUser.Type = false;
                    db.Users.InsertOnSubmit(newUser);
                    db.SubmitChanges();
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