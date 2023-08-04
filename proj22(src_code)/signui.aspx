<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true"
    CodeFile="signui.aspx.cs" Inherits="signui" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style11
        {
            height: 23px;
        }
        .style12
        {
            font-size: x-small;
        }
        .style13
        {
            height: 39px;
        }
        .signui
        {
            background-color:white;
            }
        .signui:hover
        {
            color:white;
        
            background-color:#94c842;
            }
        .style14
        {
            text-align: right;
            font-size: large;
            font-family: cursive;
        }
        .style15
        {
            width: 22%;
        }
        .txt
        {
            border-radius:3px;
            border:1px solid #808080;
            }
        .style16
        {
            height: 23px;
            width: 574px;
        }
        .style17
        {
            width: 574px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="font-family: cursive">
        <table class="style1">
            <tr>
                <td style="text-align: right" class="style13">
                    <asp:Button ID="Button2" type="button" class="signui" runat="server" Text="Log In" OnClick="Button2_Click" 
                        CausesValidation="false" Height="35px" Width="150px" 
                        style="border-radius:20px" BorderStyle="Groove" />
                </td>
                <td class="style13">
                    <asp:Button ID="Button3"  runat="server" Text="Sign Up" OnClick="Button3_Click" 
                        CausesValidation="false" Height="35px" Width="150px" 
                        style="border-radius:20px;" BorderStyle="Groove" class="signui"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="Panel2" runat="server">
                        <div id="in">
                            <div>
                                <table align="center" class="style1" style="width: 30%">
                                <tr>
                                                    <td colspan="3" >
                                                        <asp:Panel ID="Panel4" runat="server">
                                                            <table bgcolor="#FFCDCA" class="style1">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/cancel-b.png" />
                                                                    </td>
                                                                    <td>
                                                                        Sorry, we couldn&#39;t find an account with that username and password.Please try 
                                                                        again.</td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                    <tr>
                                        <td class="style10">
                                            <table class="style1" 
                                                style="padding: 5px; border-style: groove; border-color: #C0C0C0; background-color: #FFFFFF; border-radius: 8px;">
              
                                              
                                                <tr>
                                                    <td colspan="2" 
                                                        style="border-width: 1px; border-color: #666666; text-align: center; border-bottom-style: solid;">
                                                        <asp:Label ID="Label4" runat="server" BorderStyle="None" Font-Bold="True" 
                                                            Font-Size="XX-Large" Text="Login" style="text-align: center"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style7" colspan="2" style="text-align: left; font-size: medium">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td class="style7" colspan="2" style="text-align: left; font-size: medium">
                                                        E-Mail ID:<br />
                                                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="Gray" class="txt" 
                                                            Height="40px" Width="97%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style7" colspan="2" style="text-align: left; font-size: medium">
                                                        Password:<br />
                                                        <asp:TextBox ID="TextBox2" runat="server" Height="40px" TextMode="Password" 
                                                            Width="97%" class="txt"></asp:TextBox>
                                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/frgtnpass.aspx" 
                                                            style="text-align: right; font-size: small">Forgot Password?</asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style14" colspan="2">
                                                        &nbsp;
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style15">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="Button1" runat="server" Height="37px" OnClick="Button1_Click" Style="font-weight: 700;
                                                            text-align: center;border-radius:10px" Text="Log In" Width="99px" BackColor="#00CC00" 
                                                            BorderStyle="None" ForeColor="White"  />
                                                    </td>
                                                    <td width="24%">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                                                            style="font-size: small">No account yet?Start here</asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Panel ID="Panel1" runat="server">
                        <div>
                            <div class="content" style="text-align: center;">
                                <center>
                                <table>
                                    <tr>
                                        <td class="style17">
                                            <table class="style1" 
                                                
                                                style="padding: 5px; border-style: groove; border-color: #C0C0C0; background-color: #FFFFFF;border-radius:8px;">
                                                <tr>
                                                    <td style="border-width: 1px; border-color: #666666; text-align: left; border-bottom-style: solid;" 
                                                        colspan="3">
                                                        <asp:Label ID="Label5" runat="server" BorderStyle="None" Font-Bold="True" 
                                                            Font-Size="XX-Large" Text="Sign-Up"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label14" runat="server" Text="Its quick and easy." 
                                                            style="color: #666666"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left;">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align: bottom" width="58%" align="left">
                                                        Full Name<br />
                                                        <asp:TextBox ID="TextBox8" runat="server" Height="30px" 
                                                            placeholder="Ex:Bruce Wayne" Style="text-align: left;border:none;border-radius:3px;border:1px solid #808080;" 
                                                            Width="97%" BackColor="#EAEDE8" ForeColor="Black" 
                                                            ontextchanged="TextBox8_TextChanged" ></asp:TextBox>
                                                        
                                                    </td>
                                                    <td style="vertical-align: bottom" width="20%" align="left">
                                                        Age<br />
                                                        <asp:TextBox ID="TextBox9" runat="server" Height="30px" placeholder="10-99" 
                                                            Style="text-align: left;border:none;border-radius:3px;border:1px solid #808080;" 
                                                            Width="97%" BackColor="#EAEDE8" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                    <td style="vertical-align: bottom" width="20%" align="left">
                                                        Gender<br />
                                                        <asp:DropDownList ID="DropDownList1" runat="server"  Style="text-align: left;border:none;border-radius:3px;border:1px solid #808080;" 
                                                            Width="97%" Height="30px" BackColor="#EAEDE8">
                                                            <asp:ListItem>Male</asp:ListItem>
                                                            <asp:ListItem>Female</asp:ListItem>
                                                            <asp:ListItem>Others</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                            ControlToValidate="TextBox8" CssClass="style18" 
                                                            ErrorMessage="*Name cannot be empty" ForeColor="Red" 
                                                            style="font-size: small"></asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                            ControlToValidate="TextBox9" CssClass="style18" 
                                                            ErrorMessage="*Age field cannot be empty" ForeColor="Red" 
                                                            style="font-size: small"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                            ControlToValidate="TextBox9" CssClass="style18" ErrorMessage="*Invalid age" 
                                                            ForeColor="Red" ValidationExpression="[0-9]{2}" style="font-size: small"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        Mobile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-Mail
                                                        <br />
                                                        <asp:TextBox ID="TextBox3" runat="server" Height="30px" placeholder="10 digits" 
                                                            style="border:none;border-radius:3px;border:1px solid #808080;" 
                                                            Width="48%" BackColor="#EAEDE8" ForeColor="Black"></asp:TextBox>
                                                        <asp:TextBox ID="TextBox4" runat="server" Height="30px" 
                                                            placeholder="Ex:myname123@gmail.com" 
                                                            style="border:none;border-radius:3px;border:1px solid #808080;" 
                                                            Width="48%" BackColor="#EAEDE8" ForeColor="Black"></asp:TextBox>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                            ControlToValidate="TextBox3" CssClass="style18" 
                                                            ErrorMessage="*Mobile field cannot be empty" ForeColor="Red" 
                                                            style="font-size: small"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                            ControlToValidate="TextBox3" CssClass="style18" ErrorMessage="*Invalid number" 
                                                            ForeColor="Red" style="font-size: small" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                            ControlToValidate="TextBox4" CssClass="style18" 
                                                            ErrorMessage="*Email cannot be empty" ForeColor="Red" style="font-size: small"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        Residential Address<br />
                                                        <asp:TextBox ID="TextBox7" runat="server" Height="45px" placeholder="#,Street,Area,Region,City,Pincode" 
                                                            style="border:none;border-radius:3px;border:1px solid #808080;" 
                                                            TextMode="MultiLine" Width="97%" BackColor="#EAEDE8" ForeColor="Black"></asp:TextBox>
                                                        <br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                            ControlToValidate="TextBox7" CssClass="style18" 
                                                            ErrorMessage="*This field cannot be empty" ForeColor="Red" 
                                                            style="font-size: small"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        Password<br />
                                                        <asp:TextBox ID="TextBox5" runat="server" Height="30px" 
                                                            placeholder="Enter Password" 
                                                            style="border:none;border-radius:3px;border:1px solid #808080;" 
                                                            TextMode="Password" Width="48%" BackColor="#EAEDE8" ForeColor="Black"></asp:TextBox>
                                                        <asp:TextBox ID="TextBox6" runat="server" Height="30px" 
                                                            placeholder="Confirm Password" 
                                                            style="border:none;border-radius:3px;border:1px solid #808080;" 
                                                            TextMode="Password" Width="48%" BackColor="#EAEDE8" ForeColor="Black"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                                            ControlToValidate="TextBox5" CssClass="style18" 
                                                            ErrorMessage="*This field cannot be empty" ForeColor="Red" 
                                                            style="font-size: small"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                            ControlToCompare="TextBox5" ControlToValidate="TextBox6" CssClass="style18" 
                                                            ErrorMessage="*Password doesn't match" ForeColor="Red" style="font-size: small"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left; color: #666666">
                                                        <span class="style12">By clicking Sign Up,you agree to our Terms.Learn how we 
                                                        collect ,use and share your data in our Data Policy</span>.</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                    <center>
                                                        <asp:Button ID="Button4" runat="server" BorderStyle="none" Height="35px" 
                                                            OnClick="Button4_Click" Style="font-weight: 700; text-align: center;border-radius:10px; font-family: cursive;" 
                                                            Text="Sign Up" Width="175px" BackColor="#00CC00" ForeColor="White" />
                                                    </center>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                </center>
                            </div>
                        </div>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
