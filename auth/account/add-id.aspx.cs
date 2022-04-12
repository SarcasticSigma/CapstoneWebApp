using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace CapstoneWebPage.auth.account
{
    public partial class add_id : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentUser = Membership.GetUser().UserName;
            if (Roles.GetRolesForUser(currentUser).Contains("Student") || Roles.GetRolesForUser(currentUser).Contains("Staff"))
            {
                HttpContext.Current.Response.Redirect("~/auth/account/info.aspx");
            }
            

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //If the user has already been assigned a role, redirect them away.
            if (Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Student") || Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Staff"))
            {
                HttpContext.Current.Response.Redirect("~/auth/account/info.aspx");
            }
            
            string username = Membership.GetUser().UserName;
                        
            string inputId = txtMGAId.Text.Trim();  
            //Add a corresponding role based on whether the user is a student or staff member and add their MGA id to their profile.
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
                else {
                    throw new ArgumentException("MGA ID's must be either student or staff.");
                }
            }


            
            
            HttpContext.Current.Response.Redirect("~/auth/account/info.aspx");

        }
    }
}