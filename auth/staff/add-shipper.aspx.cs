using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace CapstoneWebPage.auth.staff
{
    public partial class add_shipper : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String myConString = System.Configuration.ConfigurationManager.ConnectionStrings["MainSquireDatabase"].ConnectionString;
            String mySQL = "INSERT INTO ShippingCompanies (CompanyName) VALUES (@CompanyName)";
            using (SqlConnection myCon = new SqlConnection(myConString))
            {
                using (SqlCommand myCom = new SqlCommand(mySQL, myCon))
                {
                    myCom.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text);


                    myCon.Open();
                    myCom.ExecuteNonQuery();
                    myCon.Close();
                    Label2.Text = "Successfully Inserted!";
                    txtCompanyName.Text = "";
                    gvCompanies.DataBind();
                    
                }
            }
        }
    }
}