using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Web.Security;


namespace CapstoneWebPage
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.User.IsInRole("Student"))
                {
                    HttpContext.Current.Response.Redirect("~/auth/student/User-home.aspx");
                }
                else
                {
                    HttpContext.Current.Response.Redirect("~/auth/account/add-id.aspx");
                }
            }
        }



        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/create-account.aspx");
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            
            Session.Add("UserName", Login1.UserName);
            if (Roles.GetRolesForUser(Login1.UserName).Contains("Student"))
            {
                Login1.DestinationPageUrl = "~/auth/student/user-home.aspx";
            }

        }

        protected void Login1_LoginError(object sender, EventArgs e)
        {

        }
    }
}