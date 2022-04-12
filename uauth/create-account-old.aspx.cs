using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Profile;
using System.Web.Security;

namespace CapstoneWebPage
{
    public partial class create_account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "SQUIRE - Create account";
            if (!TOScheck.Checked)
            {
                btnSubmit.Enabled = false;
            }
            else
            {
                btnSubmit.Enabled = true;
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            /*
             * On Page Load - If logged in, redirect to home.
             * 
             * Process: 
             * Get all textfields.
             * Try and created a user with them.
             * If successful:
             * Make sure MGA ID hasn't been used.
             * Try and add profile information
             * Else, delete the user and create an error.
             * 
             * If everything is successful, clear all fields and redirect to login.
             */
            string username = txtUsername.Text;
            string password = txtPassword.Text;
            string MGAId = txtMGAId.Text;
            MembershipUser newUser = null;
            try
            {
                newUser = Membership.CreateUser(username, password);
                //FormsAuthentication.Authenticate(newUser.UserName, )
                
            }
            catch (MembershipCreateUserException exception) {
                System.Diagnostics.Debug.Write(exception.StackTrace);
                //Process failed, handle accordingly.
            }
            catch {//On Profile allocation failure
                
                if (!(newUser is null))
                {
                    Membership.DeleteUser(newUser.UserName);
                }
                
            }




















        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = TOScheck.Checked;
        }

        protected void TOScheck_CheckedChanged(object sender, EventArgs e)
        {
            if (TOScheck.Checked)
            {
                btnSubmit.Enabled = true;
                System.Diagnostics.Debug.WriteLine("Tos checked");
            }
            else {
                btnSubmit.Enabled = false;
                System.Diagnostics.Debug.WriteLine("Tos unchecked");
            }

        }
    }
}