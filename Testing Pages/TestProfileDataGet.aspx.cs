using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapstoneWebPage.Testing_Pages
{
    public partial class TestProfileDataGet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Output of Context: " + HttpContext.Current.Profile.GetPropertyValue("Name").ToString());
            output.Text = HttpContext.Current.Profile.GetPropertyValue("Name").ToString();
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}