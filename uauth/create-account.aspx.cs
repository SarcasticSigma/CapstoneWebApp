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

namespace CapstoneWebPage
{
    public partial class create_account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string hashPassword()
        {
            //Create a hash from the user's password.
            System.IO.MemoryStream memorySteam = new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(txtPassword.Text));
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
            return sb.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool accountCreationSuccess = false;
            try
            {
                //Hash Password


                StringBuilder SQLString = new StringBuilder("INSERT INTO Users (Username, ");

                //Check the SWORDS Database for the ID - NOTE: This needs to be guarded against 
                //TODO: In implementation: Ensure this is guarded against SQL Injection. If accessing actual SWORDS database, just used a parameterized query.
                long providedId;
                if (!(long.TryParse(txtMGAId.Text, out providedId))) { throw new ArgumentException("ID is not valid."); };
                SWORDSDatabaseConnection dbConnection = new SWORDSDatabaseConnection(providedId);
                if (dbConnection.IDType == SWORDSDatabaseConnection.idTypes.STUDENT)
                {
                    SQLString.Append("StudentId, ");

                    //Do student stuff
                }
                else if (dbConnection.IDType == SWORDSDatabaseConnection.idTypes.STAFF)
                {
                    SQLString.Append("StaffId, ");
                    //Do staff stuff
                }
                else
                {
                    //Error creating account, Not a valid ID.
                }

                SQLString.Append("PasswordHash, FirstName, LastName, PhoneNumber, Email) VALUES (@username, @idNum, @passwordHash, @firstName, @lastName, @phoneNumber, @email)");
                string mySQL = SQLString.ToString();
            System.Diagnostics.Debug.WriteLine(mySQL);  
                
                string myConString = ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
                using (SqlConnection myCon = new SqlConnection(myConString))
                {
                    using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                    {

                        //Add with value for each parameter
                        myCom.Parameters.AddWithValue("@username", txtUsername.Text);
                        myCom.Parameters.AddWithValue("@idNum", txtMGAId.Text);
                        if (txtPassword.Text.Equals(txtPasswordConfirm.Text))
                        {
                            myCom.Parameters.AddWithValue("@passwordHash", hashPassword());
                        }
                        else
                        {
                            throw new ArgumentException("Passwords do not match!");
                        }
                        myCom.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                        myCom.Parameters.AddWithValue("@lastName", txtLastName.Text);
                        myCom.Parameters.AddWithValue("@phoneNumber", txtPhoneNumber.Text);
                        myCom.Parameters.AddWithValue("@email", txtEmail.Text);

                        myCon.Open();
                        int affected = myCom.ExecuteNonQuery();
                        myCon.Close();

                        accountCreationSuccess = affected == 1 ? true : false;
                        if (affected == 1)
                        {
                            accountCreationSuccess = true;

                        }
                        else {
                            accountCreationSuccess = false;
                        }
                    }
                }

            }
            catch (Exception ignored)
            {
                System.Diagnostics.Debug.WriteLine(ignored.StackTrace);
                accountCreationSuccess = false;
            }
            finally
            {
                diaAccountCreationResult.Attributes.Add("open", "true");
                pDialogOutput.InnerText = accountCreationSuccess ? "Account creation succeeded!\n Please log in." : "Error, could not create account! Please try again, if the issue persists please contact our support!";
            }



            //Table name, column names, corrsponding parameter names.
            //Check if a last name was provided.

        }
    }
}