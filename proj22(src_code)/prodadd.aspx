<%@ Page Title="" Language="C#" MasterPageFile="~/adminmaster.master" AutoEventWireup="true"
    CodeFile="prodadd.aspx.cs" Inherits="prodadd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style11
        {
            
        }
        .style12
        {
            
            width: 56%;
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <div style="border: medium ridge #FFFFFF; background-color: #FFFFFF; text-align: left;">
    
        <table class="style1">
            <tr>
                <td class="style12" 
                    
                    
                    style="border: medium ridge #FFFFFF; background-color: #507CD1; color: #FFFFFF; text-align: center; font-size: x-large;">
                    <strong>PRODUCT ENTRY</strong></td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Placeholder="Product Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*this field cannot be empty" ControlToValidate="TextBox1" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="0">Select Category</asp:ListItem>
                        <asp:ListItem>Milk/Diary</asp:ListItem>
                        <asp:ListItem>Beverages</asp:ListItem>
                        <asp:ListItem>Fruits</asp:ListItem>
                        <asp:ListItem>Vegetables</asp:ListItem>
                        <asp:ListItem>Spices</asp:ListItem>
                        <asp:ListItem>Dry foods</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:TextBox ID="TextBox2" runat="server" Placeholder="Quantity"></asp:TextBox>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem Value="0">SELECT</asp:ListItem>
                        <asp:ListItem>Kg</asp:ListItem>
                        <asp:ListItem>ltr</asp:ListItem>
                        <asp:ListItem>Pack</asp:ListItem>
                        <asp:ListItem>Bunch</asp:ListItem>
                        <asp:ListItem>100g</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="*this field cannot be empty" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:TextBox ID="TextBox3" runat="server" Placeholder="Price(per quantity)"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*this field cannot be empty" ControlToValidate="TextBox3" 
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" />
                </td>
            </tr>
        </table>
    
    </div>

</asp:Content>
