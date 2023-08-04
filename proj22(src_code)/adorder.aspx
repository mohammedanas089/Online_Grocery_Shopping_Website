<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.master" AutoEventWireup="true"
    CodeFile="adorder.aspx.cs" Inherits="adorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        AllowSorting="True" DataKeyNames="oid" BorderColor="White" BorderStyle="Ridge"
        BorderWidth="5px" ForeColor="#333333" Width="1040px" Style="margin-right: 0px"
        HorizontalAlign="Right" CellPadding="4" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="oid" HeaderText="ID" SortExpression="oid" />
            <asp:BoundField DataField="pid" HeaderText="PRODUCT ID" SortExpression="pid" Visible="False" />
            <asp:BoundField DataField="slno" HeaderText="SLNO" SortExpression="slno" Visible="false"  />
            <asp:BoundField DataField="pname" HeaderText="PRODUCT" SortExpression="pname" />
            <asp:BoundField DataField="price" HeaderText="PRICE" SortExpression="price" />
            <asp:BoundField DataField="qty" HeaderText="QTY" SortExpression="qty" />
            <asp:BoundField DataField="odate" HeaderText="DATE" SortExpression="odate" />
            <asp:BoundField DataField="cid" HeaderText="CUSTOMER" SortExpression="cid" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"
                EditText="Delivered" UpdateText="Confirm" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" BorderStyle="None" ForeColor="White" Font-Size="X-Large"
            Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString3 %>"
        SelectCommand="SELECT * FROM [order]" DeleteCommand="DELETE From [order] WHERE [oid] = @oid "
        UpdateCommand="insert into [dlvryhis] (oid,cid,pname,price,odate) values(@oid,@cid,@pname,@price,@odate) ;DELETE From [order] WHERE [oid] = @oid ">
    </asp:SqlDataSource>
</asp:Content>
