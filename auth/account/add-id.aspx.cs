using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CapstoneWebPage.auth.account
{
    public partial class add_id : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "SQUIRE - Add ID";

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate("submission");
            if (Page.IsValid)
            {
                string username = Membership.GetUser().UserName;

                string inputId = txtMGAId.Text.Trim();
                //Add a corresponding role based on whether the user is a student or staff member and add their MGA id to their profile.

                //Erroneous check, validator handles now:
                if (SWORDSDatabaseConnection.IdExists(inputId))
                {

                    //Add fake data to profile. - Potentially change this to accept JSON.
                    SWORDSDatabaseConnection SWORDS = new SWORDSDatabaseConnection(inputId);
                    HttpContext.Current.Profile.SetPropertyValue("MGAId", txtMGAId.Text.Trim());
                    HttpContext.Current.Profile.SetPropertyValue("Email", SWORDS.Email);
                    HttpContext.Current.Profile.SetPropertyValue("FullName", SWORDS.FullName);
                    HttpContext.Current.Profile.SetPropertyValue("PhoneNumber", SWORDS.PhoneNumber);
                    HttpContext.Current.Profile.SetPropertyValue("ResidentialStatus", SWORDS.ResidentialStatus);


                    if (SWORDSDatabaseConnection.IsStaffId(inputId))
                    {
                        Roles.AddUserToRole(username, "Staff");
                    }
                    else if (SWORDSDatabaseConnection.IsStudentId(inputId))
                    {
                        Roles.AddUserToRole(username, "Student");
                    }
                    else
                    {
                        throw new ArgumentException("MGA ID's must be either student or staff.");
                    }
                }




                HttpContext.Current.Response.Redirect("~/auth/account/info.aspx");
            }
            
        }


        /// <summary>
        /// This function simulates checking the SWORDS database to see if an MGA id is present. 
        /// In the simulation, all ids that are of the required length are valid.
        /// In an implemented project this function would be replaced with access to SWORDS.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void SWORDSIdValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!(int.TryParse(args.Value, out _)))
            {
                SWORDSIdValidator.ErrorMessage = "Please enter a number!";
                args.IsValid = false;
                return;
            }
            if (String.IsNullOrEmpty(args.Value) || args.Value.Length < 9)
            {
                SWORDSIdValidator.ErrorMessage = "Please enter a valid MGA ID!";
                args.IsValid = false; 
                return;
            }
            if (!(args.Value.Substring(0, 3).Equals("983") && args.Value.Length == 9))
            {
                SWORDSIdValidator.ErrorMessage = "Please enter a valid MGA ID!";
                args.IsValid = false;
                return;

            }
            bool validId = validIdInput(source, args);
            if (!validId)
            {
                SWORDSIdValidator.ErrorMessage = "Please enter a valid MGA ID!";
                args.IsValid = false;
                return;
            }
            args.IsValid = true;


        }


        /// <summary>
        /// This function ensures that the id input has not already been used.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected bool validIdInput(object source, ServerValidateEventArgs args)
        {
            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "SELECT PropertyValuesString FROM aspnet_Profile";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                myCon.Open();
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    using (SqlDataReader reader = myCom.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            //TODO Implemented version needs to have this regex tweaked to allow 7 at the end of an ID.
                            Regex rx = new Regex("983[0-9]{5}[0-6,8-9]{1}");
                            string readId = rx.Match(reader.GetString(0)).Value;
                            if (readId == args.Value)
                            {
                                return false;

                            }
                        }
                        return true;
                    }
                }
            }
        }
    }
}
