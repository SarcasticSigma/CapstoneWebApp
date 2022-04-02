using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Web.Security;


namespace CapstoneWebPage
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            /*
            //Potential SQL INJECTION
            if (txtUsername.Text == "Sigma" && txtPassword.Text == "123")
            {
                FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, false);
            }
            else {
                lblOutput.Text = "Error: Username or password incorrect!";
                lblOutput.Style.Add("color", "red");
            }


            
            HashAlgorithm sha = SHA256.Create();

            System.IO.MemoryStream mStrm = new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(txtPassword.Text));
            byte[] result = sha.ComputeHash(mStrm);


            String hash = BitConverter.ToString(result);
            StringBuilder sb = new StringBuilder();
            foreach (char c in hash)
            {
                if (c != '-')
                {
                    sb.Append(c);
                }
            }
            String finalHash = sb.ToString();
            lblOutput.Text = "Output:" + txtUsername.Text + " " + txtPassword.Text + "\nHash: " + finalHash;

            */

        }

        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Redirect("~/uauth/create-account.aspx");
        }
    }
}