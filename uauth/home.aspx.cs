﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapstoneWebPage.uauth
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ancLogin.ServerClick += new EventHandler(ancLogin_Click);
        }
        protected void ancLogin_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/login.aspx");
        }
    }
    
}