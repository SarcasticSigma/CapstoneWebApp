using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace CapstoneWebPage.auth.student



{
    public partial class new_package : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "SQUIRE - Add Package";
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

        /// <summary>
        /// Checks the SQL database to see if the entered tracking number is unique to the shipping company selected. 
        /// </summary>
        /// <param name="trackingNumber">A string representing a tracking number.</param>
        /// <returns>A bool represeting whether or not it's unique.</returns>
        /// <exception cref="ArgumentException">Thrown if the drop down list doesn't have a selected value.</exception>
        private bool _IsUniqueTrackingNumber(string trackingNumber)
        {
            if (ddlShippingCompany.SelectedValue == "none")
            {
                throw new ArgumentException("Required drop down list not included.");
            }
            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "SELECT TrackingNumber, CompanyName FROM Packages INNER JOIN ShippingCompanies ON Packages.ShippingCompanyId = ShippingCompanies.CompanyId";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                myCon.Open();
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {

                    using (SqlDataReader reader = myCom.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            string storedTrackingNumber = reader.GetString(0);
                            string storedShippingCompanyName = reader.GetString(1);

                            if (storedTrackingNumber == txtTrackingNumber.Text && storedShippingCompanyName == ddlShippingCompany.SelectedItem.Text)
                            {
                                return false;
                            }
                        }
                        return true;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (InsertNewPackage(txtExpectedDate.Text, txtTrackingNumber.Text, System.Convert.ToInt16(ddlShippingCompany.SelectedItem.Value)))
                {
                    LabelOutput.Text = "Sucessfully added package! You'll recieve an email containing information required to retrieve your package when it arrives.";
                    txtTrackingNumber.Text = "";
                    txtExpectedDate.Text = "";
                    ddlShippingCompany.SelectedValue = "none";
                }
                else
                {
                    LabelOutput.Text = "Error inserting package! Please try again!";
                }
            }
        }




        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = false;
            if (args.Value == "")
            {
                args.IsValid = false;
                LabelOutput.Text = "Error! Please enter a date!";
            }
            Regex rg = new Regex("[0-9][0-9](/|-|\\ )[0-9][0-9](/|-|\\ )[0-9][0-9][0-9][0-9]");
            if (rg.IsMatch(args.Value))
            {
                string targetDateString = "";
                char[] targetDate = args.Value.ToCharArray();
                targetDate[2] = '/';
                targetDate[5] = '/';
                foreach (char c in targetDate)
                {
                    targetDateString += c;
                }
                System.Diagnostics.Debug.WriteLine($"targetDateString:{targetDateString} TryParse:{DateTime.TryParse(targetDateString, out _)}");
                if (DateTime.TryParse(targetDateString, out _))
                {
                    DateTime targetDateTime = DateTime.Parse(targetDateString);
                    if (DateTime.Compare(targetDateTime, DateTime.Now) > 0)
                    {
                        args.IsValid = true;
                    }
                    else
                    {
                        args.IsValid = false;
                        LabelOutput.Text = "Error! That date is in the past!";
                    }
                }
                else
                {
                    LabelOutput.Text = "Error! That's not a valid date!";
                }
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void TrackingNumberValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (ddlShippingCompany.SelectedValue == "none")
            {
                args.IsValid = false;
                return;
            }
            if (args.Value == "" || args.Value == null)
            {
                args.IsValid = false;
            }

            if (_IsUniqueTrackingNumber(args.Value.Trim()))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
                LabelOutput.Text = "That tracking number has already been associated with a SQUIRE package!";
            }



        }
    }
}