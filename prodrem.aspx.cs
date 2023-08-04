using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class prodrem : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //search button
       
        string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//create connection string
        SqlConnection con = new SqlConnection(strcon);//makes connection to sql
        //selects product as given in searchbox and displays only them
        SqlDataAdapter sda = new SqlDataAdapter("select * from prodadd where(pname like '%" + TextBox1.Text + "%' ) or (pcat like '%" + TextBox1.Text + "%' )", con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        GridView1.DataSourceID = null;
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}