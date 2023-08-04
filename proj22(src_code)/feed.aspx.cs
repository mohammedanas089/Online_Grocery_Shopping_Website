using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class feed : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["username"] == null)//checks if logged in
        {
            //not logged in block
            Response.Write("<script> alert('Please Login First'); </script>");
        }
        else {
            //logged in block
            if (TextBox1.Text.Length == 0)//checks if comment is empty
            {
                //empty comment block
                Response.Write("<script> alert('Comment is Empty'); </script>");
            }
            else
            {
                //comment not empty block
                string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//creates connectionstring
                SqlConnection con = new SqlConnection(strcon);//makes connection to sql
                con.Open();//opens connection to sql
                SqlCommand cmd = new SqlCommand("insert into comment" + "(name,com,time)values(@name,@com,@time)", con);//command to insert comment

                cmd.Parameters.AddWithValue("@name", Session["username"]);
                cmd.Parameters.AddWithValue("@com", TextBox1.Text);
                cmd.Parameters.AddWithValue("@time", DateTime.Now);
                cmd.ExecuteNonQuery();//completes the commands
                Response.Redirect(Request.Url.AbsoluteUri);//page refresh
            }
        }
    }
}