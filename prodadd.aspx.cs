using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class prodadd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Label1.BackColor = System.Drawing.Color.White;
       // Label1.ForeColor = System.Drawing.Color.Green;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //add button 
        string query = "select count(*) from prodadd where replace(pname,' ','')='" + TextBox1.Text.Trim() + "'";//query to check if product is already present
        string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//create connection string
        SqlConnection con = new SqlConnection(strcon);//makes connection to sql
        SqlCommand cmd1 = new SqlCommand(query, con);//command to do query
        cmd1.Parameters.AddWithValue("@pname", TextBox1.Text.Trim());
        con.Open();//opens connection to sql
        int count = Convert.ToInt32(cmd1.ExecuteScalar());//count number of given product in sql
        if (count > 0)//checks if product exists
        {
            //product exists block
            Response.Write("<script> alert('Product Already exists!'); </script>");
        }
        else
        {
            //product does not exist block
            string strcon1 = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//create connection string
            SqlConnection con1 = new SqlConnection(strcon1);//makes connection to sql
            if (FileUpload1.HasFile)//checks if image is choosen
            {
                string filename = FileUpload1.PostedFile.FileName;//saves filename
                string filepath = "images/" + FileUpload1.FileName;//saves filepath
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + filename);//maps filepath
                con1.Open();//opens connection to sql
                SqlCommand cmd = new SqlCommand("insert into prodadd values('" + TextBox1.Text + "','" + filepath + "','" + DropDownList1.SelectedItem.Value + "','" + TextBox2.Text + "','" + DropDownList2.SelectedItem.Value + "','" + TextBox3.Text + "')", con1);//inserts data into sql
                cmd.ExecuteNonQuery();//completes the command
                con1.Close();//connection is closed
                Response.Write("<script> alert('Product addedd Successfully'); </script>");
            }
        }
       

        
        //con.Open();
        //SqlCommand cmd = new SqlCommand("insert into prodadd" + "(pname,pcat,pqtty1,pqtty2,pprice) values(@pname,@pcat,@pqtty1,@pqtty2,@pprice)", con);
        //cmd.Parameters.AddWithValue("@pname", TextBox1.Text);
        //cmd.Parameters.AddWithValue("@pcat", DropDownList1.SelectedItem.Value);
       // cmd.Parameters.AddWithValue("@pqtty1", TextBox2.Text);
       // cmd.Parameters.AddWithValue("@pqtty2", DropDownList2.SelectedItem.Value);
       // cmd.Parameters.AddWithValue("@pprice", TextBox3.Text);
       // cmd.ExecuteNonQuery();
       // Label1.Text = "Added Succesfully";
    }
}