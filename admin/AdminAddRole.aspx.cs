using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace CapstoneWebPage.admin
{
    public partial class AdminAddRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string roleName = txtRoleName.Text.Trim();
            if (!Roles.RoleExists(roleName)) { Roles.CreateRole(roleName); lblOutput.Text = "Role Created!"; }
            else {
                lblOutput.Text = "Error! Role already exists!";
            }
        }
    }
}