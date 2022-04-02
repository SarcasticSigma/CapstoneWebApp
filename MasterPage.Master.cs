using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

namespace CapstoneWebPage
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Adds event handlers to navigation buttons.
            ancUserHome.ServerClick += new EventHandler(btnUserHome_Click);
            ancAbout.ServerClick += new EventHandler(btnAbout_Click);
            ancAccountInformation.ServerClick += new EventHandler(btnAccountInformation_Click);
            ancViewPackages.ServerClick += new EventHandler(btnViewPackages_Click);
            ancSignout.ServerClick += new EventHandler(btnLogout_Click);

            
            StringBuilder sb = new StringBuilder();
            //Generates a string representing all users in the database.
            foreach (MembershipUser user in Membership.GetAllUsers())
            {
                String username = user.UserName;
                String email = user.Email;
                sb.Append($"Username: {username} Email: {email}\n");
            }
            Users.Text = sb.ToString();
            
            //Shows authentication information
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated == true)
            {
                LoggedIn.Text = $"Currently Logged in as {Membership.GetUser().UserName}";
            }
            else
            {
                LoggedIn.Text = "Not currently Logged In";
            }

        }
                
        //Click Handlers
        protected void btnUserHome_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/auth/user-home.aspx");
        }
        protected void btnAbout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/auth/about.aspx");
        }
        protected void btnAccountInformation_Click(object sender, EventArgs e)
        {
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