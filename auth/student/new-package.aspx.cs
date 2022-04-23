using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;


namespace CapstoneWebPage.auth.student
{
    public partial class new_package : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Inserts a new package into the database corresponding to the current user. 
        /// </summary>
        /// <returns>Returns a boolean describing whether or not the insertion was a success.</returns>
        bool InsertNewPackage(string expectedArrivalDate, string trackingNumber, int ShippingCompanyId)
        {
            string expectedDate = expectedArrivalDate;
            string stringTrackingNumber = trackingNumber;
            int i = 0;

            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "INSERT INTO Packages () VALUES (@)";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                myCon.Open();
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {


                }
            }

            return false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                if (InsertNewPackage(txtExpectedDate.Text, txtTrackingNumber.Text, System.Convert.ToInt16(ddlShippingCompany.SelectedItem.Value)))
                {
                    txtExpectedDate.Text = "";
                    txtTrackingNumber.Text = "";
                    ddlShippingCompany.SelectedIndex = 0;
                }
                else
                {
                    lblOutput.Text = "Error inserting package! Please try again!";
                }
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value == "")
            {
                args.IsValid = false;
            }
            Regex rg = new Regex("[0-9][0-9](/|-|\\ )[0-9][0-9](/|-|\\ )[0-9][0-9][0-9][0-9]");
            if (rg.IsMatch(args.Value))
            {
                char[] targetDate = args.Value.ToCharArray();
                targetDate[2] = '/';
                targetDate[5] = '/';
                string targetDateString = targetDate.ToString();

                if (DateTime.TryParse(targetDateString, out _))
                {
                    args.IsValid = true;
                }

            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}