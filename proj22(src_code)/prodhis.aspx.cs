using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class prodhis : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)//checks if user is logged in
        {
        	//redirect to signin  page if no user is found
            Response.Redirect("signui.aspx?check=no");
            
           
        }
        
    }
}