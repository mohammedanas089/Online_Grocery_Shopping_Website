<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.master" AutoEventWireup="true"
    CodeFile="adcom.aspx.cs" Inherits="adcom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" 
                    ForeColor="#333333" GridLines="None" Width="100%" DataKeyNames="com">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="com" HeaderText="COMMENT" SortExpression="com" >
                        <ControlStyle Width="75%" />
                        <ItemStyle Width="75%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="ID" SortExpression="name" />
                        <asp:BoundField DataField="time" HeaderText="DATE/TIME" SortExpression="time" />
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>"
                    SelectCommand="SELECT * FROM [comment] ORDER BY [time]" DeleteCommand="DELETE From [comment] WHERE [com] = @com "></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
