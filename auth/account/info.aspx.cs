using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CapstoneWebPage
{
    public partial class account_info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Membership.GetUser() == null) {
                HttpContext.Current.Response.Redirect("~/uauth/login.aspx");
            }
            if (!Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Student") || !Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Staff"))
            {
                HttpContext.Current.Response.Redirect("~/auth/account/add-id.aspx");    
            }

            MembershipUser user = Membership.GetUser();
            txtUsername.Text = user.UserName;
            txtEmail.Text = HttpContext.Current.Profile.GetPropertyValue("Email") as string;
            txtMGAId.Text = HttpContext.Current.Profile.GetPropertyValue("MGAId") as string;
            txtName.Text = HttpContext.Current.Profile.GetPropertyValue("FullName") as string;
            txtPhoneNumber.Text = HttpContext.Current.Profile.GetPropertyValue("PhoneNumber") as string;
            txtStudentType.Text = HttpContext.Current.Profile.GetPropertyValue("ResidentialStatus") as string;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}