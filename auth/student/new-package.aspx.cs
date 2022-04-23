using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace CapstoneWebPage.auth.student
{
    public partial class new_package : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        string LookupUserId(string currentUser)
        {
            string myConStr = ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            string mySQL = "SELECT UserID FROM aspnet_Users WHERE UserName=@Username";
            List<string> userIds = new List<string>();

            using (SqlConnection myCon = new SqlConnection(myConStr))
            {
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@Username", currentUser);
                    System.Diagnostics.Debug.WriteLine($"Command String: {myCom.CommandText} Username: {currentUser}");
                    myCon.Open();
                    SqlDataReader reader = myCom.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            System.Diagnostics.Debug.WriteLine(reader.ToString());
                            Guid userId = reader.GetGuid(0);
                            return userId.ToString();   
                        }
                    }
                    reader.Close();
                }
            }
            return null;
        }


        /// <summary>
        /// Inserts a new package into the database corresponding to the current user. 
        /// </summary>
        /// <returns>Returns a boolean describing whether or not the insertion was a success.</returns>
        bool InsertNewPackage(string expectedArrivalDate, string trackingNumber, int ShippingCompanyId)
        {
            String myConStr = ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "INSERT INTO Packages (OwnerId, TrackingNumber, ShippingCompanyId, ExpectedArrivalDate) VALUES (@ownerId, @trackingNumber, @shippingCompanyId, @expectedArrivalDate)";

            using (SqlConnection myCon = new SqlConnection(myConStr))
            {
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {

                    myCom.Parameters.AddWithValue("@ownerId", LookupUserId(Session["UserName"] as string));
                    myCom.Parameters.AddWithValue("@trackingNumber", txtTrackingNumber.Text);
                    myCom.Parameters.AddWithValue("@shippingCompanyId", ddlShippingCompany.SelectedValue);
                    myCom.Parameters.AddWithValue("@expectedArrivalDate", txtExpectedDate.Text);

                    myCon.Open();
                    if (myCom.ExecuteNonQuery() == 1)
                    {
                        return true;
                    }
                    myCon.Close();

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
                    int TIMEOUT_MILISECONDS = 5000;

                    lblOutput.Text = "Sucessfully added package!";
                    txtExpectedDate.Text = "";
                    txtTrackingNumber.Text = "";
                    ddlShippingCompany.SelectedIndex = 0;
                    System.Threading.Thread.Sleep(TIMEOUT_MILISECONDS);
                    lblOutput.Text = "";
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