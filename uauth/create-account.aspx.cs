using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace CapstoneWebPage.uauth
{
    public partial class create_account1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/login.aspx");
        }

        protected void StepNextButton_PreRender(object sender, EventArgs e)
        {
            this.Page.Form.DefaultButton = (sender as Button).UniqueID;
        }
    }

}