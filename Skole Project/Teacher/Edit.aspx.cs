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
            var checkExisting3 = (from c in db.Classes where c.ID.Equals(RadioButtonList1.SelectedValue) select c).FirstOrDefault();

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
                lastmonday = lastmonday.AddDays(-7);
                monday = monday.AddDays(-7);
                nextmonday = nextmonday.AddDays(-7);

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

        protected void Button1_Click(object sender, EventArgs e)
        {

            //last week

            SqlDataSource2.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource3.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource4.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource5.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource6.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            //this week


            SqlDataSource7.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource8.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource9.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource10.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource11.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            //next week


            SqlDataSource12.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource13.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource14.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource15.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            SqlDataSource16.SelectParameters["UserClass"].DefaultValue = RadioButtonList1.SelectedValue;

            Repeater1.DataBind();
            Repeater2.DataBind();
            Repeater3.DataBind();
            Repeater4.DataBind();
            Repeater5.DataBind();
            Repeater6.DataBind();
            Repeater7.DataBind();
            Repeater8.DataBind();
            Repeater8.DataBind();
            Repeater9.DataBind();
            Repeater10.DataBind();
            Repeater11.DataBind();
            Repeater12.DataBind();
            Repeater13.DataBind();
            Repeater14.DataBind();
            Repeater15.DataBind();
        }

        protected void OnEdit(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, true);

        }

        private void ToggleElements(RepeaterItem item, bool isEdit)
        {
            //Toggle Buttons.
            item.FindControl("lnkEdit").Visible = !isEdit;
            item.FindControl("lnkUpdate").Visible = isEdit;
            item.FindControl("lnkCancel").Visible = isEdit;
            item.FindControl("lnkDelete").Visible = !isEdit;

            //Toggle Labels.
            item.FindControl("lblSubj").Visible = !isEdit;
            item.FindControl("lblHomework").Visible = !isEdit;

            //Toggle TextBoxes.
            item.FindControl("txtSubj").Visible = isEdit;
            item.FindControl("txtHomework").Visible = isEdit;

        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int ID = int.Parse((item.FindControl("lblID") as Label).Text);
            string subject = (item.FindControl("txtSubj") as TextBox).Text.Trim();
            string homework = (item.FindControl("txtHomework") as TextBox).Text.Trim();
            var checkHomework = (from c in db.Homeworks where c.ID.Equals(ID) select c).FirstOrDefault();
            checkHomework.Subject = subject;
            checkHomework.Homework1 = homework;
            db.SubmitChanges();
            Repeater1.DataBind();
            Repeater2.DataBind();
            Repeater3.DataBind();
            Repeater4.DataBind();
            Repeater5.DataBind();
            Repeater6.DataBind();
            Repeater7.DataBind();
            Repeater8.DataBind();
            Repeater8.DataBind();
            Repeater9.DataBind();
            Repeater10.DataBind();
            Repeater11.DataBind();
            Repeater12.DataBind();
            Repeater13.DataBind();
            Repeater14.DataBind();
            Repeater15.DataBind();

        }

        protected void OnCancel(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, false);
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int ID = int.Parse((item.FindControl("lblID") as Label).Text);

            var checkHomework = (from c in db.Homeworks where c.ID.Equals(ID) select c).FirstOrDefault();
            db.Homeworks.DeleteOnSubmit(checkHomework);
            db.SubmitChanges();
            Repeater1.DataBind();
            Repeater2.DataBind();
            Repeater3.DataBind();
            Repeater4.DataBind();
            Repeater5.DataBind();
            Repeater6.DataBind();
            Repeater7.DataBind();
            Repeater8.DataBind();
            Repeater8.DataBind();
            Repeater9.DataBind();
            Repeater10.DataBind();
            Repeater11.DataBind();
            Repeater12.DataBind();
            Repeater13.DataBind();
            Repeater14.DataBind();
            Repeater15.DataBind();
        }

        protected void arrowleft_Click(object sender, ImageClickEventArgs e)
        {
            var last = divlastweek.Style.Value;
            var cur = currentweek.Style.Value;
            var next = divnextweek.Style.Value;

            if (last.Contains("display: none") && cur.Contains("display: block"))
            {
                divlastweek.Attributes["style"] = "margin - bottom: 30px; display: block";
                currentweek.Attributes["style"] = "margin - bottom: 30px; display: none";
                divnextweek.Attributes["style"] = "margin - bottom: 30px; display: none";
            }

            else if (cur.Contains("display: none") && last.Contains("display: none"))
            {
                currentweek.Attributes["style"] = "margin - bottom: 30px; display: block";
                divlastweek.Attributes["style"] = "margin - bottom: 30px; display: none";
                divnextweek.Attributes["style"] = "margin - bottom: 30px; display: none";
            }
        }

        protected void arrowright_Click(object sender, ImageClickEventArgs e)
        {
            var last = divlastweek.Style.Value;
            var cur = currentweek.Style.Value;
            var next = divnextweek.Style.Value;

            if (next.Contains("display: none") && cur.Contains("display: block"))
            {
                divnextweek.Attributes["style"] = "margin - bottom: 30px; display: block";
                currentweek.Attributes["style"] = "margin - bottom: 30px; display: none";
                divlastweek.Attributes["style"] = "margin - bottom: 30px; display: none";
            }

            else if (last.Contains("display: block") && cur.Contains("display: none"))
            {
                currentweek.Attributes["style"] = "margin - bottom: 30px; display: block";
                divlastweek.Attributes["style"] = "margin - bottom: 30px; display: none";
                divnextweek.Attributes["style"] = "margin - bottom: 30px; display: none";
            }

        }

        protected void btnMenu1_Click(object sender, EventArgs e)
        {

            var menu_elem1 = menu_element1.Style.Value;
            if (menu_elem1.Contains("display: none"))
            {
                menu_element1.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow1.Src = "../img/uparrow.png";
            }
            else if (menu_elem1.Contains("display: block"))
            {
                menu_element1.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow1.Src = "../img/downarrow.png";
            }
        }

        protected void btnMenu2_Click(object sender, EventArgs e)
        {

            var menu_elem2 = menu_element2.Style.Value;
            if (menu_elem2.Contains("display: none"))
            {
                menu_element2.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow2.Src = "../img/uparrow.png";
            }
            else if (menu_elem2.Contains("display: block"))
            {
                menu_element2.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow2.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu3_Click(object sender, EventArgs e)
        {

            var menu_elem3 = menu_element3.Style.Value;
            if (menu_elem3.Contains("display: none"))
            {
                menu_element3.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow3.Src = "../img/uparrow.png";
            }
            else if (menu_elem3.Contains("display: block"))
            {
                menu_element3.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow3.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu4_Click(object sender, EventArgs e)
        {

            var menu_elem4 = menu_element4.Style.Value;
            if (menu_elem4.Contains("display: none"))
            {
                menu_element4.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow4.Src = "../img/uparrow.png";
            }
            else if (menu_elem4.Contains("display: block"))
            {
                menu_element4.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow4.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu5_Click(object sender, EventArgs e)
        {

            var menu_elem5 = menu_element5.Style.Value;
            if (menu_elem5.Contains("display: none"))
            {
                menu_element5.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow5.Src = "../img/uparrow.png";
            }
            else if (menu_elem5.Contains("display: block"))
            {
                menu_element5.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow5.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu6_Click(object sender, EventArgs e)
        {

            var menu_elem6 = menu_element6.Style.Value;
            if (menu_elem6.Contains("display: none"))
            {
                menu_element6.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow6.Src = "../img/uparrow.png";
            }
            else if (menu_elem6.Contains("display: block"))
            {
                menu_element6.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow6.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu7_Click(object sender, EventArgs e)
        {

            var menu_elem7 = menu_element7.Style.Value;
            if (menu_elem7.Contains("display: none"))
            {
                menu_element7.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow7.Src = "../img/uparrow.png";
            }
            else if (menu_elem7.Contains("display: block"))
            {
                menu_element7.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow7.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu8_Click(object sender, EventArgs e)
        {

            var menu_elem8 = menu_element8.Style.Value;
            if (menu_elem8.Contains("display: none"))
            {
                menu_element8.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow8.Src = "../img/uparrow.png";
            }
            else if (menu_elem8.Contains("display: block"))
            {
                menu_element8.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow8.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu9_Click(object sender, EventArgs e)
        {

            var menu_elem9= menu_element9.Style.Value;
            if (menu_elem9.Contains("display: none"))
            {
                menu_element9.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow9.Src = "../img/uparrow.png";
            }
            else if (menu_elem9.Contains("display: block"))
            {
                menu_element9.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow9.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu10_Click(object sender, EventArgs e)
        {

            var menu_elem10 = menu_element10.Style.Value;
            if (menu_elem10.Contains("display: none"))
            {
                menu_element10.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow10.Src = "../img/uparrow.png";
            }
            else if (menu_elem10.Contains("display: block"))
            {
                menu_element10.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow10.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu11_Click(object sender, EventArgs e)
        {

            var menu_elem11 = menu_element11.Style.Value;
            if (menu_elem11.Contains("display: none"))
            {
                menu_element11.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow11.Src = "../img/uparrow.png";
            }
            else if (menu_elem11.Contains("display: block"))
            {
                menu_element11.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow11.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu12_Click(object sender, EventArgs e)
        {

            var menu_elem12 = menu_element12.Style.Value;
            if (menu_elem12.Contains("display: none"))
            {
                menu_element12.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow12.Src = "../img/uparrow.png";
            }
            else if (menu_elem12.Contains("display: block"))
            {
                menu_element12.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow12.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu13_Click(object sender, EventArgs e)
        {

            var menu_elem13 = menu_element13.Style.Value;
            if (menu_elem13.Contains("display: none"))
            {
                menu_element13.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow13.Src = "../img/uparrow.png";
            }
            else if (menu_elem13.Contains("display: block"))
            {
                menu_element13.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow13.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu14_Click(object sender, EventArgs e)
        {

            var menu_elem14 = menu_element14.Style.Value;
            if (menu_elem14.Contains("display: none"))
            {
                menu_element14.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow14.Src = "../img/uparrow.png";
            }
            else if (menu_elem14.Contains("display: block"))
            {
                menu_element14.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow14.Src = "../img/downarrow.png";
            }

        }

        protected void btnMenu15_Click(object sender, EventArgs e)
        {

            var menu_elem15 = menu_element15.Style.Value;
            if (menu_elem15.Contains("display: none"))
            {
                menu_element15.Attributes["style"] = "display: block; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate; animation-duration: 1s;";
                arrow15.Src = "../img/uparrow.png";
            }
            else if (menu_elem15.Contains("display: block"))
            {
                menu_element15.Attributes["style"] = "display: none; box-shadow: gray 0px 0px 1px 0px, gray 0px 0px 0px 0px; animation-name: menu_animate_reverse; animation-duration: 1s;";
                arrow15.Src = "../img/downarrow.png";
            }

        }

        protected void btnAddHomework1_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj1.Text;
            homework.Homework1 = txtAddHomework1.Text;
            string[] test = date1.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj1.Text = "";
            txtAddHomework1.Text = "";
            Repeater1.DataBind();
        }

        protected void btnAddHomework2_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj2.Text;
            homework.Homework1 = txtAddHomework2.Text;
            string[] test = date2.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj2.Text = "";
            txtAddHomework2.Text = "";
            Repeater2.DataBind();
        }

        protected void btnAddHomework3_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj3.Text;
            homework.Homework1 = txtAddHomework3.Text;
            string[] test = date3.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj3.Text = "";
            txtAddHomework3.Text = "";
            Repeater3.DataBind();

        }

        protected void btnAddHomework4_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj4.Text;
            homework.Homework1 = txtAddHomework4.Text;
            string[] test = date4.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj4.Text = "";
            txtAddHomework4.Text = "";
            Repeater4.DataBind();

        }

        protected void btnAddHomework5_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj5.Text;
            homework.Homework1 = txtAddHomework5.Text;
            string[] test = date5.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj5.Text = "";
            txtAddHomework5.Text = "";
            Repeater5.DataBind();

        }

        protected void btnAddHomework6_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj6.Text;
            homework.Homework1 = txtAddHomework6.Text;
            string[] test = date6.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj6.Text = "";
            txtAddHomework6.Text = "";
            Repeater6.DataBind();

        }

        protected void btnAddHomework7_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj7.Text;
            homework.Homework1 = txtAddHomework7.Text;
            string[] test = date7.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj7.Text = "";
            txtAddHomework7.Text = "";
            Repeater7.DataBind();
        }

        protected void btnAddHomework8_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj8.Text;
            homework.Homework1 = txtAddHomework8.Text;
            string[] test = date8.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj8.Text = "";
            txtAddHomework8.Text = "";
            Repeater8.DataBind();
        }

        protected void btnAddHomework9_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj9.Text;
            homework.Homework1 = txtAddHomework9.Text;
            string[] test = date9.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj9.Text = "";
            txtAddHomework9.Text = "";
            Repeater9.DataBind();
        }

        protected void btnAddHomework10_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj10.Text;
            homework.Homework1 = txtAddHomework10.Text;
            string[] test = date10.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj10.Text = "";
            txtAddHomework10.Text = "";
            Repeater10.DataBind();
        }

        protected void btnAddHomework11_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj11.Text;
            homework.Homework1 = txtAddHomework11.Text;
            string[] test = date11.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj11.Text = "";
            txtAddHomework11.Text = "";
            Repeater11.DataBind();
        }

        protected void btnAddHomework12_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj12.Text;
            homework.Homework1 = txtAddHomework12.Text;
            string[] test = date12.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj12.Text = "";
            txtAddHomework12.Text = "";
            Repeater12.DataBind();
        }

        protected void btnAddHomework13_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj13.Text;
            homework.Homework1 = txtAddHomework13.Text;
            string[] test = date13.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj13.Text = "";
            txtAddHomework13.Text = "";
            Repeater13.DataBind();

        }

        protected void btnAddHomework14_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj14.Text;
            homework.Homework1 = txtAddHomework14.Text;
            string[] test = date14.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj14.Text = "";
            txtAddHomework14.Text = "";
            Repeater14.DataBind();
        }

        protected void btnAddHomework15_Click(object sender, EventArgs e)
        {
            Homework homework = new Homework();
            homework.Class = Convert.ToInt32(RadioButtonList1.SelectedValue);
            homework.Subject = txtAddSubj15.Text;
            homework.Homework1 = txtAddHomework15.Text;
            string[] test = date15.Text.Split('/');
            string ss = test[1] + "/" + test[0];
            homework.Date = Convert.ToDateTime(ss);
            db.Homeworks.InsertOnSubmit(homework);
            db.SubmitChanges();
            txtAddSubj15.Text = "";
            txtAddHomework15.Text = "";
            Repeater15.DataBind();
        }
    }
}