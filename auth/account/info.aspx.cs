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

            MembershipUser user = Membership.GetUser();
            string[] currentUserRoles = Roles.GetRolesForUser();
            if (currentUserRoles.Contains("Admin") || currentUserRoles.Contains("Student"))

            {
                txtUsername.Text = user.UserName;
                txtEmail.Text = HttpContext.Current.Profile.GetPropertyValue("Email") as string;
                txtMGAId.Text = HttpContext.Current.Profile.GetPropertyValue("MGAId") as string;
                txtName.Text = HttpContext.Current.Profile.GetPropertyValue("FullName") as string;
                txtPhoneNumber.Text = HttpContext.Current.Profile.GetPropertyValue("PhoneNumber") as string;
                txtStudentType.Text = HttpContext.Current.Profile.GetPropertyValue("ResidentialStatus") as string;

            }

            else
            {
                HttpContext.Current.Response.Redirect("~/auth/account/add-id.aspx");
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}