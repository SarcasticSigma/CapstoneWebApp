using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Text;

namespace CapstoneWebPage.uauth
{
    public partial class TestLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                StringBuilder sb = new StringBuilder();


                foreach (MembershipUser user in Membership.GetAllUsers())
                {
                    String username = user.UserName;
                    String email = user.Email;
                    
                    sb.Append($"Username: {username} Email: {email}");
                }
                userOutput.Text = sb.ToString();
                logged.Text = System.Web.HttpContext.Current.User.Identity.IsAuthenticated.ToString();
            }
        }
    }
}