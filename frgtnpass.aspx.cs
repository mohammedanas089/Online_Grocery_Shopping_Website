using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class frgtnpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
      //change password button
        string query = "select count(*) from logup where replace(email,' ','')='" + TextBox1.Text.Trim() + "'";//query string to check if command is present
        string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//creates connectionstring
        SqlConnection con = new SqlConnection(strcon);//makes connection to sql
        SqlCommand cmd1 = new SqlCommand(query, con);//command to execute query 
        cmd1.Parameters.AddWithValue("@email", TextBox1.Text.Trim());
        con.Open();//opens connection to sql
        int count = Convert.ToInt32(cmd1.ExecuteScalar());//count number of given email 
        if (count > 0)//checks if email is present
        {
            //email present block
            SqlCommand cmd2 = new SqlCommand("update logup set password=@password where email=@email", con);//command to update password
            cmd2.Parameters.AddWithValue("@email", TextBox1.Text.Trim());
            cmd2.Parameters.AddWithValue("@password", TextBox2.Text);
            cmd2.ExecuteNonQuery();//executes the command
            Response.Redirect("sigui.aspx");
        }
        else
        {
            //email not present block
            Response.Write("<script> alert('Invalid email'); </script>");
        }
    
    }
}