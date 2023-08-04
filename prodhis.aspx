<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true"
    CodeFile="prodhis.aspx.cs" Inherits="prodhis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
       
        .GridView1 th
        {
            -moz-border-radius: 15px;
            border-radius: 20px;
        }
        .GridView1 td
        {
            -moz-border-radius: 15px;
            border-radius: 20px;
            background-color: White;
        }
        .headl
        {
            border-radius: 10px 0px 0px 0px;
        }
        .headr
        {
            border-radius: 0px 10px 0px 0px;
        }
        .style14
        {
            font-family: cursive;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <span style=" background-color:White;border-radius:10px;padding-left:15px;" class="style10"><strong>ORDER IN-PROCESS:</strong></span>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" ForeColor="Black" GridLines="None" 
            HorizontalAlign="Center" Width="900px"
            Style="border-radius: 10px" DataKeyNames="oid,pid,qty" BackColor="White" 
            CssClass="style14" AllowPaging="True" PageSize="5">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="oid" HeaderText="ID" SortExpression="oid">
                    <HeaderStyle CssClass="headl" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="pid" HeaderText="PID" SortExpression="pid" Visible="False">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="pname" HeaderText="PRODUCT" SortExpression="pname">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="PRICE" SortExpression="price">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="qty" HeaderText="QTY" SortExpression="qty">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="odate" HeaderText="ORDER-DATE" SortExpression="odate">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Image" DeleteImageUrl="~/images/cancel-b.png" DeleteText="Cancel Order"
                    HeaderText="CANCEL" ShowDeleteButton="True">
                    <HeaderStyle CssClass="headr" />
                    <ControlStyle Height="20px" Width="20px" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="Numeric" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>"
            SelectCommand="SELECT * FROM [order] WHERE ([cid] = @cid) " DeleteCommand="UPDATE [prodadd] set [pqtty1]=[pqtty1]+@qty where [pid]=@pid ; DELETE From [order] WHERE [oid] = @oid ">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <div>
    <span style=" background-color:White;border-radius:10px;padding-left:15px;" class="style10"><strong>DELIVERED ORDERS:</strong></span>
        
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
            CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="None"
            HorizontalAlign="Center" Width="800px" style="border-radius:10px" 
            CssClass="style14" AllowPaging="True" PageSize="5">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="oid" HeaderText="ID" SortExpression="oid">
                <HeaderStyle CssClass="headl" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="pname" HeaderText="PRODUCT" SortExpression="pname">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="PRICE" SortExpression="price">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
                <asp:BoundField DataField="odate" HeaderText="ORDER-DATE" SortExpression="odate">
                    <HeaderStyle CssClass="headr" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />      
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>"
            SelectCommand="SELECT * FROM [dlvryhis]  WHERE ([cid] = @cid)">
            <SelectParameters>
                <asp:SessionParameter Name="cid" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
