using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;

namespace CapstoneWebPage
{
    public partial class Profile_test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            
            HttpContext.Current.Profile.SetPropertyValue("Name", (string)("Testing: "));

        }
    }
}