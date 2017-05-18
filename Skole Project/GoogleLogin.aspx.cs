using Skole_Project.DataBase;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skole_Project
{
    public partial class GoogleLogin : System.Web.UI.Page
    {
        public string result;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.result = "";
            if (Request.InputStream.Length > 0)
            {
                using (Stream receivedStream = Request.InputStream)
                {
                    using (StreamReader reader = new StreamReader(receivedStream, Encoding.UTF8))
                    {
                        result = reader.ReadLine();
                    }
                }
            }
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
                    if(user.Picture != Picture.Value)
                    {
                        user.Picture = Picture.Value;
                        db.SubmitChanges();
                    }
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
                    newUser.Picture = Picture.Value;
                    newUser.Class = 1;
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