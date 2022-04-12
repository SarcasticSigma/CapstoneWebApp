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

        }

    

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/create-account.aspx");
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {


            if (Roles.GetRolesForUser(Login1.UserName).Contains("Student"))
            {
                Login1.DestinationPageUrl = "~/auth/student/user-home.aspx";
            }

        }
    }
}