using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;

namespace CapstoneWebPage
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
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



        }
    }
}