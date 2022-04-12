using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapstoneWebPage
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //IF NO ID SUBMITTED ROLE:
            /*using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration;

namespace CapstoneWebPage.uauth
{
    public partial class create_account1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private List<String> getUsedIds()
        {
            List<String> ids = getUsedIds();

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT PropertyValuesString FROM aspnet_Profile WHERE PropertyNames = 'MGAId'"))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            ids.Append(reader.GetString(0));
                        }
                    }

                }
            }
            return ids;
        }

        private bool isValidMGAId(string id)
        {
            if (SWORDSDatabaseConnection.IdExists(id))
            {

                if (getUsedIds().Contains(id))
                {
                    return false;
                }
                else
                {
                    return true;
                }

            }
            else { return false; }
        }
        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Membership.ValidateUser(CreateUserWizard1.UserName, CreateUserWizard1.Password);
            string inputMGAId = txtMGAId.Text.Trim();
            isValidMGAId(inputMGAId);

            bool MGAIdUsed = false;

            if (inputMGAId[inputMGAId.Length - 1] == '9')
            {
                Roles.AddUserToRole(CreateUserWizard1.UserName, "Staff");
            }
            else
            {
                Roles.AddUserToRole(CreateUserWizard1.UserName, "Student");
            }


            if (!(MGAIdUsed))
            {
                HttpContext.Current.Profile.SetPropertyValue("MGAId", txtMGAId.Text.Trim());
            }

        }
    }
}
             */
        }
    }
}