using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CapstoneWebPage.admin
{
    public partial class AdminAssignRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

    

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
         
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow row = GridView1.Rows[index];

            string myStr = Server.HtmlDecode(row.Cells[0].Text);



                Roles.AddUserToRole(myStr, "Admin");
                Label1.Text = $"Account {myStr} is now an Admin account!";
                GridView1.DataBind();

        }
    }
}