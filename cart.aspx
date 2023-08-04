<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true"
    CodeFile="cart.aspx.cs" Inherits="cart" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div class="style3">
    &nbsp;
    <div style="text-align: left"><asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/products.aspx" BorderStyle="Groove" 
            style="text-align: left">Click here to Continue shopping...</asp:HyperLink></div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No Product added to cart"
        ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" BorderColor="Gray" 
        BorderStyle="Groove" style="text-align: center;border-radius:15px;" 
        Width="704px" BackColor="#CCCCCC" CellPadding="4" CellSpacing="2" 
        ForeColor="Black" >
        <Columns>
            <asp:BoundField DataField="slno" HeaderText="SLNO" />
            
            <asp:BoundField DataField="pname" HeaderText="PRODUCT NAME" />
            <asp:BoundField DataField="pqty" HeaderText="QUANITITY" />
            <asp:BoundField DataField="pprice" HeaderText="PRICE(PER QTY)" />
            <asp:BoundField DataField="tprice" HeaderText="TOTAL PRICE" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" BorderColor="Gray" BorderStyle="Groove" 
            ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />
    <asp:Button ID="Button3" runat="server" Text="Place Order" 
        OnClick="Button3_Click" />
</div>
</asp:Content>
