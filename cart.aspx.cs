using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class cart : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString["cartclear"] != null)
        {
            Session["buyitems"] = null;
            Response.Redirect("products.aspx");
            
            
            
        } 
        if (!IsPostBack){
            if (Session["buyitems"] == null){
                Button3.Enabled = false;
            }
            else{
                Button3.Enabled = true;
            }
            Session["addproduct"] = "false";
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("slno");
            dt.Columns.Add("pid");
            dt.Columns.Add("pname");
            dt.Columns.Add("pqty");
            dt.Columns.Add("pprice");
            dt.Columns.Add("tprice");
            if (Request.QueryString["id"] != null)
            {


                if (Session["buyitems"] == null)
                {
                    dr = dt.NewRow();
                    string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;
                    SqlConnection conn = new SqlConnection(strcon);
                    SqlDataAdapter da = new SqlDataAdapter("select * from prodadd where pid=" + Request.QueryString["id"], conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    dr["slno"] = 1;
                    dr["pid"] = ds.Tables[0].Rows[0]["pid"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[0]["pprice"].ToString();
                    dr["pqty"] = Request.QueryString["qty"];
                    //int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["pprice"].ToString());
                    decimal quantity = Convert.ToDecimal(Request.QueryString["qty"].ToString());
                    decimal totalprice = price * quantity;
                    dr["tprice"] = totalprice;
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    Button3.Enabled = true;
                    GridView1.FooterRow.Cells[4].Text = "total amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("cart.aspx");
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    int sr;
                    sr = dt.Rows.Count;
                    dr = dt.NewRow();
                    string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;
                    SqlConnection scon = new SqlConnection(strcon);
                    SqlDataAdapter da = new SqlDataAdapter("select * from prodadd where pid=" + Request.QueryString["id"], scon);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    dr["slno"] = sr + 1;
                    dr["pid"] = ds.Tables[0].Rows[0]["pid"].ToString();
                    dr["pname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                    dr["pprice"] = ds.Tables[0].Rows[0]["pprice"].ToString();
                    dr["pqty"] = Request.QueryString["qty"];
                    decimal price = Convert.ToDecimal(ds.Tables[0].Rows[0]["pprice"].ToString());
                    decimal quantity = Convert.ToDecimal(Request.QueryString["qty"].ToString());
                    decimal totalprice = price * quantity;
                    dr["tprice"] = totalprice;
                    dt.Rows.Add(dr);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    Session["buyitems"] = dt;
                    Button3.Enabled = true;
                    GridView1.FooterRow.Cells[4].Text = "total amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                    Response.Redirect("cart.aspx");
                }
            }
            else
            {
                dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    GridView1.FooterRow.Cells[4].Text = "Total amount";
                    GridView1.FooterRow.Cells[5].Text = grandtotal().ToString();
                   
                }
                if (Session["buyitems"] != null)
                {
                    if (Session["username"] != null)
                        Session["cartn"] = "(" + (GridView1.DataSource as DataTable).Rows.Count + ")";
                }
                }
        }
        string orderdate = DateTime.Now.ToShortDateString();
        Session["orderdate"] = orderdate;
        orderid();

        
    }
    public void orderid()
    {
        String alpha = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random r = new Random();
        char[] myarray = new char[5];
        for (int i = 0; i < 5; i++)
        {
            myarray[i] = alpha[(int)(35 * r.NextDouble())];
        }
        String orderid;
        orderid = "Order_Id:" + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myarray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
        Session["orderid"] = orderid;
    }
    public decimal grandtotal()
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        int nrow = dt.Rows.Count;
        int i = 0;
        decimal totalprice = 0;
        while (i < nrow)
        {
            totalprice = totalprice + Convert.ToDecimal(dt.Rows[i]["tprice"].ToString());
            i = i + 1;
        }
        return totalprice;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["buyitems"];
        for (int i = 0; i <= dt.Rows.Count - 1; i++)
        {
            int sr;
            int sr1;
            string qdata;
            string dtdata;
            sr = Convert.ToInt32(dt.Rows[i]["slno"].ToString());
            TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
            qdata = cell.Text;
            dtdata = sr.ToString();
            sr1 = Convert.ToInt32(qdata);
            if (sr == sr1)
            {
                dt.Rows[i].Delete();
                dt.AcceptChanges();
                break;
            }
        }
        for (int i = 1; i <= dt.Rows.Count; i++)
        {
            dt.Rows[i - 1]["slno"] = i;
            dt.AcceptChanges();
            

        }
        
        Session["buyitems"] = dt;
        Response.Redirect("cart.aspx");
    }
    /*protected void Button2_Click(object sender, EventArgs e)
    {
        DataTable dt;
        dt = (DataTable)Session["buyitems"];
        int i;
        for (i = 0; i <= dt.Rows.Count - 1; i++)
        {
            SqlConnection scon = new SqlConnection("Data Source=LAPTOP-BJQ4MMQG; Initial Catalog=mdas; Integrated Security=True;");
            scon.Open();
            SqlCommand cmd = new SqlCommand("insert into [order] ( oid,slno,pid,pname,price,qty,odate,cid) values('" + Session["orderid"] + "','" + dt.Rows[i]["slno"] + "','" + dt.Rows[i]["pid"] + "','" + dt.Rows[i]["pname"] + "','" + dt.Rows[i]["tprice"] + "','" + dt.Rows[i]["pqty"] + "','" + Session["orderdate"] + "','" + Session["username"] + "')", scon);
            cmd.ExecuteNonQuery();
            scon.Close();
        }
        if (Session["username"] == null)
        {
            Response.Write("<script> alert('sign in re'); </script>");
            //Response.Redirect("login.aspx");
        }
        else
        {
            if (GridView1.Rows.Count.ToString() == "0")
            {
                Response.Write("<script> alert('your cart is empty.you cannot place an order'); </script>");
            }
            else
            {
                SqlConnection scon = new SqlConnection("Data Source=LAPTOP-BJQ4MMQG; Initial Catalog=mdas; Integrated Security=True;");
                scon.Open();
                SqlDataAdapter sda = new SqlDataAdapter("select * from [order] where oid='" + Session["orderid"] + "'", scon);
                DataTable dtt = new DataTable();
                sda.Fill(dtt);
                if (dtt.Rows.Count > 0)
                {
                    DataRow row = dtt.Rows[0];

                    string tot = row["price"].ToString();
                    Session["tot"] = tot;
                    Response.Redirect("payment.aspx?oid=" + Session["orderid"].ToString() + "&tot=" + Session["tot"].ToString());
                }
                else
                    Response.Write("no count");
            }
        }
    }*/
    protected void Button3_Click(object sender, EventArgs e)
    {
        
        if (Session["username"] == null)
        {
            Response.Write("<script> alert('Please sign in to buy items'); </script>");
            //Response.Redirect("login.aspx");
        }
        else
        {
            if (GridView1.Rows.Count.ToString() == "0")
            {
                Response.Write("<script> alert('your cart is empty.you cannot place an order'); </script>");
            }
            else
            {
                DataTable dt;
                dt = (DataTable)Session["buyitems"];
                int i;
                for (i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;
                    SqlConnection scon = new SqlConnection(strcon);
                    scon.Open();
                    SqlCommand cmd = new SqlCommand("insert into [order] ( oid,slno,pid,pname,price,qty,odate,cid) values('" + Session["orderid"] + "','" + dt.Rows[i]["slno"] + "','" + dt.Rows[i]["pid"] + "','" + dt.Rows[i]["pname"] + "','" + dt.Rows[i]["tprice"] + "','" + dt.Rows[i]["pqty"] + "','" + Session["orderdate"] + "','" + Session["username"] + "')", scon);
                    cmd.ExecuteNonQuery();
                    SqlCommand ccmd = new SqlCommand("UPDATE prodadd SET pqtty1 = pqtty1-'" + dt.Rows[i]["pqty"] + "'where pname='" + dt.Rows[i]["pname"] + "'", scon);
                SqlCommand c = new SqlCommand("update prodadd set pqtty1='"+i+"' where pqtty1<'" + i + "'", scon);
            
                
                ccmd.ExecuteNonQuery();
                c.ExecuteNonQuery();
                //con.Close();
                    scon.Close();
                }
               /* i = 0;
                string strcon1 = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;
                SqlConnection con = new SqlConnection(strcon1);
                con.Open();
                SqlCommand ccmd = new SqlCommand("UPDATE prodadd SET pqtty1 = pqtty1-'" + dt.Rows[i]["pqty"] + "'where pname='" + dt.Rows[i]["pname"] + "'", con);
                //int low = 0;
                SqlCommand c = new SqlCommand("update prodadd set pqtty1='"+i+"' where pqtty1<'" + i + "'", con);
            
                
                ccmd.ExecuteNonQuery();
                c.ExecuteNonQuery();
                con.Close();
*/
                
                dt.Clear();
                Session["cartn"] = "(0)";
                //Response.Redirect("products.aspx");
                 Response.Redirect("products.aspx?order=done");
            }
        }
        
    }
}
