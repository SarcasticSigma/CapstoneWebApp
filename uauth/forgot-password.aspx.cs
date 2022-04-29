using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;

namespace CapstoneWebPage.uauth
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string targetUsername = TextBox1.Text.Trim().ToLower();
            bool canReset;
            try
            {
                if (Membership.GetUser(targetUsername) == null)
                {
                    canReset = false;

                }
                else
                {
                    canReset = true;
                }
            }
            catch (ArgumentNullException)
            {
                canReset = false;
            }

            if (canReset == true)
            {
                lblOutput.Text = "A password reset email has been sent, if you don't see it within 5 minutes please try again.";
            }
            else
            {
                lblOutput.Text = "Couldn't find a corresponding account. Are you sure you linked your MGA ID? If not, please create a new account.";
                TextBox1.Text = "";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/login.aspx");
        }
    }
}

