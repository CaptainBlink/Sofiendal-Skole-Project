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
    public partial class EditSchedule : System.Web.UI.Page
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
            SqlDataSource1.SelectParameters["Class"].DefaultValue = RadioButtonList1.SelectedValue;
        }

        public string ProcessMyDataItem1(object LunchBreak)
        {

            if (LunchBreak.ToString() == "Pause")
            {
                return "font-weight: 900;";
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

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id1 = Convert.ToInt32((row.FindControl("HiddenField1") as HiddenField).Value);
            string Monday = (row.FindControl("txtMonday") as TextBox).Text;
            string time1 = (row.FindControl("lbltime1") as Label).Text;
            string EntryMonday = time1 + ";" + Monday;
            SqlDataSource1.UpdateParameters["Monday"].DefaultValue = EntryMonday;

            string Tuesday = (row.FindControl("txtTuesday") as TextBox).Text;
            string time2 = (row.FindControl("lbltime2") as Label).Text;
            
            if (time2 == "")
            {
                string EntryTuesday = time1 + ";" + Tuesday;
                SqlDataSource1.UpdateParameters["Tuesday"].DefaultValue = EntryTuesday;
            }
            else
            {
                string EntryTuesday = time2 + ";" + Tuesday;
                SqlDataSource1.UpdateParameters["Tuesday"].DefaultValue = EntryTuesday;
            }
                      
            string Wednesday = (row.FindControl("txtWednesday") as TextBox).Text;
            string time3 = (row.FindControl("lbltime3") as Label).Text;

            if (time3 == "")
            {
                string EntryWednesday = time1 + ";" + Wednesday;
                SqlDataSource1.UpdateParameters["Wednesday"].DefaultValue = EntryWednesday;
            }
            else
            {
                string EntryWednesday = time3 + ";" + Wednesday;
                SqlDataSource1.UpdateParameters["Wednesday"].DefaultValue = EntryWednesday;
            }

            string Thursday = (row.FindControl("txtThursday") as TextBox).Text;
            string time4 = (row.FindControl("lbltime4") as Label).Text;

            if (time4== "")
            {
                string EntryThursday = time1 + ";" + Thursday;
                SqlDataSource1.UpdateParameters["Thursday"].DefaultValue = EntryThursday;
            }
            else
            {
                string EntryThursday = time4 + ";" + Thursday;
                SqlDataSource1.UpdateParameters["Thursday"].DefaultValue = EntryThursday;
            }        

            string Friday = (row.FindControl("txtFriday") as TextBox).Text;
            string time5 = (row.FindControl("lbltime5") as Label).Text;

            if (time5 == "")
            {
                string EntryFriday = time1 + ";" + Friday;
                SqlDataSource1.UpdateParameters["Friday"].DefaultValue = EntryFriday;
            }
            else
            {
                string EntryFriday = time5 + ";" + Friday;
                SqlDataSource1.UpdateParameters["Friday"].DefaultValue = EntryFriday;
            }

            SqlDataSource1.UpdateParameters["ID"].DefaultValue = id1.ToString();

            SqlDataSource1.UpdateCommand = "UPDATE Schedule SET Monday=@Monday, Tuesday=@Tuesday, Wednesday=@Wednesday, Thursday=@Thursday, Friday=@Friday WHERE ID = @ID";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["Class"].DefaultValue = RadioButtonList1.SelectedValue;
            GridView1.DataBind();
        }
    }
}