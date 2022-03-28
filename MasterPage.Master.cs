using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;


namespace CapstoneWebPage
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            ancUserHome.ServerClick += new EventHandler(btnUserHome_Click);
            ancAbout.ServerClick += new EventHandler(btnAbout_Click);
            ancAccountInformation.ServerClick += new EventHandler(btnAccountInformation_Click);
            ancViewPackages.ServerClick += new EventHandler(btnViewPackages_Click);
            ancSignout.ServerClick += new EventHandler(btnLogout_Click);
        }

        protected void btnUserHome_Click(object sender, EventArgs e) {
            HttpContext.Current.Response.Redirect("~/auth/user-home.aspx");
        }
        protected void btnAbout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/auth/about.aspx");
        }
        protected void btnAccountInformation_Click(object sender, EventArgs e) {
            HttpContext.Current.Response.Redirect("~/auth/account-info.aspx");
        }        
        protected void btnViewPackages_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/auth/view-packages.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            HttpContext.Current.Response.Redirect("~/uauth/home.aspx");
        }

    }
}