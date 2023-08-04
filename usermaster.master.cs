using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class usermaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)//checks if user is logged in
        {
            //logged in block
            Button1.Visible = true;//shows logout button
            Label1.Text = "User:" + Session["username"].ToString();//display username
            if(Session["buyitems"] !=null)//checks items present in cart
              Label15.Text = Session["cartn"].ToString();//item count is displayed
        }
        else
        {
            //not logged in block
            Label1.Text = "User:Guest";//username is guest
            Button1.Visible = false;//logout button not visible
        }
    }
    protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
    {
        //cart button block
        Response.Redirect("cart.aspx");//redirect to cart page
    }

    protected void Button1_Click(object sender, ImageClickEventArgs e)
    {
        //logout button block
        Session.Abandon();//session cleared
        Response.Redirect("signui.aspx");//redirect to login page
    }
}
