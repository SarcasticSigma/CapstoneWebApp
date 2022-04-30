using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CapstoneWebPage.auth.staff
{
    public partial class packages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)

        {
            Page.Validate("PackageArrival");
            if (Page.IsValid)
            {
                int index = Convert.ToInt32(e.CommandArgument);

                GridViewRow row = GridView1.Rows[index];

                string packageId = Server.HtmlDecode(row.Cells[0].Text);

                _toggleArrivedStatus(packageId);
                int lockerNumber;
                if (int.TryParse(txtLockerNumber.Text.Trim(), out lockerNumber))
                {
                    _insertLockerNum(lockerNumber, packageId);
                }
                else
                {
                    throw new ArgumentException("Error with locker number.");
                }


                GridView1.DataBind();
            }
        }

        private void _insertLockerNum(int lockerNumber, string packageId)
        {
            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "UPDATE Packages SET LockerNumber=@lockerNumber WHERE PackageId = @packageId";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                myCon.Open();
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@lockerNumber", lockerNumber);
                    myCom.Parameters.AddWithValue("@packageId", packageId);
                    myCom.ExecuteNonQuery();
                }
            }
        }


        private void _toggleArrivedStatus(string targetPackage)
        {
            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "UPDATE Packages SET HasArrived='Yes' WHERE PackageId = @PackageId";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                myCon.Open();
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@PackageId", targetPackage);
                    myCom.ExecuteNonQuery();
                }
            }
        }

        /// <summary>
        /// Checks if the provided locker number is unique.
        /// </summary>
        /// <param name="lockerNumber"></param>
        /// <returns></returns>
        private bool _uniqueLockerNumber(int lockerNumber)
        {
            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "SELECT PackageId FROM Packages WHERE lockerNumber = @lockerNumber";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                myCon.Open();
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@lockerNumber", lockerNumber);
                    if (myCom.ExecuteNonQuery() >= 1)
                    {
                        return false;
                    }
                    else
                    {
                        return true;

                    }
                }

            }
        }

        /// <summary>
        /// Checks if there's a package in the current locker.
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (string.IsNullOrEmpty(args.Value))
            {
                args.IsValid = false; return;
            }
            if (_uniqueLockerNumber(int.Parse(args.Value)))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}