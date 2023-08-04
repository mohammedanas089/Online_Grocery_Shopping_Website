<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.master" AutoEventWireup="true"
    CodeFile="prodrem.aspx.cs" Inherits="prodrem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <div style="text-align: right">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Search" />
                </div>
            </td>
        </tr>
        <tr>
            <td >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    AllowSorting="True" 
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="pid"
                    CellPadding="4" ForeColor="#333333" GridLines="None" BorderColor="White" 
                    BorderStyle="Ridge" BorderWidth="5px" AllowPaging="True" PageSize="5">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="pname" HeaderText="PRODUCT" SortExpression="pname">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:ImageField DataImageUrlField="pimage" HeaderText="IMAGE">
                            <ControlStyle Height="50px" />
                            <HeaderStyle Font-Underline="True" />
                        </asp:ImageField>
                        <asp:BoundField DataField="pcat" HeaderText="CATEGORY" SortExpression="pcat" >
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pqtty1" HeaderText="QUANITITY" SortExpression="pqtty1" >
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pprice" HeaderText="PRICE" SortExpression="pprice" >
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" ShowDeleteButton="True" 
                            ShowEditButton="True" CancelImageUrl="~/images/cancel-b.png" CancelText="" 
                            DeleteImageUrl="~/images/delete-b.png" DeleteText="" 
                            EditImageUrl="~/images/edit-b.png" EditText="" 
                            UpdateImageUrl="~/images/update-b.png" UpdateText="" >
                        <ControlStyle Height="20px" Width="20px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="pid" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                            SortExpression="pid" Visible="False" />
                        <asp:BoundField DataField="pqtty2" HeaderText="SCALE" SortExpression="pqtty2" Visible="False" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" ForeColor="White" BorderStyle="None" Font-Size="X-Large"
                        Font-Bold="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                
            </td>
        </tr>
        <tr>
        <td>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>"
                    SelectCommand="SELECT * FROM [prodadd]" DeleteCommand="DELETE From [prodadd] WHERE [pid] = @pid "
                    UpdateCommand="update [prodadd] set [pprice]=@pprice, [pqtty1]=[pqtty1]+@pqtty1 where [pid]=@pid ">
                </asp:SqlDataSource>
        </td></tr>
    </table>
</asp:Content>
