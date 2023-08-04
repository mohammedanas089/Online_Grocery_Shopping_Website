<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.master" AutoEventWireup="true"
    CodeFile="usrrem.aspx.cs" Inherits="usrrem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                    DataKeyNames="email" BorderColor="White" BorderStyle="Ridge" BorderWidth="5px"
                    Width="891px" AllowSorting="True" HorizontalAlign="Right" CellPadding="4" ForeColor="#333333"
                    GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="NAME" SortExpression="name">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gender" HeaderText="GENDER" SortExpression="gender">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mobile" HeaderText="MOBILE" SortExpression="mobile">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="E-MAIL" SortExpression="email">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="address" HeaderText="ADDRESS" SortExpression="address">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="password" HeaderText="PASSWORD" SortExpression="password">
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Image" ShowDeleteButton="True" DeleteImageUrl="~/images/delete-b.png"
                            DeleteText="">
                            <ControlStyle Height="20px" Width="20px" />
                        </asp:CommandField>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>"
                    SelectCommand="SELECT * FROM [logup]" DeleteCommand="DELETE From [logup] WHERE [email] = @email">
                    <DeleteParameters>
                        <asp:Parameter Name="pid" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
