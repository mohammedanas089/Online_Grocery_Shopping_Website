using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Configuration;

//panel2.LOGIN
//panel1.SIGNUP
//panel4.ERROR
//btn2.login
//btn3.signup
public partial class signui : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if(Request.QueryString["check"]== "no"){
        Response.Write("<script> alert('Not signed in yet'); </script>");
        }
        //initally show only login panel
        Panel2.Visible = true;
        Panel1.Visible = false;
        Panel4.Visible = false;
        TextBox1.BorderColor = System.Drawing.ColorTranslator.FromHtml("#808080");
        TextBox2.BorderColor = System.Drawing.ColorTranslator.FromHtml("#808080");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //login button to show login panel
        Panel2.Visible = true;
        Panel1.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //signup button to show signup panel
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //login button
        string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;  
        SqlConnection con = new SqlConnection(strcon);
        SqlDataAdapter sda = new SqlDataAdapter("select * from logup where email='"+TextBox1.Text+"' and password='"+TextBox2.Text+"'",con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (TextBox1.Text == "admin" & TextBox2.Text == "admin")
        {
            Session["username"] = "admin";
            Response.Redirect("adminpage.aspx");
        }
        if (dt.Rows.Count == 1)
        {
            Session["username"] = TextBox1.Text;
            Session.Timeout = 160;
            Response.Redirect("cart.aspx?cartclear=y");
            
        }
        else
        {
           Panel4.Visible = true;
            
            TextBox1.BorderColor = Color.Red;
            TextBox2.BorderColor = Color.Red;
            
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        //signup button
        string query = "select count(*) from logup where replace(email,' ','')='" + TextBox4.Text.Trim() + "'";//query to get given email count
        string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//create connectionstring
        SqlConnection con = new SqlConnection(strcon);//make connection
        SqlCommand cmd1 = new SqlCommand(query, con);//command for query 
        cmd1.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
        con.Open();//open connection
        int count = Convert.ToInt32(cmd1.ExecuteScalar());//get count of email
        if (count > 0)
        {
            //if email already exists
            Response.Write("<script>alert('E-mail ID already exists.');</script>");
        }
        else
        {
            //if the emails is unique,insert data into sql
            SqlCommand cmd2 = new SqlCommand("insert into logup" + "(name,age,gender,mobile,email,address,password) values(@name,@age,@gender,@mobile,@email,@address,@password)", con);
            cmd2.Parameters.AddWithValue("@name", TextBox8.Text);
            cmd2.Parameters.AddWithValue("@age", TextBox9.Text);
            cmd2.Parameters.AddWithValue("@gender", DropDownList1.SelectedItem.Value);
            cmd2.Parameters.AddWithValue("@mobile", TextBox3.Text);
            cmd2.Parameters.AddWithValue("@email", TextBox4.Text);
            cmd2.Parameters.AddWithValue("@address", TextBox7.Text);
            cmd2.Parameters.AddWithValue("@password", TextBox5.Text);
            cmd2.ExecuteNonQuery();
            Response.Redirect("signui.aspx");
        }
    
    }
    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {
       
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}