<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true"
    CodeFile="feed.aspx.cs" Inherits="feed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style>
.cmtc
{
    
}
.cmth
{
    
    }
.cmt
{
    
    border-radius:10px;
    background-color:White;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                    
                        <table class="cmtc">
                            <tr >
                                <td class="cmth" rowspan="2">
                                    <asp:Label ID="nameLabel" runat="server" Font-Overline="False" 
                                        Text='<%# Eval("name") %>' style="color: #006600" />
                                    <br />
                                    <asp:Label ID="timeLabel" runat="server" Font-Overline="False" 
                                        style="text-align: right; color: #666666;" Text='<%# Eval("time") %>' />
                                </td>
                                <td >
                                <br />
                                <br />
                                    &nbsp;</td>
                            </tr >
                            <tr>
                                <td class="cmt">
                                    <asp:Label ID="comLabel" runat="server" Text='<%# Eval("com") %>' />
                                </td>
                            </tr>
                        </table>
                        <br />
                        
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>" 
                    SelectCommand="SELECT * FROM [comment]"></asp:SqlDataSource>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <div>
                    Comment:<br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="87px" TextMode="MultiLine" 
                        Width="271px"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="Send" onclick="Button2_Click" />
                </div>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
