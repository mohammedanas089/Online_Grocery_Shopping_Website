<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true"
    CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style20
        {
            text-align: right;
        }
        .style11
        {
            width: 10px;
        }
        .style12
        {
            width: 192px;
        }
        .style16
        {
            font-size: medium;
            color: #CCCCCC;
            font-family: cursive;
        }
        .style17
        {
            font-family: cursive;
        }
        .style18
        {
            width: 96px;
        }
        .img
        {
            height: 150px;
            width: 225px;
        }
        .img:hover
        {
            height: 200px;
            width: 275px;
        }  
        .cat
        {
            height: 70px;
            width: 70px;
        }
        .cat:hover
        {
           
            
        }
        .content
        {
            background-color:white;
            }
        .content:hover
        {
            background-color: #308CE9;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-image: none; background-repeat: no-repeat;">
        <table class="style1">
            <tr>
                <td width="100%">
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
                            </asp:Timer>
                            <asp:Image ID="Image2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Double"
                                Height="200px" Width="99%" Style="margin-left: 4px; border-radius: 10px" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style20" style="border-style: groove; border-color: #808080; color: black;
                    background-color: #FFFFFF; border-radius: 10px">
                    <table width="100%">
                        <tr>
                            <td style="text-align: left">
                                <span class="style10">Category:</span><asp:Label ID="Label8" runat="server" ForeColor="Black"
                                    CssClass="style10"></asp:Label>
                                <asp:ImageButton ID="ImageButton3" runat="server" Height="22px" ImageUrl="~/images/cancel-c.png"
                                    OnClick="ImageButton3_Click" Width="22px" />
                            </td>
                            <td style="text-align: left; vertical-align: middle;">
                                <asp:ImageButton ID="ImageButton4" Style="border-radius: 40px;" runat="server" ImageUrl="~/images/fruit-cat.png"
                                    OnClick="ImageButton4_Click" title="Fruits" class="cat" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton5" Style="border-radius: 40px;" runat="server" ImageUrl="~/images/veg-cat.jpg"
                                    OnClick="ImageButton5_Click" title="Vegetables" class="cat" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton6" Style="border-radius: 40px;" runat="server" ImageUrl="~/images/bev-cat.jpg"
                                    OnClick="ImageButton6_Click" title="Beverages" class="cat" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton7" Style="border-radius: 40px;" runat="server" ImageUrl="~/images/diary-cat.jpg"
                                    OnClick="ImageButton7_Click" title="Diaries" class="cat" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton8" Style="border-radius: 40px;" runat="server" ImageUrl="~/images/spice-cat.jpg"
                                    title="Spices" OnClick="ImageButton8_Click" class="cat" />
                                &nbsp;
                                <asp:ImageButton ID="ImageButton9" Style="border-radius: 40px;" runat="server" ImageUrl="~/images/dry-cat.jpg"
                                    OnClick="ImageButton9_Click" title="Dry Fruits" class="cat" />
                            </td>
                            <td style="text-align: right; vertical-align: middle;">
                                <asp:TextBox ID="TextBox2" runat="server" placeholder="Search..." Height="25px" Width="147px"
                                    Style="margin-left: 0px"></asp:TextBox>
                                <asp:ImageButton ID="ImageButton2" runat="server" Height="22px" ImageUrl="~/images/search-c.png"
                                    OnClick="ImageButton2_Click" Width="22px" Style="margin-top: 0px" ImageAlign="AbsMiddle" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="prod" Height="200px" RepeatColumns="4"
                        RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand" CellPadding="15">
                        <ItemTemplate>
                            <table style="padding: 8px;  border-radius: 8px;" class="content">
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <asp:Image ID="image1" runat="server" class="img" ImageUrl='<%#Eval("pimage") %>'
                                            Style="text-align: center; border-radius: 13px;" ImageAlign="AbsMiddle" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" style="text-align: left">
                                        <asp:Label ID="pnameLabel" runat="server" Style="font-weight: 700; font-size: large;
                                            text-transform: capitalize; text-align: center;" Text='<%# Eval("pname") %>'
                                            CssClass="style17" />
                                        <br class="style17" />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("pqtty1") %>' CssClass="style16" />&nbsp;<asp:Label
                                            ID="Label2" runat="server" Text='<%# Eval("pqtty2") %>' CssClass="style16" />
                                    </td>
                                    <td style="font-family: cursive; font-weight: 700; color: #99FF33; text-align: right;"
                                        class="style18">
                                        &#8377.<asp:Label ID="ppriceLabel" runat="server" Text='<%# Eval("pprice") %>' Style="color: #99FF66" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style12" style="text-align: left" align="center" valign="middle">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:ImageButton ID="ImageButton10" runat="server" AlternateText="less" CommandArgument='<%#Eval("pqtty1") %>'
                                                    CommandName="dec" Height="30px" ImageAlign="Middle" ImageUrl="~/images/minus-sign.png"
                                                    Width="30px" />
                                                <asp:TextBox ID="TextBox3" runat="server" Width="25px" text-align="center" BorderStyle="None" >1</asp:TextBox>
                                                x<asp:Label ID="pqtty2Label0" runat="server" CssClass="style17" Text='<%# Eval("pqtty2") %>' />
                                                <asp:ImageButton ID="ImageButton11" runat="server" AlternateText="increase" CommandArgument='<%#Eval("pqtty1") %>'
                                                    CommandName="inc" Height="30px" ImageAlign="Middle" ImageUrl="~/images/plus-sign.png"
                                                    Width="30px" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="text-align: center" class="style18">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%#Eval("pid")%>'
                                            CommandName="addtocart" Height="35px" ImageUrl="~/images/cart-c.png" Style="text-align: center"
                                            Width="37px" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="prod" runat="server" ConnectionString="<%$ ConnectionStrings:mdasConnectionString %>"
                        SelectCommand="SELECT [pid], [pname],[pimage], [pcat],[pqtty1], [pqtty2], [pprice] FROM [prodadd] where [pqtty1]>0">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
