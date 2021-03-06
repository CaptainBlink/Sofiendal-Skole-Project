﻿using Skole_Project.DataBase;
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



        //protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        //{
        //    DataBase.DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
        //    var checkExisting = (from c in db.Users where c.Name.Contains(User.Identity.Name) select c.ID);
        //    var checkExisting2 = (from c in db.UserDatas where c.UserID.Equals(checkExisting.SingleOrDefault()) select c.Login);
        //    var checkExisting3 = (from c in checkExisting2 where c.Value.Day.Equals(Calendar1.SelectedDate.Day) select c);
        //    var checkExisting4 = (from c in db.UserDatas where c.Login.Equals(checkExisting3.FirstOrDefault()) select c.Homework);
        //    var splitDate = checkExisting3.FirstOrDefault().ToString().Split('/')[1];

        //    if (Calendar1.SelectedDate.Day == Convert.ToInt32(splitDate))
        //    {
        //        if (checkExisting4.FirstOrDefault() == null)
        //        {
        //            Label1.Text = "No Entries";
        //        }
        //        else
        //        {
        //            Label1.Text = checkExisting4.FirstOrDefault().ToString();
        //        }
        //    }
        //}

        //protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    foreach (RepeaterItem item in Repeater1.Items)
        //    {

        //        Calendar calendar = (Calendar)item.FindControl("Calendar1");
        //        HiddenField test = (HiddenField)item.FindControl("txtOuterID");
        //        DataBase.DataClasses1DataContext db = new DataBase.DataClasses1DataContext();
        //        var checkExisting = (from c in db.Users where c.ID.Equals(test.Value) select c.ID);
        //        var checkExisting2 = (from c in db.UserDatas where c.UserID.Equals(checkExisting.SingleOrDefault()) select c.Login);
        //        if (test.Value == calendar.ToolTip)
        //        {
        //            foreach (DateTime dr in checkExisting2)
        //            {
        //                if (dr.Date == e.Day.Date)
        //                {
        //                    e.Cell.BackColor = Color.Red;
        //                }
        //            }
        //        }
        //    }
        //}

        public string ProcessMyDataItem(object myValue)
        {
            if (myValue == DBNull.Value)
            {
                myValue = "No Entries";
            }

            return myValue.ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var checkExisting1 = (from c in db.Users where c.Name.Contains(txtSearch.Text) select c).FirstOrDefault();
            var checkExisting2 = (from c in db.UserDatas where c.UserID.Equals(checkExisting1.ID) select c);
            var checkExisting3 = (from c in db.Classes where c.ID.Equals(checkExisting1.Class) select c).FirstOrDefault();

            studentPic.ImageUrl = checkExisting1.Picture;
            lblname.Text = checkExisting1.Name;
            lblclass.Text = "6." + checkExisting3.Name;
            var attendance = (from c in db.UserDatas where c.UserID.Equals(checkExisting1.ID) select c);
            int att = attendance.Count();
            lblattendance.Text = "Attended:" + "\n" + "<b>" + att + "</b>";
            if (checkExisting1.Mandatory == false)
            {
                mandatoryinfo.Visible = false;
                lblmandatory.Text = "";
                mandatoryimg.ImageUrl = "";
                lblmandatoryreason.Text = "";
            }
            else
            {
                mandatoryinfo.Visible = true;
                mandatoryimg.ImageUrl = "~/img/mandatory.png";
                lblmandatory.Text = "Agreement with parents";
                lblmandatoryreason.Text = checkExisting1.MandatoryReason;
            }
            studentinfo.Visible = true;
        }
    }
}