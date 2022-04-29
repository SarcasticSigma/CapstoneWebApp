﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;
using System.Configuration;

namespace CapstoneWebPage
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(Page.Title)) {
            Page.Title = ConfigurationManager.AppSettings["DefaultTitle"];
            }
            //Adds event handlers to navigation buttons.
            ancUserHome.ServerClick += new EventHandler(btnUserHome_Click);
            ancAbout.ServerClick += new EventHandler(btnAbout_Click);
            ancAccountInformation.ServerClick += new EventHandler(btnAccountInformation_Click);
            ancSignout.ServerClick += new EventHandler(btnLogout_Click);
            ancNewPackage.ServerClick += new EventHandler(btnNewPackage_Click);
        }

       

        //Click Handlers
        protected void btnNewPackage_Click(object sender, EventArgs e) {
            HttpContext.Current.Response.Redirect("~/auth/student/new-package.aspx");
        }
        protected void btnUserHome_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/auth/student/user-home.aspx");
        }
        protected void btnAbout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/about.aspx");
        }
        protected void btnAccountInformation_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/auth/account/info.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("UserName");
            FormsAuthentication.SignOut();
            HttpContext.Current.Response.Redirect("~/uauth/login.aspx");
        }

    }
}