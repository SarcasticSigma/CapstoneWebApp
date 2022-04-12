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
            if (!Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Student"))
            {
                MessageBox
                
                Roles.AddUserToRole(Membership.GetUser().UserName, "Student");
            }


            if ()
            SWORDSDatabaseConnection SWORDS = new SWORDSDatabaseConnection();
            
            
            MembershipUser user = Membership.GetUser();

            txtUsername.Text = user.UserName;
            txtEmail.Text = user.Email;
            txtName.Text = SWORDS.FullName;
            
            if (!Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Student"))
            {
                
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}