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
                
            }

        }
    }
}