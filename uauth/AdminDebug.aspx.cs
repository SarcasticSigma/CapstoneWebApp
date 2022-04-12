using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace CapstoneWebPage.admin
{
    public partial class Debu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated) { 
            txtUser.Text = Membership.GetUser().UserName;

            foreach (string s in Roles.GetRolesForUser(Membership.GetUser().UserName))
            {
                txtUserRoles.Text += s + " , ";
            }
            txtUserProfileProperties.Text = $"MGA Id: {HttpContext.Current.Profile.GetPropertyValue("MGAId")}" +
                $"\nFull Name: {HttpContext.Current.Profile.GetPropertyValue("FullName")}" +
                $"\nPhone Number: {HttpContext.Current.Profile.GetPropertyValue("PhoneNumber")}" +
                $"\nResidential Status: {HttpContext.Current.Profile.GetPropertyValue("ResidentialStatus")}" +
                $"\nEmail: {HttpContext.Current.Profile.GetPropertyValue("Email")}";
            }






        }
    }
}