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
            if (Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Student") || Roles.GetRolesForUser(Membership.GetUser().UserName).Contains("Staff"))
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
                HttpContext.Current.Profile.SetPropertyValue("MGAId", txtMGAId.Text.Trim());
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