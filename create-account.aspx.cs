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
    public partial class create_account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool accountCreationResult = false;
            try
            {
                //Create a hash from the user's password.
                System.IO.MemoryStream memorySteam = new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(txtPassword.Text));
                System.Security.Cryptography.HashAlgorithm sha = SHA256.Create();
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

                StringBuilder SQLString = new StringBuilder("INSERT INTO Users ");


                //Check if non-required are provided.

                //Check the SWORDS Database for the ID - NOTE: This needs to be guarded against 
                //TODO: In implementation: Ensure this is guarded against SQL Injection. If accessing actual SWORDS database, just used a parameterized query.
                long providedId;
                if (!(long.TryParse(txtMGAId.Text, out providedId))) { throw new ArgumentException("ID is not valid."); };
                
                SWORDSDatabaseConnection dbConnection = new SWORDSDatabaseConnection(providedId);
                Console.WriteLine(dbConnection);
                



                String mySQL = SQLString.ToString();

                
                String myConStr = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\SquireDatabase.mdf;Integrated Security=True";
                using (SqlConnection myCon = new SqlConnection(myConStr))
                {
                    using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                    {
                        
                        //Add with value for each parameter
                        
                        
                        
                        myCom.Parameters.AddWithValue("@username", txtFirstName.Text);
                        myCom.Parameters.AddWithValue("@MGAEmail");
                        
                        myCon.Open();
                        myCom.ExecuteNonQuery();
                        myCon.Close();


                        
                        //Display Output
                        
                        
                    }
                }
                //If successful
                accountCreationResult = true;
            }
            catch (Exception ignored)
            {
                Console.WriteLine(ignored.StackTrace);
                accountCreationResult = false;
            }
            finally
            {
                diaAccountCreationResult.Attributes.Add("open", "true");
                pDialogOutput.InnerText = accountCreationResult ? "Account creation succeeded!\n Please log in." : "Error, could not create account! Please try again, if the issue persists please contact our support!";
            }


            
            //Table name, column names, corrsponding parameter names.
            //Check if a last name was provided.

        }
    }
}