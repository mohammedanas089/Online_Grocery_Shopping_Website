using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Configuration;
using System.Collections.Specialized;
public partial class products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        if(Request.QueryString["order"] != null)
        {
            
            Response.Write("<script> alert('Your order has been successfully placed.'); </script>");
          
            
        }
        if (!Page.IsPostBack)
        {
            Session["addproduct"] = "false";
            Label8.Text = Request.QueryString["cat"];
            if (Request.QueryString["cat"] != null)
            {
                string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon);
                SqlDataAdapter sda = new SqlDataAdapter("select * from prodadd where(pcat like '%" + Label8.Text + "%')", con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                DataList1.DataSourceID = null;
                DataList1.DataSource = dt;
                DataList1.DataBind();
                ImageButton3.Visible = true;
                if (DataList1.Items.Count == 0)
                {
                    Response.Write("<script> alert('Selected Category is currently empty '); </script>");
                    
                    PropertyInfo isreadonly = typeof(System.Collections.Specialized.NameValueCollection).GetProperty("IsReadOnly", BindingFlags.Instance | BindingFlags.NonPublic);

                    isreadonly.SetValue(this.Request.QueryString, false, null);

                    this.Request.QueryString.Clear();
                }
            }
            else
            {
                Label8.Text = "ALL";
                ImageButton3.Visible = false;
            }
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        //changes images per tick 
        Random ran = new Random();
        int i = ran.Next(1, 11);
        Image2.ImageUrl = "~/images/slides/" + i.ToString() + ".jpg";
    }
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        
            Session["addproduct"] = "true";
            if (e.CommandName == "addtocart")
            {
                //add to cart  button block

                Label linc = (Label)(e.Item.FindControl("Label16"));
                TextBox txt=(TextBox)(e.Item.FindControl("TextBox3"));
                Label lbl = (Label)(e.Item.FindControl("Label1"));
                if(Convert.ToInt32(txt.Text)>Convert.ToInt32(lbl.Text)){//checks if ordered quantity does not exceed stock
                    txt.Text = lbl.Text;
                }
                //carry quantity and product id to cart page to list
                Response.Redirect("cart.aspx?id=" + e.CommandArgument.ToString() + "&qty=" + txt.Text);
            }
            
            if (e.CommandName == "inc")
            {
                //increase quantity button block
                Label lbl = (Label)(e.Item.FindControl("Label16"));
                TextBox txt = (TextBox)(e.Item.FindControl("TextBox3"));
                if (Convert.ToInt32(e.CommandArgument.ToString()) < Convert.ToInt32(txt.Text)+1)
                {
                    //does this block if the required quantity is more than stock 
                    txt.Text = e.CommandArgument.ToString();
                }
                else
                {
                    //does this block to increemnt the quantity within the stock limit
                    int i = 1 + Convert.ToInt32(txt.Text);
                    txt.Text = Convert.ToString(i);
                }
                }
            if (e.CommandName == "dec")
            {
                //decrease quantity button block
                Label lbl = (Label)(e.Item.FindControl("Label16"));
                TextBox txt=(TextBox)(e.Item.FindControl("TextBox3"));
               if (Convert.ToInt32(txt.Text) > 1)
                {
                    //does this block to decreemnt the quantity until 1
                    int i = Convert.ToInt32(txt.Text) - 1;
                    txt.Text = Convert.ToString(i);
                }
               else
                {
                    //does this block to make the lowest quantity as one
                    txt.Text = "1";
                }
                
            }
    
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        // search block
        string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//create connectionstring
        SqlConnection con = new SqlConnection(strcon);//make connnection
        //search for products in searchbox
        SqlDataAdapter sda = new SqlDataAdapter("select * from prodadd where(pname like '%" + TextBox2.Text + "%' ) or (pcat like '%" + TextBox2.Text + "%' )", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        DataList1.DataSourceID = null;
        DataList1.DataSource = dt;
        DataList1.DataBind();
        if (DataList1.Items.Count == 0)// check if search item is present 
        {
            //message if the item is not present
            Response.Write("<script> alert('No products'); </script>");
        }
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        //refresh the page
        Response.Redirect("products.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        //category image block to redirect to respective category search
        Response.Redirect("Products.aspx?cat=FRUITS");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        //category image block to redirect to respective category search
        Response.Redirect("Products.aspx?cat=VEGETABLES");
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        //category image block to redirect to respective category search
        Response.Redirect("Products.aspx?cat=BEVERAGES");
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        //category image block to redirect to respective category search
        Response.Redirect("Products.aspx?cat=DIARY");
    }
    protected void ImageButton8_Click(object sender, ImageClickEventArgs e)
    {
        //category image block to redirect to respective category search
        Response.Redirect("Products.aspx?cat=SPICES");
    }
    protected void ImageButton9_Click(object sender, ImageClickEventArgs e)
    {
        //category image block to redirect to respective category search
        Response.Redirect("Products.aspx?cat=DRY FOODS");
    }
    
}